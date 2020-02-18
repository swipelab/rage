using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("devices")]
  public class Device
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("device_id")] public string DeviceId { get; set; }
    [Column("display_name")] public string? Name { get; set; }
  }
}