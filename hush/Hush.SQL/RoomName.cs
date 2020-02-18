using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_names")]
  public class RoomName
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("name")] public string Name { get; set; }
  }
}