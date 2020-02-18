using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_to_state_groups")]
  public class EventStateGroup
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("state_group")] public long StateGroup { get; set; }
  }
}