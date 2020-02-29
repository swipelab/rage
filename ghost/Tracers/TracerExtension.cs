using Microsoft.AspNetCore.Builder;

namespace ghost.Tracers
{
  public static class TracerExtension
  {
    public static IApplicationBuilder UseTracer(this IApplicationBuilder app) => app.UseMiddleware<TracerMiddleware>();
  }
}