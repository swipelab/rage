using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_rooms")]
  public class GroupRoom
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}