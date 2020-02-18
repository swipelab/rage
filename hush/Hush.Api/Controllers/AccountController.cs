using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
  [ApiController]
  [Route("client/r0")]
  public class AccountController : ControllerBase
  {
    [HttpGet("register/available")]
    public Task GetRegisterAvailable() => throw new NotImplementedException();

    [HttpPost("register")]
    public Task PostRegister() => throw new NotImplementedException();

    [HttpPost("register/email/requestToken")]
    public Task PostRegisterEmailRequestToken() => throw new NotImplementedException();

    [HttpPost("register/msisdn/requestToken")]
    public Task PostRegisterMsisdnRequestToken() => throw new NotImplementedException();

    [HttpPost("account/password")]
    public Task PostAccountPassword() => throw new NotImplementedException();

    [HttpPost("account/password/email/requestToken")]
    public Task PostAccountPasswordEmailRequestToken() => throw new NotImplementedException();

    [HttpPost("account/password/msisdn/requestToken")]
    public Task PostAccountPasswordMsisdnRequestToken() => throw new NotImplementedException();

    [HttpPost("account/deactivate")]
    public Task PostAccountDeactivate() => throw new NotImplementedException();

    [HttpGet("account/3pid")]
    public Task GetAccountEid() => throw new NotImplementedException();

    [HttpPost("account/3pid")]
    public Task PostAccountEid() => throw new NotImplementedException();

    [HttpPost("account/3pid/delete")]
    public Task PostAccountEidDelete() => throw new NotImplementedException();

    [HttpPost("account/3pid/email/requestToken")]
    public Task PostAccountEidEmailRequestToken() => throw new NotImplementedException();

    [HttpPost("account/3pid/msisdn/requestToken")]
    public Task PostAccountEidMsisdnRequestToken() => throw new NotImplementedException();

    [HttpGet("whoami")]
    public Task<string> GetWhoAmI() => Task.FromResult("RANTER");
  }
}