using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using ghost.WebRTC;

namespace ghost.Pipe
{
  public static class Extension
  {
    public static void Pipe<T>(this EventHandler<PipeMessage<T>> handler, string pid, string json)
    {
      handler?.Invoke(null, new PipeMessage<T>
      {
        Pid = pid,
        Data = JsonSerializer.Deserialize<T>(json)
      });
    }
  }

  public class Calls
  {
    public const string New = "new";
    public const string Bye = "bye";
    public const string Offer = "offer";
    public const string Answer = "answer";
    public const string Candidate = "candidate";
    public const string KeepAlive = "keepalive";

    public event EventHandler<PipeMessage<CallMessageNew>> OnNew;
    public event EventHandler<PipeMessage<CallMessageBye>> OnBye;
    public event EventHandler<PipeMessage<CallMessageOffer>> OnOffer;
    public event EventHandler<PipeMessage<CallMessageAnswer>> OnAnswer;
    public event EventHandler<PipeMessage<CallMessageCandidate>> OnCandidate;
    public event EventHandler<PipeMessage<CallMessageKeepAlive>> OnKeepAlive;

    public Task Pipe(string pid, string json)
    {
      var payload = JsonSerializer.Deserialize<Payload>(json); // TODO: MAYBE FASTER
      switch (payload.Type)
      {
        case New:
          OnNew.Pipe(pid, json);
          break;
        case Bye:
          OnBye.Pipe(pid, json);
          break;
        case Offer:
          OnOffer.Pipe(pid, json);
          break;
        case Answer:
          OnAnswer.Pipe(pid, json);
          break;
        case Candidate:
          OnCandidate.Pipe(pid, json);
          break;
        case KeepAlive:
          OnKeepAlive.Pipe(pid, json);
          break;
        default:
          break;
      }

      return Task.CompletedTask;
    }

    public static string Peers(IEnumerable<CallMessagePeer> peers)
    {
      return JsonSerializer.Serialize(new
      {
        type = "peers",
        data = peers.ToList()
      });
    }

    public static string Error(string error)
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
  }

  public class Payload
  {
    [JsonPropertyName("type")] public string Type { get; set; }
  }

  public class MxSession
  {
    public string Id { get; set; }
  }

  public class CallMessagePeer : ICallMessage
  {
    [JsonPropertyName("id")] public string Id { get; set; }
    [JsonPropertyName("name")] public string Name { get; set; }
    [JsonPropertyName("user_agent")] public string UserAgent { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
  }

  public class PipeMessage<TMessage>
  {
    public string Pid;
    public TMessage Data { get; set; }
  }

  public class CallMessageNew : ICallMessage
  {
    [JsonPropertyName("name")] public string Name { get; set; }
    [JsonPropertyName("user_agent")] public string UserAgent { get; set; }
    [JsonPropertyName("id")] public string Id { get; set; }
  }

  public class CallMessageBye : ICallMessage
  {
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
  }

  public class CallMessageOffer : ICallMessage
  {
    [JsonPropertyName("to")] public string To { get; set; }
    [JsonPropertyName("description")] public SessionDescription Description { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
    [JsonPropertyName("media")] public string Media { get; set; }
  }

  public class CallMessageAnswer : ICallMessage
  {
    [JsonPropertyName("to")] public string To { get; set; }
    [JsonPropertyName("description")] public SessionDescription Description { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
  }

  public class CallMessageCandidate : ICallMessage
  {
    [JsonPropertyName("to")] public string To { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
    [JsonPropertyName("candidate")] public IceCandidate Candidate { get; set; }
  }

  public class CallMessageKeepAlive : ICallMessage
  {
  }
}