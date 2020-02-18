using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("users_in_public_rooms")]
  public class UserInPublicRoom
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
  }
}