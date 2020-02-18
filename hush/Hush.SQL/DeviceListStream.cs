using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("device_list_stream")]
  public class DeviceListStream
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
  }
}