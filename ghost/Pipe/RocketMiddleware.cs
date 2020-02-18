using System;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;

namespace ghost.Pipe
{
  public class RocketMiddleware
  {
    private readonly RequestDelegate _next;
    private PipeHub _hub;

    public RocketMiddleware(RequestDelegate next, PipeHub hub)
    {
      _next = next;
      _hub = hub;
    }

    public async Task Invoke(HttpContext context)
    {
      if (!context.WebSockets.IsWebSocketRequest)
        return;

      var ws = await context.WebSockets.AcceptWebSocketAsync();
      await _hub.OnConnected(ws);
      await Receive(ws, async (result, buffer) =>
      {
        switch (result.MessageType)
        {
          case WebSocketMessageType.Text:
            await _hub.Receive(ws, result, buffer);
            break;
          case WebSocketMessageType.Binary:
            break;
          case WebSocketMessageType.Close:
            await _hub.OnDisconnected(ws);
            break;
          default: //ignore
            break;
        }
      });
    }

    private static async Task Receive(WebSocket ws, Action<WebSocketReceiveResult, byte[]> onReceive)
    {
      var buffer = new byte[1024 * 16];
      while (ws.State == WebSocketState.Open)
      {
        var result = await ws.ReceiveAsync(
          buffer: new ArraySegment<byte>(buffer),
          cancellationToken: CancellationToken.None);

        onReceive(result, buffer);
      }
    }
  }
}