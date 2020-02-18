using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_threepids")]
  public class UserEid
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("medium")] public string Medium { get; set; }
    [Column("address")] public string Address { get; set; }
    [Column("validated_at")] public long ValidatedAt { get; set; }
    [Column("added_at")] public long AddedAt { get; set; }
  }
}