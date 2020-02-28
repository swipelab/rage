using System.Text;
using ghost.Calls;
using ghost.Database;
using ghost.Rockets;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;

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

      services.AddAuthentication(x =>
        {
          x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
          x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        })
        .AddJwtBearer(x =>
        {
          x.RequireHttpsMetadata = false;
          x.SaveToken = true;

          var secret = Configuration.GetValue<string>("Jwt:Secret");
          var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
          x.TokenValidationParameters = new TokenValidationParameters
          {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = key,
            ValidateIssuer = false,
            ValidateAudience = false
          };
        });

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

      app.UseAuthentication();

      app.UseRouting();

      app.MapRocketHub<CallHub>("/rocket");
      app.UseAuthorization();

      app.UseEndpoints(endpoints =>
      {
        endpoints.MapGet("/", async context => { await context.Response.WriteAsync("Raging Rockets!"); });
        endpoints.MapControllers();
      });

      app.UseStaticFiles();
    }
  }
}