using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ghost
{
  public class Program
  {
    public static void Main(string[] args)
    {
      CreateHostBuilder(args).Build().Run();
    }

    public static IHostBuilder CreateHostBuilder(string[] args) =>
      Host.CreateDefaultBuilder(args)
        .ConfigureWebHostDefaults(wb =>
        {
          wb.ConfigureKestrel(Kestrel.Local)
            .UseStartup<Startup>();
        });
  }

  public static class Kestrel
  {
    public static void Local(KestrelServerOptions options)
    {
      options.Limits.MaxConcurrentConnections = 100;
      options.Limits.MaxConcurrentUpgradedConnections = 100;
      options.Limits.MaxRequestBodySize = 10 * 1024;
      options.Limits.MinRequestBodyDataRate =
        new MinDataRate(bytesPerSecond: 100, gracePeriod: TimeSpan.FromSeconds(10));
      options.Limits.MinResponseDataRate =
        new MinDataRate(bytesPerSecond: 100, gracePeriod: TimeSpan.FromSeconds(10));
      options.Listen(IPAddress.Any, 5000);
      options.Listen(IPAddress.Any, 5001, xo =>
      {
        //TODO: add certs
        xo.UseHttps();
      });
      options.DisableStringReuse = true;
    }
  }
}