using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_push_actions")]
  public class EventPushAction
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("profile_tag")] public string ProfileTag { get; set; }
    [Column("actions")] public string Actions { get; set; }
    [Column("topological_ordering")] public long? TopologicalOrdering { get; set; }
    [Column("stream_ordering")] public long? StreamOrdering { get; set; }
    [Column("notif")] public short? Notif { get; set; }
    [Column("highlight")] public short? Highlight { get; set; }
  }
}