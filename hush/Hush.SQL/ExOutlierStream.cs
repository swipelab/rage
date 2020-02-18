using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("ex_outlier_stream")]
  public class ExOutlierStream
  {
    [Column("event_stream_ordering")] public long EventStreamOrdering { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("state_group")] public long StateGroup { get; set; }
  }
}