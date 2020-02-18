using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("users")]
  public class User
  {
    [Column("name")] public string? Name { get; set; }
    [Column("password_hash")] public string? PasswordHash { get; set; }
    [Column("creation_ts")] public long? CreatedAt { get; set; }
    [Column("admin")] public short IsAdmin { get; set; }
    [Column("upgrade_ts")] public long? UpgradedAt { get; set; }
    [Column("is_guest")] public short IsGuest { get; set; }
    [Column("appservice_id")] public string? AppServiceId { get; set; }
    [Column("consent_version")] public string? ConsentVersion { get; set; }
    [Column("consent_server_notice_sent")] public string? ConsentServerNoticeSent { get; set; }
    [Column("user_type")] public string? Kind { get; set; }
  }
}