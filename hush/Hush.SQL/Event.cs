using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("events")]
  public class Event
  {
    [Key] [Column("stream_ordering")] public int StreamOrdering { get; set; }
    [Column("topological_ordering")] public long TopologicalOrdering { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("type")] public string Kind { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("content")] public string Content { get; set; }
    [Column("unrecognized_keys")] public string UnrecognisedKeys { get; set; }
    [Column("processed")] public bool IsProcessed { get; set; }
    [Column("outlier")] public bool IsOutlier { get; set; }
    [Column("depth")] public long Depth { get; set; }
    [Column("origin_server_ts")] public long OriginAt { get; set; }
    [Column("received_ts")] public long ReceivedAt { get; set; }
    [Column("sender")] public string Sender { get; set; }
    [Column("contains_url")] public bool ContainsUrl { get; set; }
  }
}