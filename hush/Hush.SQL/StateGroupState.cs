using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("state_groups_state")]
  public class StateGroupState
  {
    [Column("state_group")] public long StateGroup { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("type")] public string Kind { get; set; }
    [Column("state_key")] public string Key { get; set; }
    [Column("event_id")] public string EventId { get; set; }
  }
}