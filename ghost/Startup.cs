using ghost.Calls;
using ghost.Rockets;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace ghost
{
  public class Startup
  {
    public void ConfigureServices(IServiceCollection services)
    {
      services.AddLogging(x => x.AddConsole());

      services.AddHub();
      services.AddSingleton<CallHub>();
    }


    public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
    {
      
      if (env.IsDevelopment())
      {
        app.UseDeveloperExceptionPage();
      }

      app.UseWebSockets();
      
      app.MapHub<CallHub>("/lobby");

      app.UseRouting();
      app.UseEndpoints(endpoints =>
      {
        endpoints.MapGet("/", async context => { await context.Response.WriteAsync("Hello World!"); });
      });

      app.UseStaticFiles();
    }
  }
}