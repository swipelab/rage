using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("e2e_room_keys")]
  public class E2ERoomKey
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("session_id")] public string SessionId { get; set; }
    [Column("version")] public long Version { get; set; }
    [Column("first_message_index")] public int FirstMessageIndex { get; set; }
    [Column("forward_count")] public int ForwardCount { get; set; }
    [Column("is_verified")] public bool IsVerified { get; set; }
    [Column("session_data")] public string SessionData { get; set; }
  }
}