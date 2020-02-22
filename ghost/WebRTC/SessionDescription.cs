using System.Text.Json.Serialization;

namespace ghost.WebRTC
{
  public class SessionDescription
  {
    [JsonPropertyName("sdp")] public string Sdp { get; set; }

    /// <summary>
    /// Can be - Answer | Offer
    /// </summary>
    [JsonPropertyName("type")]
    public string Type { get; set; }
  }
}