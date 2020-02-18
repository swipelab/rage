using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("pusher")]
  public class Pusher
  {
    [Key] [Column("id")] public long Id { get; set; }
    [Column("user_name")] public string UserName { get; set; }
    [Column("access_token")] public long AccessTokenId { get; set; }
    [Column("profile_tag")] public string ProfileTag { get; set; }
    [Column("kind")] public string Kind { get; set; }
    [Column("app_id")] public string AppServiceId { get; set; }
    [Column("app_display_name")] public string AppServiceAlias { get; set; }
    [Column("device_display_name")] public string DeviceAlias { get; set; }
    [Column("pushkey")] public string PushKey { get; set; }
    [Column("ts")] public long At { get; set; }
    [Column("lang")] public string Language { get; set; }
    [Column("data")] public string Data { get; set; }
    [Column("last_stream_ordering")] public int? LastStreamOrdering { get; set; }
    [Column("last_success")] public long? LastSuccessAt { get; set; }
    [Column("failing_since")] public long? LastFailAt { get; set; }
  }
}