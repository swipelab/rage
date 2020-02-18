using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("background_updates")]
  public class BackgroundUpdate
  {
    [Column("update_name")] public string Name { get; set; }
    [Column("progress_json")] public string ProgressJson { get; set; }
    [Column("depends_on")] public string DependsOn { get; set; }
  }
}