using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_roles")]
  public class GroupRole
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("role_id")] public string RoleId { get; set; }
    [Column("profile")] public string Profile { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}