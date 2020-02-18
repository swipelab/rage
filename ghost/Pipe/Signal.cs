using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Json;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace ghost.Pipe
{
  public interface IMx
  {
  }

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

  public class Signal
  {
    public const string New = "new";
    public const string Bye = "bye";
    public const string Offer = "offer";
    public const string Answer = "answer";
    public const string Candidate = "candidate";
    public const string KeepAlive = "keepalive";

    public event EventHandler<PipeMessage<MxNew>> OnNew;
    public event EventHandler<PipeMessage<MxBye>> OnBye;
    public event EventHandler<PipeMessage<MxOffer>> OnOffer;
    public event EventHandler<PipeMessage<MxAnswer>> OnAnswer;
    public event EventHandler<PipeMessage<MxCandidate>> OnCandidate;
    public event EventHandler<PipeMessage<MxKeepAlive>> OnKeepAlive;


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

    public static string Peers(IEnumerable<MxPeer> peers)
    {
      return JsonSerializer.Serialize(new
      {
        type = "peers",
        data = peers.ToList()
      });
    }
  }

  public class Payload
  {
    [JsonPropertyName("type")] public string Type { get; set; }
  }

  public class MxPeer : IMx
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

  public class MxNew : IMx
  {
    [JsonPropertyName("name")] public string Name { get; set; }
    [JsonPropertyName("user_agent")] public string UserAgent { get; set; }
    [JsonPropertyName("id")] public string Id { get; set; }
  }

  public class MxBye : IMx
  {
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
  }

  public class MxOffer : IMx
  {
    [JsonPropertyName("to")] public string To { get; set; }
    [JsonPropertyName("description")] public RtcSessionDescription Description { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
    [JsonPropertyName("media")] public string Media { get; set; }
  }

  public class MxAnswer : IMx
  {
    [JsonPropertyName("to")] public string To { get; set; }
    [JsonPropertyName("description")] public RtcSessionDescription Description { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
  }

  public class MxCandidate : IMx
  {
    [JsonPropertyName("to")] public string To { get; set; }
    [JsonPropertyName("session_id")] public string SessionId { get; set; }
    [JsonPropertyName("candidate")] public RtcIceCandidate Candidate { get; set; }
  }

  public class RtcSessionDescription
  {
    [JsonPropertyName("sdp")] public string Sdp { get; set; }

    /// <summary>
    /// Can be - Answer | Offer
    /// </summary>
    [JsonPropertyName("type")]
    public string Type { get; set; }
  }

  public class RtcIceCandidate
  {
    [JsonPropertyName("sdpMLineIndex")] public int SdpMLineIndex { get; set; }
    [JsonPropertyName("spdMid")] public string SdpMid { get; set; }
    [JsonPropertyName("candidate")] public string Candidate { get; set; }
  }

  public class MxKeepAlive : IMx
  {
  }
}