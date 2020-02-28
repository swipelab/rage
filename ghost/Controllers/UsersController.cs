using System.Linq;
using System.Threading.Tasks;
using ghost.Database;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ghost.Controllers
{
  [Route("api/users")]
  public class UsersController : Controller
  {
    private readonly RageDb _db;

    public UsersController(RageDb db)
    {
      _db = db;
    }

    [HttpGet("public")]
    public async Task<RxUser[]> Get()
    {
      var result = await _db.Users.Where(x=>x.IsPublic).ToArrayAsync();
      return result;
    }

    [HttpPost("add")]
    public async Task Add([FromBody] RxUser user)
    {
      _db.Users.Add(user);
      await _db.SaveChangesAsync();
    }
  }
}