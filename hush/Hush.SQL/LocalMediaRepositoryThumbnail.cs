using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("local_media_repository_thumbnails")]
  public class LocalMediaRepositoryThumbnail
  {
    [Column("media_id")] public string MediaId { get; set; }
    [Column("thumbnail_width")] public int Width { get; set; }
    [Column("thumbnail_height")] public int Height { get; set; }
    [Column("thumbnail_type")] public string Type { get; set; }
    [Column("thumbnail_method")] public string Method { get; set; }
    [Column("thumbnail_length")] public string Length { get; set; }
  }
}