using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("received_transactions")]
  public class ReceivedTransaction
  {
    [Column("transaction_id")] public string TransactionId { get; set; }
    [Column("origin")] public string Origin { get; set; }
    [Column("ts")] public long? At { get; set; }
    [Column("response_code")] public int? ResponseCode { get; set; }
    [Column("response_json")] public byte[] ResponseJson { get; set; }
    [Column("has_been_referenced")] public short WasReferenced { get; set; }
  }
}