using Microsoft.EntityFrameworkCore;

namespace ghost.Database
{
  public class RageDb : DbContext
  {
    public RageDb(DbContextOptions<RageDb> options) : base(options)
    {
    }

    protected override void OnModelCreating(ModelBuilder m)
    {
      base.OnModelCreating(m);

      m.Entity<RxUser>().HasKey(x => x.UserId);
      m.Entity<RxCredential>().HasKey(x => x.UserId);
      m.Entity<RxIdentifier>().HasKey(x => new {x.UserId, x.Medium, x.Address});
    }

    public DbSet<RxUser> Users { get; set; }
    public DbSet<RxCredential> Credentials { get; set; }
    public DbSet<RxIdentifier> Identifiers { get; set; }

    public DbSet<RxGroup> Groups { get; set; }
    public DbSet<RxChat> Chats { get; set; }
    public DbSet<RxCall> Calls { get; set; }
    public DbSet<RxRoom> Rooms { get; set; }
  }
}