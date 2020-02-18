using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("e2e_room_keys_versions")]
  public class E2ERoomKeyVersion
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("version")] public long Version { get; set; }
    [Column("algorithm")] public string Algorithm { get; set; }
    [Column("auth_data")] public string AuthData { get; set; }
    [Column("deleted")] public short IsDeleted { get; set; }
  }
}