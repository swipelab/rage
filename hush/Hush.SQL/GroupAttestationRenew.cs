using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_attestations_renewals")]
  public class GroupAttestationRenew
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("valid_until_ms")] public long ValidUntil { get; set; }
  }
}