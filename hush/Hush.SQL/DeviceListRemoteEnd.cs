using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_lists_remote_extremities")]
  public class DeviceListRemoteEnd
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("stream_id")] public string StreamId { get; set; }
  }
}