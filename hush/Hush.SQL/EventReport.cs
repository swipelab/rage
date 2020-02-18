using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_reports")]
  public class EventReport
  {
    [Column("id")] public long Id { get; set; }
    [Column("received_ts")] public long ReceivedAt { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("reason")] public string Reason { get; set; }
    [Column("content")] public string Content { get; set; }
  }
}