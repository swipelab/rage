using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table(("receipts_linearized"))]
  public class ReceiptLinear
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("receipt_type")] public string Kind { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("data")] public string Content { get; set; }
  }
}