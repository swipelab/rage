using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("stats_stream_pos")]
  public class StatStreamPosition
  {
    [Column("lock")] public string Lock { get; private set; }
    [Column("stream_id")] public long StreamId { get; set; }
  }
}