using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("local_group_updates")]
  public class LocalGroupUpdate
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("type")] public string Kind { get; set; }
    [Column("content")] public string Content { get; set; }
  }
}