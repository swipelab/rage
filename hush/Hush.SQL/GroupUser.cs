using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_users")]
  public class GroupUser
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("is_admin")] public bool IsAdmin { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}