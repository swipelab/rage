using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("redactions")]
  public class EventRedaction
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("redacts")] public string Redacts { get; set; }
  }
}