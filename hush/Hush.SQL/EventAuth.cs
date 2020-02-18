using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("event_auth")]
  public class EventAuth
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("auth_id")] public string AuthId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
  }
}