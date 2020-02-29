using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  [Table("room_member")]
  public class RxRoomMember
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("user_id")] public string UserId { get; set; }    
  }
}