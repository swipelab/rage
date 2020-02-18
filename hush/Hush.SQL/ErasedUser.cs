using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("erased_users")]
  public class ErasedUser
  {
    [Column("user_id")] public string UserId { get; set; }
  }
}