using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_lists_outbound_pokes")]
  public class DeviceListOutboundPoke
  {
    [Column("destination")] public string? Destination { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("sent")] public bool IsSent { get; set; }
    [Column("ts")] public long At { get; set; }
  }
}