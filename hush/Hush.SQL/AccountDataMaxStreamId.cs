using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("account_data_max_stream_id")]
  public class AccountDataMaxStreamId
  {
    [Column("lock")] public string Lock { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
  }
}