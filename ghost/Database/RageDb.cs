using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ghost.Database
{
  public class RageDb : DbContext
  {
    public RageDb(DbContextOptions<RageDb> options) : base(options)
    {
    }

    public DbSet<RxUser> Users { get; set; }
    public DbSet<RxGroup> Groups { get; set; }
    public DbSet<RxChat> Chats { get; set; }
    public DbSet<RxCall> Calls { get; set; }
  }

  [Table("user")]
  public class RxUser
  {
    [Column("id")] public string Id { get; set; }
    [Column("alias")] public string Alias { get; set; }
    [Column("avatar")] public string Avatar { get; set; }
    [Column("email")] public string Email { get; set; }
  }

  public class RxGroup
  {
    [Column("id")] public string Id { get; set; }
    [Column("description")] public string Description { get; set; }
    [Column("leader")] public string Leader { get; set; }
    [Column("users")] public string[] Users { get; set; }
  }

  public class RxChat
  {
    public string Id { get; set; }
  }

  public class RxCall
  {
    public string Id { get; set; }
  }
}