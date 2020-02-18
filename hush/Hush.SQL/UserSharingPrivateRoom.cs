using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_wh_share_private_rooms")]
  public class UserSharingPrivateRoom
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("other_user_id")] public string OtherUserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
  }
}