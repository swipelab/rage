using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_alias_servers")]
  public class RoomAliasServer
  {
    [Column("room_alias")] public string Alias { get; set; }
    [Column("server")] public string Server { get; set; }
  }
}