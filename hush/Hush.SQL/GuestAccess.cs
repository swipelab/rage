using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("guest_access")]
  public class GuestAccess
  {
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("guest_access")] public string Content { get; set; }
  }
}