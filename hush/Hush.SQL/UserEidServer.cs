using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_threepid_id_server")]
  public class UserEidServer
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("medium")] public string Medium { get; set; }
    [Column("address")] public string Address { get; set; }
    [Column("id_server")] public string IdServer { get; set; }
  }
}