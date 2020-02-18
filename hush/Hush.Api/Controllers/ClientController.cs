using System;
using System.Collections.Generic;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Hush.SQL;
using Microsoft.AspNetCore.Mvc;

namespace Hush.Api.Controllers
{
//  public static class Presence
//  {
//    public const string Online = "online";
//    public const string Offline = "offline";
//    public const string Unavailable = "unavailable";
//  }
//
//  public class Requester
//  {
//    public string User { get; set; }
//    public string DeviceId { get; set; }
//    public bool IsGuest { get; set; }
//  }
//
//
//  public class Timeline
//  {
//    [JsonPropertyName("limited")] public bool Limited { get; set; }
//    [JsonPropertyName("events")] public Event[] Events { get; set; }
//    [JsonPropertyName("prev_batch")] public string PrevBatch { get; set; }
//  }
//
//  public class JoinRoom
//  {
//    [JsonPropertyName("event_map")] public string EventMap { get; set; }
//    [JsonPropertyName("timeline")] public Timeline Timeline { get; set; }
//  }
//
//  public class InviteRoom
//  {
//  }
//
//  public class LeaveRoom
//  {
//  }
//
//  public class SyncRooms
//  {
//    [JsonPropertyName("join")] public Dictionary<string, JoinRoom> Join { get; set; }
//    [JsonPropertyName("invite")] public Dictionary<string, InviteRoom> Invite { get; set; }
//    [JsonPropertyName("leave")] public Dictionary<string, LeaveRoom> Leave { get; set; }
//  }
//
//  public class ClientSyncResponse
//  {
//    [JsonPropertyName("next_batch")] public string NextBatch { get; set; }
//    [JsonPropertyName("presence")] public string Presence { get; set; }
//    [JsonPropertyName("rooms")] public SyncRooms Rooms { get; set; }
//  }

  [ApiController]
  [Route("client/r0")]
  public class ClientController : ControllerBase
  {
    [HttpGet("events")]
    public Task GetEvents()
      => throw new NotImplementedException();

    [HttpGet("initialSync")]
    public Task GetInitialSync()
      => throw new NotImplementedException();

    [HttpGet("events/{eventId}")]
    public Task GetEvent([FromQuery(Name = "eventId")] string eventId)
      => throw new NotImplementedException();

    [HttpGet("sync")]
    public Task GetSync(
      [FromQuery(Name = "since")] string? since,
      [FromQuery(Name = "timeout")] int? timeout,
      [FromQuery(Name = "set_presence")] string? presence,
      [FromQuery(Name = "filter")] string? filter)
      => throw new NotImplementedException();
  }
}