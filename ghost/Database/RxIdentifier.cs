using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  [Table("identifier")]
  public class RxIdentifier
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("medium")] public string Medium { get; set; }
    [Column("address")] public string Address { get; set; }
    [Column("is_valid")] public bool IsValid { get; set; }
  }
}