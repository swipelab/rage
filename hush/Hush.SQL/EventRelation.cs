using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_relations")]
  public class EventRelation
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("relates_to_id")] public string RelatedEventId { get; set; }
    [Column("relation_type")] public string Kind { get; set; }
    [Column("aggregation_key")] public string Key { get; set; }
  }
}