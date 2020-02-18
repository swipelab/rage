using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
  [ApiController]
  [Route("client/r0")]
  public class CapabilityController : ControllerBase
  {
    [HttpGet("capabilities")]
    public Task GetCapabilities() => throw new NotImplementedException();
  }
}