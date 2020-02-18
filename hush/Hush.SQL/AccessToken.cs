using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("access_token")]
  public class AccessToken
  {
    [Column("id")] public long Id { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("last_used")] public long LastUsed { get; set; }
    [Column("token")] public string Token { get; set; }
  }
}