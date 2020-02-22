using System.Text.Json.Serialization;
using ghost.WebRTC;

namespace ghost.Calls
{
  public static class Events
  {
    public const string JOIN = "new";
    public const string LEAVE = "bye";
    public const string OFFER = "offer";
    public const string ANSWER = "answer";
    public const string CANDIDATE = "candidate";
    public const string TICK = "keepalive";
    
    public class Peer
    {
      [JsonPropertyName("id")] public string Id { get; set; }
      [JsonPropertyName("name")] public string Name { get; set; }
      [JsonPropertyName("user_agent")] public string UserAgent { get; set; }
      [JsonPropertyName("session_id")] public string SessionId { get; set; }
    }

    public class Join : IEvent
    {
      [JsonPropertyName("name")] public string Name { get; set; }
      [JsonPropertyName("user_agent")] public string UserAgent { get; set; }
      [JsonPropertyName("id")] public string Id { get; set; }
    }

    public class Leave : IEvent
    {
      [JsonPropertyName("session_id")] public string SessionId { get; set; }
    }

    public class Offer : IEvent
    {
      [JsonPropertyName("to")] public string To { get; set; }
      [JsonPropertyName("description")] public SessionDescription Description { get; set; }
      [JsonPropertyName("session_id")] public string SessionId { get; set; }
      [JsonPropertyName("media")] public string Media { get; set; }
    }

    public class Answer : IEvent
    {
      [JsonPropertyName("to")] public string To { get; set; }
      [JsonPropertyName("description")] public SessionDescription Description { get; set; }
      [JsonPropertyName("session_id")] public string SessionId { get; set; }
    }

    public class Candidate : IEvent
    {
      [JsonPropertyName("to")] public string To { get; set; }
      [JsonPropertyName("session_id")] public string SessionId { get; set; }
      [JsonPropertyName("candidate")] public IceCandidate Iced { get; set; }
    }

    public class Ticked : IEvent
    {
    }

    public class Payload
    {
      [JsonPropertyName("type")] public string Kind { get; set; }
    }
    
    public interface IEvent
    {
    }
  }
}