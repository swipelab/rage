using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_json")]
  public class EventJson
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("internal_metadata")] public string Meta { get; set; }
    [Column("json")] public string Json { get; set; }
    [Column("format_version")] public int FormatVersion { get; set; }
  }
}