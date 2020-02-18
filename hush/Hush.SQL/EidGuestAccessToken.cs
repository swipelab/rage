using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("threepid_guest_access_token")]
  public class EidGuestAccessToken
  {
    [Column("medium")] public string Medium { get; set; }
    [Column("address")] public string Address { get; set; }
    [Column("guest_access_token")] public string GuestAccessToken { get; set; }
    [Column("first_inviter")] public string FirstInviter { get; set; }
  }
}