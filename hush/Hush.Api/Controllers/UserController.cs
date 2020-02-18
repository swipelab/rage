using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
  [ApiController]
  [Route("client/r0")]
  public class UserController : ControllerBase
  {
    [HttpPost("user/{userId}/filter")]
    public Task PostUserFilter([FromRoute(Name = "userId")] string userId)
      => throw new NotImplementedException();

    [HttpGet("user/{userId}/filter/{filterId}")]
    public Task GetUserFilter(
      [FromRoute(Name = "userId")] string userId,
      [FromRoute(Name = "filterId")] string filterId)
      => throw new NotImplementedException();

  }
}