using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("history_visibility")]
  public class HistoryVisibility
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("history_visibility")] public string Content { get; set; }
  }
}