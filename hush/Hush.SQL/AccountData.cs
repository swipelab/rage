using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("account_data")]
  public class AccountData
  {
    [Column("account_data_type")] public string Kind { get; set; }
    [Column("content")] public string Content { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
  }
}