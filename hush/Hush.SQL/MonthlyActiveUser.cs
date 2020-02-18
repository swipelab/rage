using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("monthly_active_users")]
  public class MonthlyActiveUser
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("timestamp")] public long At { get; set; }
  }
}