using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("current_state_event")]
  public class CurrentStateEvent
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("type")] public string Kind { get; set; }
    [Column("state_key")] public string Key { get; set; }
  }
}