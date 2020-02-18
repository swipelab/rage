using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("destinations")]
  public class Destination
  {
    [Column("destination")] public string Id { get; set; }
    [Column("retry_last_ts")] public long? RetryLastAt { get; set; }
    [Column("retry_interval")] public int? RetryInterval { get; set; }
  }
}