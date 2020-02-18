using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_push_summary_stream_ordering")]
  public class EventPushSummaryStreamOrdering
  {
    [Column("lock")] public string Lock { get; set; }
    [Column("stream_ordering")] public long StreamOrdering { get; set; }
  }
}