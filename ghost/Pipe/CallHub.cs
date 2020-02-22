using System;
using System.Collections.Generic;
using System.IO.Pipes;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using Microsoft.Extensions.Logging;

namespace ghost.Pipe
{
  public class CallHub : RocketHub
  {
    private readonly ILogger _logger;
    private readonly Calls _calls;
    private readonly Dictionary<string, CallMessagePeer> _mapPidPeer = new Dictionary<string, CallMessagePeer>();

    private readonly List<(string id, string pid)> _refs = new List<(string id, string pid)>();
    private readonly List<MxSession> _sessions = new List<MxSession>();

    public CallHub(RocketMap rocketMap, ILogger<CallHub> logger) : base(rocketMap)
    {
      _logger = logger;
      _calls = Connect(new Calls());
    }

    public void Dispose()
    {
      Disconnect(_calls);
    }

    private Calls Connect(Calls calls)
    {
      calls.OnNew += OnNew;
      calls.OnBye += OnBye;
      calls.OnOffer += OnOffer;
      calls.OnAnswer += OnAnswer;
      calls.OnCandidate += OnCandidate;
      calls.OnKeepAlive += OnKeepAlive;

      return calls;
    }

    private void Disconnect(Calls calls)
    {
      calls.OnNew -= OnNew;
      calls.OnBye -= OnBye;
      calls.OnOffer -= OnOffer;
      calls.OnAnswer -= OnAnswer;
      calls.OnCandidate -= OnCandidate;
      calls.OnKeepAlive -= OnKeepAlive;
    }

    private void OnNew(object sender, PipeMessage<CallMessageNew> e)
    {
      _mapPidPeer[e.Pid] = new CallMessagePeer
      {
        Id = e.Data.Id,
        Name = e.Data.Name,
        UserAgent = e.Data.UserAgent,
      };
      _refs.Add((e.Data.Id, e.Pid));

      this.BroadcastPeers();
    }

    private void OnBye(object sender, PipeMessage<CallMessageBye> e)
    {
      var session = _sessions.FirstOrDefault(x => x.Id == e.Data.SessionId);
      if (session == null)
      {
        this.Send(e.Pid, Calls.Error($"invalid session_id : {e.Data.SessionId}"));
        return;
      }

      foreach (var peer in this._mapPidPeer.Values)
      {
        if (peer.SessionId == e.Data.SessionId)
        {
        }
      }
    }

    private void OnOffer(object sender, PipeMessage<CallMessageOffer> e)
    {
      var from = this._refs.FirstOrDefault(x => x.pid == e.Pid);
      var to = _refs.FirstOrDefault(x => x.id == e.Data.To);

      _mapPidPeer[from.pid].SessionId = e.Data.SessionId;

      var msg = JsonSerializer.Serialize(new
      {
        type = "offer",
        data = new
        {
          from = from.id,
          to = to.id,
          media = e.Data.Media,
          description = e.Data.Description,
          session_id = e.Data.SessionId
        }
      });
      this.Send(to.pid, msg);
    }

    private void OnAnswer(object sender, PipeMessage<CallMessageAnswer> e)
    {
      var from = this.RefByPid(e.Pid);
      var to = this.RefById(e.Data.To);

      var msg = JsonSerializer.Serialize(new
      {
        type = "answer",
        data = new
        {
          from = from.id,
          to = to.id,
          description = e.Data.Description,
          session_id = e.Data.SessionId
        }
      });
      this.Send(to.pid, msg);
    }

    private void OnCandidate(object sender, PipeMessage<CallMessageCandidate> e)
    {
      var from = this.RefByPid(e.Pid);
      var to = this.RefById(e.Data.To);

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

    private void OnKeepAlive(object sender, PipeMessage<CallMessageKeepAlive> e)
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
      var pid = RocketMap.Pid(ws);
      var msg = Encoding.UTF8.GetString(buffer, 0, result.Count);
      await _calls.Pipe(pid, msg);
      _logger.LogInformation($"recv:{pid}:{msg}");
    }

    private void BroadcastPeers()
    {
      var msg = Calls.Peers(_mapPidPeer.Values);
      this.Broadcast(msg);
    }

    private (string id, string pid) RefById(string id) => this._refs.FirstOrDefault(x => x.id == id);
    private (string id, string pid) RefByPid(string pid) => this._refs.FirstOrDefault(x => x.pid == pid);
  }
}