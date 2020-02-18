using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("application_services_txns")]
  public class AppServiceTxn
  {
    [Column("as_id")]public string AppServiceId { get; set; }
    [Column("txn_id")] public int TxnId { get; set; }
    [Column("event_ids")] public string EventId { get; set; }
  }
}