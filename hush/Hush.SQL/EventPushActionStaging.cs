using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_push_actions_staging")]
  public class EventPushActionStaging
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("actions")] public string Actions { get; set; }
    [Column("notif")] public short Notif { get; set; }
    [Column("highlight")] public short Highlight { get; set; }
  }
}