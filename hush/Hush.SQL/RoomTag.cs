using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_tags")]
  public class RoomTag
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("tag")] public string Tag { get; set; }
    [Column("content")] public string Content { get; set; }
  }
}