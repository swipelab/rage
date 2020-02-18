using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_ratelimit_override")]
  public class UserLimit
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("messages_per_second")] public long Mps { get; set; }
    [Column("burst_count")] public long BurstCount { get; set; }
  }
}