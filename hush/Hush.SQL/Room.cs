using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("rooms")]
  public class Room
  {
    [Column("room_id")] public string Id { get; set; }
    [Column("is_public")] public bool? IsPublic { get; set; }
    [Column("creator")] public string? Creator { get; set; }
  }
}