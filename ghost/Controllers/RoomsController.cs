using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ghost.Database;
using ghost.Util;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ghost.Controllers
{
  [Authorize]
  [Route("api/rooms")]
  public class RoomsController : Controller
  {
    private readonly RageDb _db;

    public RoomsController(RageDb db)
    {
      _db = db;
    }

    [HttpGet("public")]
    public async Task<RxRoom[]> Public()
    {
      var result = await _db.Rooms.Where(x => x.IsPublic).ToArrayAsync();
      return result;
    }

    [HttpGet("joined")]
    public Task<RxRoom[]> Joined()
    {
      var userId = this.User.Id();
      return _db.RoomMembers
        .Where(x => x.UserId == userId)
        .Join(_db.Rooms, x => x.RoomId, x => x.RoomId, (member, room) => room)
        .ToArrayAsync();
    }

    [HttpGet("{roomId}/members")]
    public Task<RxUser[]> RoomMembers([FromRoute] string roomId)
    {
      return _db.RoomMembers
        .Where(x => x.RoomId == roomId)
        .Join(_db.Users, x => x.UserId, x => x.UserId, (member, user) => user)
        .ToArrayAsync();
    }
  }
}