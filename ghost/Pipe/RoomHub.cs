using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace ghost.Pipe
{
  public class RoomHub : PipeHub
  {
    private readonly ILogger _logger;
    private readonly Signal _signal;
    private readonly Dictionary<string, MxPeer> _peer = new Dictionary<string, MxPeer>();

    private readonly List<(string id, string pid)> _links = new List<(string id, string pid)>();


    public RoomHub(PipeMap pipeMap, ILogger<RoomHub> logger) : base(pipeMap)
    {
      _logger = logger;
      _signal = Connect(new Signal());
    }

    public void Dispose()
    {
      Disconnect(_signal);
    }

    private Signal Connect(Signal signal)
    {
      signal.OnNew += OnNew;
      signal.OnBye += OnBye;
      signal.OnOffer += OnOffer;
      signal.OnAnswer += OnAnswer;
      signal.OnCandidate += OnCandidate;
      signal.OnKeepAlive += OnKeepAlive;

      return signal;
    }

    private void Disconnect(Signal signal)
    {
      signal.OnNew -= OnNew;
      signal.OnBye -= OnBye;
      signal.OnOffer -= OnOffer;
      signal.OnAnswer -= OnAnswer;
      signal.OnCandidate -= OnCandidate;
      signal.OnKeepAlive -= OnKeepAlive;
    }


    private void OnNew(object sender, PipeMessage<MxNew> e)
    {
      _peer[e.Pid] = new MxPeer
      {
        Id = e.Data.Id,
        Name = e.Data.Name,
        UserAgent = e.Data.UserAgent,
      };

      _links.Add((e.Data.Id, e.Pid));

      var msg = Signal.Peers(_peer.Values);
      _logger.LogInformation("broadcast: " + msg);
      this.Broadcast(msg);
    }

    private void OnBye(object sender, PipeMessage<MxBye> e)
    {
      
    }

    private void OnOffer(object sender, PipeMessage<MxOffer> e)
    {
      var from = this._links.FirstOrDefault(x => x.pid == e.Pid);
      var to = _links.FirstOrDefault(x => x.id == e.Data.To);

      var msg = JsonSerializer.Serialize(new
      {
        type = "offer",
        data = new
        {
          from = from.id,
          to = to.id,
          media = e.Data.Media,
          description = e.Data.Description
        }
      });
      this.Send(to.pid, msg);
    }

    private void OnAnswer(object sender, PipeMessage<MxAnswer> e)
    {
      var from = this._links.FirstOrDefault(x => x.pid == e.Pid);
      var to = _links.FirstOrDefault(x => x.id == e.Data.To);

      var msg = JsonSerializer.Serialize(new
      {
        type = "answer",
        data = new
        {
          from = from.id,
          to = to.id,
          description = e.Data.Description
        }
      });
      this.Send(to.pid, msg);
    }

    private void OnCandidate(object sender, PipeMessage<MxCandidate> e)
    {
      var from = this._links.FirstOrDefault(x => x.pid == e.Pid);
      var to = _links.FirstOrDefault(x => x.id == e.Data.To);
      var msg = JsonSerializer.Serialize(new
        {
          type = "candidate",
          data = new
          {
            from = from.id,
            to = to.id,
            candidate = e.Data.Candidate
          }
        }
      );
      this.Send(to.pid, msg);
    }

    private void OnKeepAlive(object sender, PipeMessage<MxKeepAlive> e)
    {
      var msg = JsonSerializer.Serialize(new
      {
        type = "keepalive",
        data = new { }
      });
      this.Send(e.Pid, msg);
    }

    public override async Task OnConnected(WebSocket ws)
    {
      await base.OnConnected(ws);
      //var pid = PipeMap.Pid(ws);
      //var msg = $"{pid} connected";
      //await Broadcast(msg);
    }

    public override async Task Receive(WebSocket ws, WebSocketReceiveResult result, byte[] buffer)
    {
      var pid = PipeMap.Pid(ws);
      var msg = Encoding.UTF8.GetString(buffer, 0, result.Count);
      await _signal.Pipe(pid, msg);
      _logger.LogInformation($"recv:{pid}:{msg}");
    }
  }
}