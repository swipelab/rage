using System.ComponentModel.DataAnnotations.Schema;

namespace ghost.Database
{
  [Table("room")]
  public class RxRoom
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("alias")] public string Alias { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
    
    
    [Column("fx_member_count")] public int FxMemberCount { get; set; }
  }
}