using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("profiles")]
  public class UserProfile
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("displayname")] public string Alias { get; set; }
    [Column("avatar_url")] public string AvatarUrl { get; set; }
  }
}