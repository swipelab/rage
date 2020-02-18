using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("stream_ordering_to_end")]
  public class StreamOrderingToEnd
  {
    [Column("stream_ordering")] public long StreamOrdering { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("event_id")] public string EventId { get; set; }
  }
}