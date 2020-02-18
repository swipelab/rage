using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_ips")]
  public class UserIp
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("access_token")] public string AccessToken { get; set; }
    [Column("device_id")] public string? DeviceId { get; set; }
    [Column("ip")] public string Ip { get; set; }
    [Column("user_agent")] public string UserAgent { get; set; }
    [Column("last_seen")] public long LastSeenAt { get; set; }
  }
}