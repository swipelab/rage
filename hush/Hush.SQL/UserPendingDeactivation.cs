using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_pending_deactivation")]
  public class UserPendingDeactivation
  {
    [Column("user_id")] public string UserId { get; set; }
  }
}