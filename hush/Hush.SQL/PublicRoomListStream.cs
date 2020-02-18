using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("public_room_list_stream")]
  public class PublicRoomListStream
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("is_visible")] public bool IsVisible { get; set; }
    [Column("appservice_id")] public string AppServiceId { get; set; }
    [Column("network_id")] public string NetworkId { get; set; }
  }
}