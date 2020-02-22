using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace ghost.Rockets
{
  public static class RocketExtension
  {
    public static IApplicationBuilder MapRocketHub<T>(this IApplicationBuilder app, PathString path)
      where T : RocketHub
      => app.Map(path, ap => ap.UseMiddleware<RocketMiddleware>(ap.ApplicationServices.GetRequiredService<T>()));
  }
}