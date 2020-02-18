using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_depth")]
  public class RoomDepth
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("min_depth")] public int MinDepth { get; set; }
  }
}