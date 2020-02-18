using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("open_id_tokens")]
  public class OpenIdToken
  {
    [Key] [Column("token")] public string Token { get; set; }
    [Column("ts_valid_until_ms")] public long ValidUntil { get; set; }
    [Column("user_id")] public string UserId { get; set; }
  }
}