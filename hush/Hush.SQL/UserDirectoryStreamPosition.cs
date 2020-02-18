using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_directory_stream_pos")]
  public class UserDirectoryStreamPosition
  {
    [Column("lock")] public string Lock { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
  }
}