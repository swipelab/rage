using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

namespace ghost.Database
{
  public class RageDb : DbContext
  {
    public DbSet<RxUser> Users { get; set; }
    public DbSet<RxGroup> Groups { get; set; }
    public DbSet<RxChat> Chats { get; set; }
    public DbSet<RxCall> Calls { get; set; }
  }

  public class RxUser
  {
    [Column("id")] public string Id { get; set; }
    [Column("alias")] public string Alias { get; set; }
    [Column("avatar")] public string Avatar { get; set; }
    [Column("email")] public string Email { get; set; }
    [Column("group")] public string Group { get; set; }
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