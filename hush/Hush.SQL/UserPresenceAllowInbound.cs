using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("presence_allow_inbound")]
  public class UserPresenceAllowInbound
  {
    [Column("observed_user_id")] public string ObservedUserId { get; set; }
    [Column("observer_user_id")] public string ObserverUserId { get; set; }
  }
}