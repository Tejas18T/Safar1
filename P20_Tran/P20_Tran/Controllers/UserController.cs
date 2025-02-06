using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using P20_Tran.DTO;
using P20_Tran.Models;
using P20_Tran.Service;
using System.Net;
using System.Net.Mail;
using System.Collections.Concurrent;

namespace P20_Tran.Controllers
{
    [Route("")]
    [ApiController]
    [EnableCors("AllowLocalhost3020")]  // Enable CORS for localhost:3020
    public class UserController : ControllerBase
    {
        private readonly UserService _userService;

        // In-memory OTP cache (for simplicity, use a ConcurrentDictionary)
        private static readonly ConcurrentDictionary<string, string> OtpCache = new();

        // Inject UserService into the controller
        public UserController(UserService userService)
        {
            _userService = userService;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginDTO login)
        {
            try
            {
                // Await the async method correctly
                var user = await _userService.ValidateLoginAsync(login.Username, login.Password);

                if (user == null)
                {
                    return Unauthorized("Invalid username or password");
                }

                return Ok(user);  // Return user data (or token)
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }


        // Endpoint to check if email exists in the system
        [HttpPost("checkemail")]
        public async Task<IActionResult> CheckEmail([FromBody] EmailRequest emailRequest)
        {
            if (string.IsNullOrEmpty(emailRequest.Email))
            {
                return BadRequest("Email is required.");
            }

            // Check if the email exists in the database using UserService (or directly from DbContext)
            var user = await _userService.CheckEmailExistsAsync(emailRequest.Email);

            if (user != null)
            {
                // If user exists, return success
                return Ok(new { status = "exists", message = "Email found." });
            }
            else
            {
                // If user doesn't exist, return failure
                return Ok(new { status = "not_found", message = "Email address not found." });
            }
        }

        // Endpoint to send OTP to the user's email
        [HttpPost("sendotp")]
        public async Task<IActionResult> SendOtp([FromBody] EmailRequest emailRequest)
        {
            if (string.IsNullOrEmpty(emailRequest.Email))
            {
                return BadRequest("Email is required.");
            }

            // Check if email exists in the system
            var user = await _userService.CheckEmailExistsAsync(emailRequest.Email);
            if (user == null)
            {
                return BadRequest("Email address not found.");
            }

            // Generate OTP (for simplicity, we use a random number here)
            var otp = new Random().Next(1000, 9999).ToString();

            // Save OTP to the in-memory cache (you should use a more persistent store in production)
            OtpCache[emailRequest.Email] = otp;

            // Send OTP to user's email
            var mailMessage = new MailMessage("tejas18thorat@gmail.com", emailRequest.Email)
            {
                Subject = "Your OTP for Password Reset",
                Body = $"Your OTP for password reset is: {otp}",
                IsBodyHtml = false
            };

            using (var smtpClient = new SmtpClient("smtp.example.com"))
            {
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential("tejas18thorat@gmail.com", "@Virat18");
                smtpClient.EnableSsl = true;

                try
                {
                    await smtpClient.SendMailAsync(mailMessage);
                }
                catch (Exception ex)
                {
                    return StatusCode(500, $"Error sending OTP email: {ex.Message}");
                }
            }

            return Ok(new { status = "otp_sent", message = "OTP has been sent." });
        }

        // Endpoint to validate the OTP sent to the user
        [HttpPost("validateotp")]
        public IActionResult ValidateOtp([FromBody] OtpRequest otpRequest)
        {
            if (string.IsNullOrEmpty(otpRequest.Email) || string.IsNullOrEmpty(otpRequest.Otp))
            {
                return BadRequest("Email and OTP are required.");
            }

            // Check if OTP is correct
            if (OtpCache.ContainsKey(otpRequest.Email) && OtpCache[otpRequest.Email] == otpRequest.Otp)
            {
                // OTP is correct
                return Ok(new { status = "otp_valid", message = "OTP is valid." });
            }
            else
            {
                // OTP is invalid
                return BadRequest("Invalid OTP.");
            }
        }

        [HttpPost("updatepassword")]
        public async Task<IActionResult> UpdatePassword([FromBody] PasswordUpdateRequest passwordUpdateRequest)
        {
            if (string.IsNullOrEmpty(passwordUpdateRequest.Email) || string.IsNullOrEmpty(passwordUpdateRequest.NewPassword))
            {
                return BadRequest("Email and new password are required.");
            }

            // Update the password in the database (using _userService)
            var result = await _userService.UpdatePasswordAsync(passwordUpdateRequest.Email, passwordUpdateRequest.NewPassword);

            if (result)
            {
                // Password updated successfully
                return Ok(new { status = "success", message = "Password updated successfully." });
            }
            else
            {
                // Something went wrong (either user not found or other issues)
                return BadRequest("Error updating password.");
            }
        }
    }
}
