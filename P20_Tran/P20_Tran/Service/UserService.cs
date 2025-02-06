using Microsoft.EntityFrameworkCore;
using P20_Tran.Models;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Text;

namespace P20_Tran.Service
{
    public class UserService
    {
        private readonly p20_safar1Context _context;

        // Constructor to inject the database context
        public UserService(p20_safar1Context context)
        {
            _context = context;
        }
        public async Task<User> ValidateLoginAsync(string username, string password)
        {
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                return null; // Invalid input
            }

            var user = await _context.Users.FirstOrDefaultAsync(u => u.Username == username && u.Password== password);

            if (user == null)
            {
                return null; // User not found
            }

            

            return user; // Valid user
        }

        // Check if email exists in the system
        public async Task<User> CheckEmailExistsAsync(string email)
        {
            return await _context.Users.FirstOrDefaultAsync(u => u.Email == email);
        }

        // Update password
        public async Task<bool> UpdatePasswordAsync(string email, string newPassword)
        {
            if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(newPassword))
            {
                return false; // Email or password can't be empty
            }

            // Fetch the user by email
            var user = await _context.Users.FirstOrDefaultAsync(u => u.Email == email);
            if (user == null)
            {
                return false; // User not found
            }

            // Hash the new password using SHA256
            user.Password = HashPassword(newPassword);

            // Save the changes to the database
            _context.Users.Update(user);
            var result = await _context.SaveChangesAsync();

            return result > 0; // If the result is greater than 0, the password was successfully updated
        }

        // Method to hash a password using SHA256
        public static string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                // Convert the password to a byte array
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));

                // Convert the byte array back to a string (hexadecimal representation)
                StringBuilder builder = new StringBuilder();
                foreach (var byteValue in bytes)
                {
                    builder.Append(byteValue.ToString("x2"));
                }

                return builder.ToString(); // Return hashed password as a hexadecimal string
            }
        }

        // Method to verify a password using SHA256
        public static bool VerifyPassword(string password, string hashedPassword)
        {
            // Hash the input password and compare with the stored hashed password
            var hashedInput = HashPassword(password);
            return hashedInput.Equals(hashedPassword);
        }
    }
}
