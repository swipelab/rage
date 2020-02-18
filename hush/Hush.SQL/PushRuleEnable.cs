using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("push_rules_enable")]
  public class PushRuleEnable
  {
    [Key] [Column("id")] public long Id { get; set; }
    [Column("user_name")] public string UserName { get; set; }
    [Column("rule_id")] public string RuleId { get; set; }
    [Column("enabled")] public short Enabled { get; set; }
  }
}