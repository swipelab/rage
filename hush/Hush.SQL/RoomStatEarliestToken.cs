using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_stats_earliest_token")]
  public class RoomStatEarliestToken
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("token")] public long Token { get; set; }
  }
}