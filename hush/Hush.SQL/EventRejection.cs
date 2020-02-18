using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("rejections")]
  public class EventRejection
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("reason")] public string Reason { get; set; }
    [Column("last_check")] public string LastCheck { get; set; }
  }
}