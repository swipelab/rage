using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_inbox")]
  public class DeviceInbox
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("stream_id")] public string StreamId { get; set; }
    [Column("message_json")] public string MessageJson { get; set; }
  }
}