namespace Hush.SQL
{
  public class RoomMembership
  {
    public string EventId { get; set; }
    public string UserId { get; set; }
    public string Sender { get; set; }
    public string RoomId { get; set; }
    public string Membership { get; set; }
    public int Forgotten { get; set; }
    public string Alias { get; set; }
    public string AvatarUrl { get; set; }
  }
}