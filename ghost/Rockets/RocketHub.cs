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
    protected RocketMap RocketMap { get; }

    protected RocketHub(RocketMap rocketMap)
    {
      RocketMap = rocketMap;
    }

    public virtual Task OnConnected(WebSocket ws)
    {
      RocketMap.Add(ws);
      return Task.CompletedTask;
    }

    public virtual async Task OnDisconnected(WebSocket ws)
    {
      await RocketMap.Remove(RocketMap.Pid(ws));
    }

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

    public Task Send(string pid, string msg) => Send(RocketMap.Socket(pid), msg);

    public Task Broadcast(string msg) => Task.WhenAll(RocketMap.Index.Values.Select(ws => Send(ws, msg)));

    public abstract Task Receive(WebSocket ws, WebSocketReceiveResult result, byte[] buffer);
  }
}