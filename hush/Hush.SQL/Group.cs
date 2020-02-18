using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("groups")]
  public class Group
  {
    [Column("group_id")] public string GroupId { get; set; }
    [Column("name")] public string Name { get; set; }
    [Column("avatar_url")] public string AvatarUrl { get; set; }
    [Column("short_description")] public string ShortDescription { get; set; }
    [Column("long_description")] public string LongDescription { get; set; }
    [Column("is_public")] public bool IsPublic { get; set; }
    [Column("join_policy")] public string JoinPolicy { get; set; }
  }
}