using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("local_invites")]
  public class LocalInvite
  {
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("inviter")] public string Inviter { get; set; }
    [Column("invitee")] public string Invitee { get; set; }
    [Column("event_id")] public string EventId { get; set; }
    [Column("room_id")] public string RoomId { get; set; }
    [Column("locally_rejected")] public string LocallyRejected { get; set; }
    [Column("replaced_by")] public string ReplacedBy { get; set; }
  }
}