using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_invites")]
  public class GroupInvite
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
  }
}