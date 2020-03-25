using System;
using System.Net.Http;
using System.Threading.Tasks;
using Grpc.Net.Client;

namespace ghost.client
{
  class Program
  {
    static async Task Main(string[] args)
    {
      var url = args.Length > 0 ? args[0] : "https://rage.swipelab.co";
      Console.WriteLine($"Connecting : {url}");


      var httpClient = new HttpClient(new HttpClientHandler
      {
        ServerCertificateCustomValidationCallback = HttpClientHandler.DangerousAcceptAnyServerCertificateValidator
      });
      var channel = GrpcChannel.ForAddress(url, new GrpcChannelOptions
      {
        HttpClient = httpClient,
      });
      var client = new Rock.RockClient(channel);


      var login = await client.LoginAsync(new LoginRequest {User = "me", Password = "again"});
      Console.WriteLine(login.Token);
      Console.ReadKey();
    }
  }
}