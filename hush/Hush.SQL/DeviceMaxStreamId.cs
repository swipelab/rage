using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_max_stream_id")]
  public class DeviceMaxStreamId
  {
    [Column("stream_id")]
    public long StreamId { get; set; }
  }
}