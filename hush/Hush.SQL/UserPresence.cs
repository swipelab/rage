using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("presence")]
  public class UserPresence
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("state")] public string State { get; set; }
    [Column("status_msg")] public string Message { get; set; }
    [Column("mtime")] public long? ChangedAt { get; set; }
  }
}