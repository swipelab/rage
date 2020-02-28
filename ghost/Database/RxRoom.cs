using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  [Table("room")]
  public class RxRoom
  {
    [Column("id")] public string Id { get; set; }
  }
}