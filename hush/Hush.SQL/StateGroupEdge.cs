using System.ComponentModel.DataAnnotations.Schema;

namespace Hush.SQL
{
  [Table("state_group_edges")]
  public class StateGroupEdge
  {
    [Column("state_group")] public long StateGroup { get; set; }
    [Column("prev_state_group")] public long PrevStateGroup { get; set; }
  }
}