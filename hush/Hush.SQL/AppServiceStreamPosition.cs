using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("appservice_stream_position")]
  public class AppServiceStreamPosition
  {
    [Column("lock")] public string Lock { get; set; }
    [Column("stream_ordering")] public long StreamId { get; set; }
  }
}