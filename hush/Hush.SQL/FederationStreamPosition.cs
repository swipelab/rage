using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("federation_stream_position")]
  public class FederationStreamPosition
  {
    [Column("type")] public string Kind { get; set; }
    [Column("stream_id")] public int? StreamId { get; set; }
  }
}