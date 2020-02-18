using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_reference_hash")]
  public class EventReferenceHash
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("algorithm")] public string Algorithm { get; set; }
    [Column("hash")] public byte[] Hash { get; set; }
  }
}