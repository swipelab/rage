using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_stats")]
  public class RoomStat
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("ts")] public long At { get; set; }
    [Column("bucket_size")] public int BucketSize { get; set; }
    [Column("current_state_event")] public int CurrentStateEvents { get; set; }
    [Column("joined_members")] public int JoinedMembers { get; set; }
    [Column("invited_members")] public int InvitedMembers { get; set; }
    [Column("left_members")] public int LeftMembers { get; set; }
    [Column("banned_members")] public int BannedMembers { get; set; }
    [Column("state_events")] public int StateEvents { get; set; }
  }
}