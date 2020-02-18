using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_edges")]
  public class EventEdge
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("prev_event_id")] public string PrevEventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("is_state")] public bool IsState { get; set; }
  }
}