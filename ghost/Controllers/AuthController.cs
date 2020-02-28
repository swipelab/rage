using System;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using ghost.Database;
using ghost.Util;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;

namespace ghost.Controllers
{
  [Route("api/auth")]
  public class AuthController
  {
    private readonly IConfiguration _configuration;
    private readonly RageDb _db;

    public AuthController(IConfiguration configuration, RageDb db)
    {
      _configuration = configuration;
      _db = db;
    }

    [HttpPost("login")]
    public async Task<LoginResult> Login([FromBody] LoginArgs args)
    {
      var identifier =
        await _db.Identifiers.FirstAsync(x =>
          x.Medium == args.Identifier.Medium && x.Address == args.Identifier.Address && x.IsValid);

      var tokenHandler = new JwtSecurityTokenHandler();
      var secret = _configuration.GetValue<string>("Jwt:Secret");
      var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secret));
      var tokenDescriptor = new SecurityTokenDescriptor
      {
        Subject = new ClaimsIdentity(new Claim[]
        {
          new Claim(ClaimTypes.Name, identifier.UserId),
        }),
        Expires = DateTime.UtcNow.AddDays(365),
        SigningCredentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256Signature)
      };

      var token = tokenHandler.CreateToken(tokenDescriptor);

      return new LoginResult
      {
        Token = tokenHandler.WriteToken(token)
      };
    }

    [Authorize]
    [HttpPost("change-password")]
    public async Task ChangePassword([FromBody] ChangePasswordArgs args)
    {
      var userId = "alex"; //TODO:
      var hash = Hash.ToSha256(args.Password);

      var credential = await _db.Credentials.FindAsync(userId);

      if (credential == null)
      {
        credential = new RxCredential
        {
          UserId = userId,
          Hash = hash
        };
        await _db.AddAsync(credential);
      }
      else
      {
        credential.Hash = hash;
        _db.Update(credential);
      }

      await _db.SaveChangesAsync();
    }


    public class ChangePasswordArgs
    {
      public string Password { get; set; }
    }

    public class LoginArgs
    {
      public Identifier Identifier { get; set; }
      public string Password { get; set; }
    }

    public class LoginResult
    {
      public string Token { get; set; }
    }

    public class Identifier
    {
      public string Medium { get; set; }
      public string Address { get; set; }
    }
  }
}