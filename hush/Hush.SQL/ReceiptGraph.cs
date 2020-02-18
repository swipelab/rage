using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("receipt_graph")]
  public class ReceiptGraph
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("receipt_type")] public string Kind { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("event_ids")] public string EventIds { get; set; }
    [Column("data")] public string Content { get; set; }
  }
}