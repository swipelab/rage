using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
  [ApiController]
  [Route("client/r0")]
  public class AuthController : ControllerBase
  {
    [HttpGet("login")]
    public Task GetLogin() => throw new NotImplementedException();

    [HttpPost("login")]
    public Task PostLogin() => throw new NotImplementedException();

    [HttpPost("logout")]
    public Task PostLogout() => throw new NotImplementedException();

    [HttpPost("logout/all")]
    public Task PostLogoutAll() => throw new NotImplementedException();
  }
}