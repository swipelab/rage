using System.Security.Cryptography;
using System.Text;

namespace ghost.Util
{
  public static class Hash
  {
    public static string ToSha256(string value)
    {
      using var sha256 = SHA256.Create();
      var bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(value));
      var builder = new StringBuilder();
      foreach (var b in bytes) builder.Append(b.ToString("x2"));
      return builder.ToString();
    }
  }
}