using System;
using System.Collections.Concurrent;
using System.Linq;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Tasks;

namespace ghost.Rockets
{
  public class RocketMap
  {
    private ConcurrentDictionary<string, WebSocket> _index = new ConcurrentDictionary<string, WebSocket>();

    public WebSocket Socket(string sid) => _index.TryGetValue(sid, out var ws) ? ws : null;
    public ConcurrentDictionary<string, WebSocket> Index => _index;

    public string Pid(WebSocket ws) => _index.FirstOrDefault(x => x.Value == ws).Key;

    public void Add(WebSocket ws) => _index.TryAdd(NewPid(), ws);

    public async Task Remove(string pid)
    {
      if (_index.TryRemove(pid, out var ws))
        await Close(ws);
    }

    private async Task Close(WebSocket ws)
    {
      if (ws.State == WebSocketState.Open
          || ws.State == WebSocketState.CloseReceived
          || ws.State == WebSocketState.CloseSent)
      {
        await ws.CloseAsync(closeStatus: WebSocketCloseStatus.NormalClosure,
          statusDescription: "Closed by Ghost",
          cancellationToken: CancellationToken.None);
      }
    }

    private string NewPid() => Guid.NewGuid().ToString();
  }
}