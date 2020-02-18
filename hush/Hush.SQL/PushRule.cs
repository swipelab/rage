using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("push_rules")]
  public class PushRule
  {
    [Key] [Column("id")] public long Id { get; set; }
    [Column("user_name")] public string UserName { get; set; }
    [Column("rule_id")] public string RuleId { get; set; }
    [Column("priority_class")] public short PriorityClass { get; set; }
    [Column("priority")] public int Priority { get; set; }
    [Column("conditions")] public string Conditions { get; set; }
    [Column("actions")] public string Actions { get; set; }
  }
}