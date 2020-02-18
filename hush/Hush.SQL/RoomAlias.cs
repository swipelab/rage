using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_aliases")]
  public class RoomAlias
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("room_alias")] public string Alias { get; set; }
    [Column("creator")] public string Creator { get; set; }
  }
}