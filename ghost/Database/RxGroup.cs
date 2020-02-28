using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  public class RxGroup
  {
    [Column("id")] public string Id { get; set; }
    [Column("description")] public string Description { get; set; }
    [Column("leader")] public string Leader { get; set; }
    [Column("users")] public string[] Users { get; set; }
  }
}