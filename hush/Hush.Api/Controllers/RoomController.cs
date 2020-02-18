using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
  [ApiController]
  [Route("client/r0")]
  public class RoomController
  {
    [HttpGet("rooms/{roomId}/event/{eventId}")]
    public Task GetRoomEvent(
      [FromRoute(Name = "roomId")] string roomId,
      [FromRoute(Name = "eventId")] string eventId)
      => throw new NotImplementedException();

    [HttpGet("rooms/{roomId}/state/{eventType}/{stateKey}")]
    public Task GetRoomStateKey(
      [FromRoute(Name = "roomId")] string roomId,
      [FromRoute(Name = "eventType")] string eventType,
      [FromRoute(Name = "stateKey")] string stateKey)
      => throw new NotImplementedException();

    [HttpGet("rooms/{roomId}/state")]
    public Task GetRoomState(
      [FromRoute(Name = "roomId")] string roomId)
      => throw new NotImplementedException();

    [HttpGet("rooms/{roomId}/members")]
    public Task GetRoomMembers(
      [FromRoute(Name = "roomId")] string roomId)
      => throw new NotImplementedException();

    [HttpGet("rooms/{roomId}/joined_members")]
    public Task GetRoomJoinedMembers(
      [FromRoute(Name = "roomId")] string roomId)
      => throw new NotImplementedException();

    [HttpGet("rooms/{roomId}/messages")]
    public Task GetRoomMessages(
      [FromRoute(Name = "roomId")] string roomId)
      => throw new NotImplementedException();

    [HttpPut("rooms/{roomId}/send/{eventType}/{txnId}")]
    public Task PutRoomEvent(
      [FromRoute(Name = "roomId")] string roomId,
      [FromRoute(Name = "eventType")] string eventType,
      [FromRoute(Name = "txnId")] string txnId)
      => throw new NotImplementedException();

    [HttpPut("rooms/{roomId}/state/{eventType}/{stateKey}")]
    public Task PutRoomState(
      [FromRoute(Name = "roomId")] string roomId,
      [FromRoute(Name = "eventType")] string eventType,
      [FromRoute(Name = "stateKey")] string stateKey)
      => throw new NotImplementedException();

    [HttpPut("rooms/{roomId}/redact/{eventId}/{txnId}")]
    public Task PutRoomRedact(
      [FromRoute(Name = "roomId")] string roomId,
      [FromRoute(Name = "eventId")] string eventId,
      [FromRoute(Name = "txnId")] string txnId)
      => throw new NotImplementedException();

    [HttpGet("joined_rooms")]
    public Task GetJoinedRooms()
      => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/invite")]
    public Task PostRoomInvite(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/join")]
    public Task PostRoomJoin(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPost("join/{roomIdOrAlias}")]
    public Task PostRoomJoinAlias(
      [FromRoute(Name = "roomIdOrAlias")] string roomIdOrAlias
    ) => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/leave")]
    public Task PostRoomLeave(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/forget")]
    public Task PostRoomForget(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/kick")]
    public Task PostRoomKick(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/ban")]
    public Task PostRoomBan(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();

    [HttpPost("rooms/{roomId}/unban")]
    public Task PostRoomUnban(
      [FromRoute(Name = "roomId")] string roomId
    ) => throw new NotImplementedException();
  }
}