using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("deleted_pushers")]
  public class DeletedPusher
  {
    [Column("stream_id")]public long StreamId { get; set; }
    [Column("app_id")]public string AppServiceId { get; set; }
    [Column("pushkey")]public string PushKey { get; set; }
    [Column("user_id")]public string UserId { get; set; }
  }
}