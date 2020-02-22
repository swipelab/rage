using System.Text.Json.Serialization;

namespace ghost.WebRTC
{
  public class IceCandidate
  {
    [JsonPropertyName("sdpMLineIndex")] public int SdpMLineIndex { get; set; }
    [JsonPropertyName("sdpMid")] public string SdpMid { get; set; }
    [JsonPropertyName("candidate")] public string Candidate { get; set; }
  }
}