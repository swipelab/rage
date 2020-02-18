using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
  [ApiController]
  [Route("client/r0")]
  public class DirectoryController : ControllerBase
  {
    [HttpPost("createRoom")]
    public Task PostCreateRoom()
      => throw new NotImplementedException();

    [HttpPut("directory/room/{roomAlias}")]
    public Task PutDirectoryRoomAlias(
      [FromRoute(Name = "roomAlias")] string roomAlias
    ) => throw new NotImplementedException();

    [HttpGet("directory/room/{roomAlias}")]
    public Task GetDirectoryRoomAlias(
      [FromRoute(Name = "roomAlias")] string roomAlias
    ) => throw new NotImplementedException();

    [HttpDelete("directory/room/{roomAlias}")]
    public Task DeleteDirectoryRoomAlias(
      [FromRoute(Name = "roomAlias")] string roomAlias
    ) => throw new NotImplementedException();

    [HttpGet("directory/list/room/{roomId}")]
    public Task GetDirectoryListRoom(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPut("directory/list/room/{roomId}")]
    public Task PutDirectoryListRoom(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpGet("publicRooms")]
    public Task GetPublicRooms()
      => throw new NotImplementedException();

    [HttpPost("publicRooms")]
    public Task PostPublicRooms()
      => throw new NotImplementedException();
  }
}