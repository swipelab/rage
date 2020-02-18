using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("state_events")]
  public class StateEvent
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("type")] public string Kind { get; set; }
    [Column("state_key")] public string Key { get; set; }
    [Column("prev_state")] public string? PrevState { get; set; }
  }
}