using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_federation_outbox")]
  public class DeviceFederationOutbox
  {
    [Column("destination")] public string Destination { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("queued_ts")] public long QueuedAt { get; set; }
    [Column("messages_json")] public string MessageJson { get; set; }
  }
}