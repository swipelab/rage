using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("remote_profile_cache")]
  public class RemoteProfileCache
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("displayname")] public string Alias { get; set; }
    [Column("avatar_url")] public string AvatarUrl { get; set; }
    [Column("last_check")] public long LastCheckAt { get; set; }
  }
}