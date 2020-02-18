using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_attestations_remote")]
  public class GroupAttestationRemote
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("valid_until")] public long ValidUntil { get; set; }
    [Column("attestation_json")] public string Content { get; set; }
  }
}