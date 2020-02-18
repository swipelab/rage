using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_summary_roles")]
  public class GroupSummaryRole
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("role_id")] public string RoleId { get; set; }
    [Column("role_order")] public long RoleOrder { get; set; }
  }
}