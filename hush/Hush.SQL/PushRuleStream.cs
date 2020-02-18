using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("push_rules_stream")]
  public class PushRuleStream
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("event_stream_ordering")] public long EventStreamOrdering { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("rule_id")] public string RuleId { get; set; }
    [Column("op")] public string Op { get; set; }
    [Column("priority_class")] public short PriorityClass { get; set; }
    [Column("priority")] public int Priority { get; set; }
    [Column("conditions")] public string Conditions { get; set; }
    [Column("actions")] public string Actions { get; set; }
  }
}