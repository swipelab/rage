using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_lists_remote_cache")]
  public class DeviceListRemoteCache
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("content")] public string Content { get; set; }
  }
}