using System;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ghost.Rockets
{
  public abstract class RocketHub
  {
    public abstract Task OnConnected(WebSocket ws);

    public abstract Task OnDisconnected(WebSocket ws);

    public abstract Task OnError(WebSocket ws);

    public async Task Send(WebSocket ws, string message)
    {
      if (ws?.State != WebSocketState.Open)
        return;

      var buffer = new ArraySegment<byte>(array: Encoding.UTF8.GetBytes(message),
        offset: 0,
        count: message.Length);

      await ws.SendAsync(
        buffer: buffer,
        messageType: WebSocketMessageType.Text,
        endOfMessage: true,
        cancellationToken: CancellationToken.None);
    }

    public abstract Task Receive(WebSocket ws, WebSocketReceiveResult result, byte[] buffer);
  }
}