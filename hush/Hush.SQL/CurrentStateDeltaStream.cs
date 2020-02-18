using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("current_state_delta_stream")]
  public class CurrentStateDeltaStream
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("type")] public string Kind { get; set; }
    [Column("state_key")] public string StateKey { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("prev_event_id")] public string PrevEventId { get; set; }
  }
}