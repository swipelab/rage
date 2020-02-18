using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("topics")]
  public class Topic
  {
    [Column("topic")] public string Id { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
  }
}