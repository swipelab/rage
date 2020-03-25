using ghost.Calls;
using ghost.Rockets;
using ghost.Services;
using ghost.Tracers;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace ghost
{
  public class Startup
  {
    public IConfiguration Configuration { get; }

    public Startup(IWebHostEnvironment env)
    {
      var builder = new ConfigurationBuilder()
        .SetBasePath(env.ContentRootPath)
        .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
        .AddJsonFile($"appsettings.{env.EnvironmentName}.json", optional: true)
        .AddEnvironmentVariables();

      Configuration = builder.Build();
    }

    public void ConfigureServices(IServiceCollection services)
    {
      services.AddGrpc();

      services.Configure<KestrelServerOptions>(Configuration.GetSection("Kestrel"));
      services.AddLogging(x => x.AddConsole());

      services.AddTransient<RocketMap>();
      services.AddSingleton<CallHub>();

      services.AddControllers();
      services.AddJwtAuthentication(Configuration.GetValue<string>("Jwt:Secret"));
      services.AddDatabase(
        host: Configuration.GetValue<string>("POSTGRES_HOST"),
        database: Configuration.GetValue<string>("POSTGRES_DB"),
        username: Configuration.GetValue<string>("POSTGRES_USER"),
        password: Configuration.GetValue<string>("POSTGRES_PASSWORD")
      );

      services.AddSwaggerDocument(x =>
      {
        x.Title = "GHOST";
        x.Version = "0.1.0";
        x.DocumentName = "v-0-1-0";
      });
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      app.UseTracer();

      app.UseWebSockets();
      app.MapRocketHub<CallHub>("/rocket");

      app.UseAuthentication();
      app.UseRouting();
      app.UseAuthorization();
      app.UseEndpoints(endpoints =>
      {
        endpoints.MapGrpcService<RockService>();

        endpoints.MapGet("/", async context => { await context.Response.WriteAsync("Raging Rockets!"); });
        endpoints.MapControllers();
      });

      app.UseStaticFiles();

      app.UseOpenApi();
      app.UseSwaggerUi3();
    }
  }
}