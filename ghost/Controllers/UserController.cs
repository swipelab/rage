using System.Threading.Tasks;
using ghost.Database;
using Microsoft.AspNetCore.Mvc;

namespace ghost.Controllers
{
  [Route("api/user")]
  public class UserController : Controller
  {
    [HttpGet]
    public Task<RxUser> GetUser()
    {
      var result = new RxUser();
      return Task.FromResult(result);
    }
  }
}