using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_room_categories")]
  public class GroupRoomCategory
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("category_id")] public string CategoryId { get; set; }
    [Column("profile")] public string Profile { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}