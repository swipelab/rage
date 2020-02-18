using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("presence_stream")]
  public class UserPresenceStream
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("state")] public string State { get; set; }
    [Column("last_active_ts")] public long? LastActiveAt { get; set; }
    [Column("last_federation_update_ts")] public long? LastFederationUpdatedStamp { get; set; }
    [Column("last_user_sync_ts")] public long? UserLastSyncAt { get; set; }
    [Column("status_msg")] public string Message { get; set; }
    [Column("currently_active")] public bool? IsActive { get; set; }
  }
}