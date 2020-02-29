using System;
using System.Text;
using System.Text.Json;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;

namespace ghost.Traces
{
  public class TraceMiddleware
  {
    private readonly RequestDelegate _next;

    public TraceMiddleware(RequestDelegate next)
    {
      _next = next;
    }

    public async Task Invoke(HttpContext context)
    {
      try
      {
        await _next(context);
      }
      catch (Exception ex)
      {
        if (context.Response.HasStarted)
        {
          //_logger.LogWarning("The response has already started, the http status code middleware will not be executed.");
          throw;
        }

        const int code = 500;

        context.Response.Clear();

        context.Response.StatusCode = code;
        context.Response.ContentType = "application/json";

        await context.Response.WriteAsync(
          JsonSerializer.Serialize(new
          {
            Code = code,
            Message = ex.Message,
          }), Encoding.UTF8, CancellationToken.None);
      }
    }
  }

  public static class TraceExtension
  {
    public static IApplicationBuilder UseTrace(this IApplicationBuilder app) => app.UseMiddleware<TraceMiddleware>();
  }
}