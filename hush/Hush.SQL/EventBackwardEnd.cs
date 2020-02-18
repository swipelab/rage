using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_backward_extremities")]
  public class EventBackwardEnd
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
  }
}