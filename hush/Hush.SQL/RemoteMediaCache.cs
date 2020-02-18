using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("remote_media_cache")]
  public class RemoteMediaCache
  {
    [Column("media_origin")] public string MediaOrigin { get; set; }
    [Column("media_id")] public string MediaId { get; set; }
    [Column("media_type")] public string MediaType { get; set; }
    [Column("media_length")] public int MediaLength { get; set; }
    [Column("created_ts")] public long CreatedAt { get; set; }
    [Column("upload_name")] public string UploadName { get; set; }
    [Column("filesystem_id")] public string FileSystemId { get; set; }
    [Column("last_access_ts")] public long LastAccessAt { get; set; }
    [Column("quarantined_by")] public string QuarantinedBy { get; set; }
  }
}