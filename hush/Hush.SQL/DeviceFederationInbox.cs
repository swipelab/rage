using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_federation_inbox")]
  public class DeviceFederationInbox
  {
    [Column("origin")] public string Origin { get; set; }
    [Column("message_id")] public string MessageId { get; set; }
    [Column("received_ts")] public long ReceivedAt { get; set; }
  }
}