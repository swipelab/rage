using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace ghost.Pipe
{
  public static class RocketExtension
  {
    public static IApplicationBuilder MapHub<T>(this IApplicationBuilder app, PathString path)
      where T : RocketHub
      => app.Map(path, ap => ap.UseMiddleware<RocketMiddleware>(ap.ApplicationServices.GetRequiredService<T>()));

    public static IServiceCollection AddHub(this IServiceCollection services)
    {
      services.AddTransient<RocketMap>();
      return services;
    }
  }
}