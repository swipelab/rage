using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("server_signature_keys")]
  public class ServerSignatureKey
  {
    [Column("server_name")] public string ServerName { get; set; }
    [Column("key_id")] public string KeyId { get; set; }
    [Column("from_server")] public string FromServer { get; set; }
    [Column("ts_added_ms")] public long? AddedAt { get; set; }
    [Column("verify_key")] public byte[]? Content { get; set; }
    [Column("ts_valid_until_ms")] public long? ValidUntil { get; set; }
  }
}