using Microsoft.AspNetCore.Builder;

namespace ghost.Exceptions
{
  public static class ExceptionExtension
  {
    public static IApplicationBuilder UseExceptionMiddleware(this IApplicationBuilder app) => app.UseMiddleware<ExceptionMiddleware>();
  }
}