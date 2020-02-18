using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("e2e_device_keys_json")]
  public class E2EDeviceKey
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("ts_added_ms")] public long AddedAt { get; set; }
    [Column("key_json")] public string KeyJson { get; set; }
  }
}