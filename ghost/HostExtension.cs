using System.Text;
using ghost.Database;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;

namespace ghost
{
  public static class HostExtension
  {
    public static void AddJwtAuthentication(this IServiceCollection services, string secret)
    {
      services.AddAuthentication(x =>
        {
          x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
          x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
        })
        .AddJwtBearer(x =>
        {
          x.RequireHttpsMetadata = false;
          x.SaveToken = true;

          var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
          x.TokenValidationParameters = new TokenValidationParameters
          {
            ValidateIssuerSigningKey = true,
            IssuerSigningKey = key,
            ValidateIssuer = false,
            ValidateAudience = false
          };
        });
    }

    public static void AddDatabase(this IServiceCollection services, string host, string database, string username,
      string password)
    {
      services.AddDbContext<RageDb>(x =>
        x.UseNpgsql(
          string.Join(";",
            $"Host={host}",
            $"Database={database}",
            $"Username={username}",
            $"Password={password}"
          )
        ));
    }
  }
}