using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_push_summary")]
  public class EventPushSummary
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("notif_count")] public long NotifCount { get; set; }
    [Column("stream_ordering")] public long StreamOrdering { get; set; }
  }
}