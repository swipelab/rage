using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("pusher_throttle")]
  public class PusherThrottle
  {
    [Column("pusher")] public long PusherId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("last_sent_ts")] public long LastSentAt { get; set; }
    [Column("throttle_ms")] public long Duration { get; set; }
  }
}