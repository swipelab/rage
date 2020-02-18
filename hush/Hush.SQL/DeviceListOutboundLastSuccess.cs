using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_lists_outbound_last_success")]
  public class DeviceListOutboundLastSuccess
  {
    [Column("destination")] public string Destination { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
  }
}