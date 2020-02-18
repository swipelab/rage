using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_directory")]
  public class UserDirectory
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("display_name")] public string Alias { get; set; }
    [Column("avatar_url")] public string AvatarUrl { get; set; }
  }
}