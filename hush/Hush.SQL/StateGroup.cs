using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("state_groups")]
  public class StateGroup
  {
    [Key] [Column("id")] public long Id { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("event_id")] public string EventId { get; set; }
  }
}