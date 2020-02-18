using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("local_media_repository_url_cache")]
  public class LocalMediaRepositoryUrlCache
  {
    [Column("og")] public string Origin { get; set; }
    [Column("url")] public string Url { get; set; }
    [Column("response_code")] public int ResponseCode { get; set; }
    [Column("etag")] public string ETag { get; set; }
    [Column("expires_ts")] public long ExpiredAt { get; set; }
    [Column("media_id")] public string MediaId { get; set; }
    [Column("downloaded_ts")] public long? DownloadedAt { get; set; }
  }
}