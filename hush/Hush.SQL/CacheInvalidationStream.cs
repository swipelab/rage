using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("cache_invalidation_stream")]
  public class CacheInvalidationStream
  {
    //FIXME: check if this actually works 
    [Column("keys")] public string[] Keys { get; set; }
    [Column("stream_id")] public long StreamId { get; set; }
    [Column("cache_func")] public string CacheFunc { get; set; }
    [Column("invalidation_ts")] public long InvalidationAt { get; set; }
  }
}