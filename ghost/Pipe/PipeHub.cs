using System;
using System.Linq;
using System.Net.WebSockets;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace ghost.Pipe
{
  public abstract class PipeHub
  {
    protected PipeMap PipeMap { get; }

    protected PipeHub(PipeMap pipeMap)
    {
      PipeMap = pipeMap;
    }

    public virtual Task OnConnected(WebSocket ws)
    {
      PipeMap.Add(ws);
      return Task.CompletedTask;
    }

    public virtual async Task OnDisconnected(WebSocket ws)
    {
      await PipeMap.Remove(PipeMap.Pid(ws));
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

    public Task Send(string pid, string msg) => Send(PipeMap.Socket(pid), msg);

    public Task Broadcast(string msg) => Task.WhenAll(PipeMap.Index.Values.Select(ws => Send(ws, msg)));

    public abstract Task Receive(WebSocket ws, WebSocketReceiveResult result, byte[] buffer);
  }
}