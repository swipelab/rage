using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_account_data")]
  public class RoomAccountData
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("account_data_type")] public string Kind { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("content")] public string Content { get; set; }
  }
}