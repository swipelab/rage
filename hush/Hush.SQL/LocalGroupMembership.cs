using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("local_group_membership")]
  public class LocalGroupMembership
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("is_admin")] public bool IsAdmin { get; set; }
    [Column("membership")] public string Membership { get; set; }
    [Column("is_publicised")] public bool IsPublicised { get; set; }
    [Column("content")] public string Content { get; set; }
  }
}