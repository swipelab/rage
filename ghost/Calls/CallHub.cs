using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;
using ghost.Rockets;
using Microsoft.Extensions.Logging;

namespace ghost.Calls
{
  public class CallHub : RocketHub
  {
    private RocketMap Map { get; }

    public CallHub(RocketMap map, ILogger<CallHub> logger)
    {
      Map = map;
      _logger = logger;
    }

    public Task Send(string pid, string msg) => Send(Map.Socket(pid), msg);
    public Task Broadcast(string msg) => Task.WhenAll(Map.Index.Values.Select(ws => Send(ws, msg)));

    private static string Peers(IEnumerable<Events.Peer> peers)
    {
      return JsonSerializer.Serialize(new
      {
        type = "peers",
        data = peers.ToList()
      });
    }

    private static string Error(string error)
    {
      return JsonSerializer.Serialize(new
      {
        type = "error",
        data = new
        {
          error = error
        }
      });
    }

    private static string Bye(string sessionId, string to)
    {
      return JsonSerializer.Serialize(new
      {
        type = "bye",
        data = new
        {
          session_id = sessionId,
          to
        }
      });
    }


    private Task Pipe<T>(Func<Piped<T>, Task> func, string pid, string json)
    {
      var piped = new Piped<T>
      {
        Pid = pid,
        Data = JsonSerializer.Deserialize<T>(json)
      };
      return func?.Invoke(piped);
    }

    private readonly ILogger _logger;
    private readonly Dictionary<string, Events.Peer> _mapPeers = new Dictionary<string, Events.Peer>();

    private readonly List<(string id, string pid)> _refs = new List<(string id, string pid)>();
    private readonly List<Session> _calls = new List<Session>();


    public void Dispose()
    {
    }


    private Task OnJoin(Piped<Events.Join> e)
    {
      _mapPeers[e.Pid] = new Events.Peer
      {
        Id = e.Data.Id,
        Name = e.Data.Name,
        UserAgent = e.Data.UserAgent,
      };
      _refs.Add((e.Data.Id, e.Pid));

      return this.BroadcastPeers();
    }

    private async Task OnBye(Piped<Events.Leave> e)
    {
      var sessionId = e.Data.SessionId;
      var session = this._calls.FirstOrDefault(x => x.Id == e.Data.SessionId);
      if (session == null)
      {
        await this.Send(e.Pid, Error($"invalid session_id : {e.Data.SessionId}"));
        return;
      }

      var peers = _mapPeers.Values
        .Where(x => x.SessionId == sessionId)
        .ToList();

      foreach (var peer in peers)
      {
        var (_, pid) = RefById(peer.Id);
        await this.Send(pid, Bye(sessionId, peer.Id == session.From ? session.To : session.From));
      }
    }

    private async Task OnOffer(Piped<Events.Offer> e)
    {
      var from = this._refs.FirstOrDefault(x => x.pid == e.Pid);
      var to = _refs.FirstOrDefault(x => x.id == e.Data.To);

      var session = new Session
      {
        Id = e.Data.SessionId,
        From = from.id,
        To = to.id
      };

      _calls.Add(session);

      _mapPeers[from.pid].SessionId = session.Id;
      _mapPeers[to.pid].SessionId = session.Id;

      var msg = JsonSerializer.Serialize(new
      {
        type = "offer",
        data = new
        {
          from = from.id,
          to = to.id,
          session_id = e.Data.SessionId,
          media = e.Data.Media,
          description = e.Data.Description,
        }
      });
      await this.Send(to.pid, msg);
    }

    private async Task OnAnswer(Piped<Events.Answer> e)
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
      await this.Send(to.pid, msg);
    }

    private async Task OnCandidate(Piped<Events.Candidate> e)
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
            candidate = e.Data.Iced
          }
        }
      );

      await this.Send(to.pid, msg);
    }

    private async Task OnTick(Piped<Events.Ticked> e)
    {
      var msg = JsonSerializer.Serialize(new
      {
        type = "keepalive",
        data = new { }
      });
      await this.Send(e.Pid, msg);
    }

    public override async Task OnConnected(WebSocket ws)
    {
      Map.Add(ws);
    }

    public override async Task OnDisconnected(WebSocket ws)
    {
      var pid = Map.Pid(ws);
      _mapPeers.Remove(pid);
      await Map.Remove(pid);

      await this.BroadcastPeers();
    }

    public override async Task Receive(WebSocket ws, WebSocketReceiveResult result, byte[] buffer)
    {
      var pid = Map.Pid(ws);
      var msg = Encoding.UTF8.GetString(buffer, 0, result.Count);

      var payload = JsonSerializer.Deserialize<Events.Payload>(msg); // TODO: MAYBE FASTER
      switch (payload.Kind)
      {
        case Events.JOIN:
          await Pipe<Events.Join>(OnJoin, pid, msg);
          break;
        case Events.LEAVE:
          await Pipe<Events.Leave>(OnBye, pid, msg);
          break;
        case Events.OFFER:
          await Pipe<Events.Offer>(OnOffer, pid, msg);
          break;
        case Events.ANSWER:
          await Pipe<Events.Answer>(OnAnswer, pid, msg);
          break;
        case Events.CANDIDATE:
          await Pipe<Events.Candidate>(OnCandidate, pid, msg);
          break;
        case Events.TICK:
          await Pipe<Events.Ticked>(OnTick, pid, msg);
          break;
        default:
          break;
      }

      _logger.LogInformation($"recv:{pid}:{msg}");
    }

    private Task BroadcastPeers()
    {
      var msg = Peers(_mapPeers.Values);
      return this.Broadcast(msg);
    }

    private (string id, string pid) RefById(string id) => this._refs.FirstOrDefault(x => x.id == id);
    private (string id, string pid) RefByPid(string pid) => this._refs.FirstOrDefault(x => x.pid == pid);
  }
}