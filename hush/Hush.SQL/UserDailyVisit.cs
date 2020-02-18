using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_daily_visits")]
  public class UserDailyVisit
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("timestamp")] public long At { get; set; }
  }
}