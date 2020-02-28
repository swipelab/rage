using System.Collections.Generic;
using ghost.Calls;
using ghost.Database;
using ghost.Rockets;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Npgsql;

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
      services.Configure<KestrelServerOptions>(Configuration.GetSection("Kestrel"));
      services.AddLogging(x => x.AddConsole());

      services.AddTransient<RocketMap>();
      services.AddSingleton<CallHub>();

      services.AddControllers();

      services.AddDbContext<RageDb>(x =>
        x.UseNpgsql(
          string.Join(";",
            $"Host={Configuration.GetValue<string>("POSTGRES_HOST")}",
            $"Database={Configuration.GetValue<string>("POSTGRES_DB")}",
            $"Username={Configuration.GetValue<string>("POSTGRES_USER")}",
            $"Password={Configuration.GetValue<string>("POSTGRES_PASSWORD")}"
          )
        ));
    }

    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.UseWebSockets();
      app.MapRocketHub<CallHub>("/lobby");

      app.UseRouting();
      app.UseEndpoints(endpoints =>
      {
        endpoints.MapGet("/", async context => { await context.Response.WriteAsync("Raging Rockets!"); });
        endpoints.MapControllers();
      });

      app.UseStaticFiles();
    }
  }
}