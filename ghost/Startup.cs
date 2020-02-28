using ghost.Calls;
using ghost.Rockets;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ghost
{
  public class Startup
  {
    public IConfiguration Configuration { get; }

    public Startup(IConfiguration configuration)
    {
      Configuration = configuration;
    }

    public void ConfigureServices(IServiceCollection services)
    {
      services.Configure<KestrelServerOptions>(Configuration.GetSection("Kestrel"));
      services.AddLogging(x => x.AddConsole());
      
      services.AddTransient<RocketMap>();
      services.AddSingleton<CallHub>();
      
      services.AddControllers();
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