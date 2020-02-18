using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("appservice_room_list")]
  public class AppServiceRoomList
  {
    [Column("appservice_id")] public string AppServiceId { get; set; }
    [Column("network_id")] public string NetworkId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
  }
}