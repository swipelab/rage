using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  [Table("user")]
  public class RxUser
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("alias")] public string Alias { get; set; }
    [Column("avatar")] public string Avatar { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}