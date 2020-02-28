using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  [Table("credential")]
  public class RxCredential
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("hash")] public string Hash { get; set; }
  }
}