using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("remote_media_cache_thumbnails")]
  public class RemoteMediaCacheThumbnail
  {
    [Column("media_origin")] public string MediaOrigin { get; set; }
    [Column("media_id")] public string MediaId { get; set; }
    [Column("thumbnail_width")] public int? Width { get; set; }
    [Column("thumbnail_height")] public int? Height { get; set; }
    [Column("thumbnail_method")] public string Method { get; set; }
    [Column("thumbnail_type")] public string Type { get; set; }
    [Column("thumbnail_length")] public int? Length { get; set; }
    [Column("filesystem_id")] public string FileSystemId { get; set; }
  }
}