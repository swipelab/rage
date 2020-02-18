using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_directory_search")]
  public class UserDirectorySearch
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("vector")] public string Vector { get; set; }
  }
}