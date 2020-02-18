using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_summary_users")]
  public class GroupSummaryUser
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("role_id")] public string RoleId { get; set; }
    [Column("user_order")] public long UserOrder { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}