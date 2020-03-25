using System.Threading.Tasks;
using Grpc.Core;

namespace ghost.Services
{
  public class RockService : Rock.RockBase
  {
    public override Task<LoginResponse> Login(LoginRequest request, ServerCallContext context)
    {
      var result = new LoginResponse { Token = $"Hey {request.User}, GRPC Says {request.Password} is weak!" };
      return Task.FromResult(result);
    }
  }
}
