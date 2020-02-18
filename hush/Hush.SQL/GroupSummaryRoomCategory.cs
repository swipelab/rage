using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("group_summary_room_categories")]
  public class GroupSummaryRoomCategory
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("category_id")] public string CategoryId { get; set; }
    [Column("cat_order")] public long CategoryOrder { get; set; }
  }
}