using System;
using System.Collections.Concurrent;
using System.Linq;
using System.Net.WebSockets;
using System.Threading;
using System.Threading.Tasks;

namespace ghost.Pipe
{
  public class PipeMap
  {
    private ConcurrentDictionary<string, WebSocket> _index = new ConcurrentDictionary<string, WebSocket>();

    public WebSocket Socket(string sid) => _index.TryGetValue(sid, out var ws) ? ws : null;
    public ConcurrentDictionary<string, WebSocket> Index => _index;

    public string Pid(WebSocket ws) => _index.FirstOrDefault(x => x.Value == ws).Key;

    public void Add(WebSocket ws) => _index.TryAdd(NewSid(), ws);

    public async Task Remove(string pid)
    {
      if (_index.TryRemove(pid, out var ws))
        await Close(ws);
    }

    private async Task Close(WebSocket ws)
    {
      await ws.CloseAsync(closeStatus: WebSocketCloseStatus.NormalClosure,
        statusDescription: "Closed by Ghost",
        cancellationToken: CancellationToken.None);
    }

    private string NewSid() => Guid.NewGuid().ToString();
  }
}