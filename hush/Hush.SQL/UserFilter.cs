using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_filters")]
  public class UserFilter
  {
    [Column("user_id")] public string? UserId { get; set; }
    [Column("filter_id")] public long? FilterId { get; set; }
    [Column("filter_json")] public byte[]? FilterJson { get; set; }
  }
}