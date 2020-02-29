using System.Security.Claims;

namespace ghost.Util
{
  public static class ClaimExtension
  {
    public static string Id(this ClaimsPrincipal principal) => principal.FindFirstValue(ClaimTypes.NameIdentifier);
  }
}