using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("local_media_repository")]
  public class LocalMediaRepository
  {
    [Column("media_id")] public string MediaId { get; set; }
    [Column("media_type")] public string MediaType { get; set; }
    [Column("media_length")] public int MediaLength { get; set; }
    [Column("created_ts")] public long CreatedAt { get; set; }
    [Column("upload_name")] public string UploadName { get; set; }
    [Column("user_id")] public string UserId { get; set; }
    [Column("quarantined_by")] public string QuarantinedBy { get; set; }
    [Column("url_cache")] public string UrlCache { get; set; }
    [Column("last_access_at")] public string LastAccessAt { get; set; }
  }
}