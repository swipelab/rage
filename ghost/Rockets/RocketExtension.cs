using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace ghost.Rockets
{
  public static class RocketExtension
  {
    public static IApplicationBuilder MapRocketHub<T>(this IApplicationBuilder app, PathString path)
      where T : RocketHub
      => app.Map(path, x => x.UseMiddleware<RocketMiddleware<T>>());
  }
}