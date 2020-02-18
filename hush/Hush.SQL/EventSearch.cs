using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_search")]
  public class EventSearch
  {
    //TODO: add ix.fulltext
    [Column("vector")] public string Vector { get; set; }
    [Column("origin_server_ts")] public long OriginAt { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("sender")] public string Sender { get; set; }
    [Column("key")] public string Key { get; set; }
    [Column("stream_ordering")] public long StreamOrdering { get; set; }
  }
}