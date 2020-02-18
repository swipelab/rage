using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("e2e_one_time_keys_json")]
  public class E2EOnceKey
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("algorithm")] public string Algorithm { get; set; }
    [Column("key_id")] public string KeyId { get; set; }
    [Column("ts_added_ms")] public long AddedAt { get; set; }
    [Column("key_json")] public string KeyJson { get; set; }
  }
}