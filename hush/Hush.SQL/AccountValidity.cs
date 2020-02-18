using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("account_validity")]
  public class AccountValidity
  {
    [Key] [Column("user_id")] public string UserId { get; set; }
    [Column("expiration_ts_ms")] public long ExpiresAt { get; set; }
    [Column("email_sent")] public bool IsEmailSent { get; set; }
    [Column("renewal_token")] public string Token { get; set; }
  }
}