using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("user_stats")]
  public class UserStat
  {
    [Column("user_id")] public string UserId { get; set; }
    [Column("ts")] public long At { get; set; }
    [Column("bucket_size")] public int BucketSize { get; set; }
    [Column("public_rooms")] public int PublicRooms { get; set; }
    [Column("private_rooms")] public int PrivateRooms { get; set; }
  }
}