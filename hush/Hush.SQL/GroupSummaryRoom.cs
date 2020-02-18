using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_summary_rooms")]
  public class GroupSummaryRoom
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("category_id")] public string CategoryId { get; set; }
    [Column("room_order")] public long RoomOrder { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
  }
}