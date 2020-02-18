using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("application_services_state")]
  public class AppService
  {
    [Key] [Column("as_id")] public string Id { get; set; }
    [Column("state")] public string State { get; set; }
    [Column("last_txn")] public int LastTxn { get; set; }
  }
}