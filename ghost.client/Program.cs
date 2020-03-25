using System;
using System.Threading.Tasks;
using Grpc.Net.Client;

namespace ghost.client
{
  class Program
  {
    static async Task Main(string[] args)
    {
      var channel = GrpcChannel.ForAddress("https://localhost:5001");
      var client = new Rock.RockClient(channel);
      var login = await client.LoginAsync(new LoginRequest {User = "me", Password = "again"});
      Console.WriteLine(login.Token);
      Console.ReadKey();
    }
  }
}
