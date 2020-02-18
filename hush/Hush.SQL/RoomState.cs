using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("room_state")]
  public class RoomState
  {
    [Column("room_id")] public string RoomId { get; set; }
    [Column("join_rules")] public string JoinRules { get; set; }
    [Column("history_visibility")] public string HistoryVisibility { get; set; }
    [Column("encryption")] public string Encryption { get; set; }
    [Column("name")] public string Name { get; set; }
    [Column("topic")] public string Topic { get; set; }
    [Column("avatar")] public string AvatarUrl { get; set; }
    [Column("canonical_alias")] public string CanonicalAlias { get; set; }
  }
}