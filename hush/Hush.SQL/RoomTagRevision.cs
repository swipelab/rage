using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_tags_revisions")]
  public class RoomTagRevision
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
  }
}