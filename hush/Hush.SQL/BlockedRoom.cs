using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("blocked_rooms")]
  public class BlockedRoom
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
  }
}