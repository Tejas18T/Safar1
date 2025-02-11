using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using P20_Tran.Models;
using P20_Tran.DTO;

namespace P20_Tran.Service
{
    public class AdminService
    {
        private readonly p20_safar1Context _context;

        public AdminService(p20_safar1Context context)
        {
            _context = context;
        }

        public async Task<List<Company>> GetAllActiveCompaniesAsync()
        {
            return await _context.Companies.Include(c => c.Packages).Where(c => c.UserId != null).ToListAsync();
        }

        public async Task<List<Company>> GetForApprovalAsync()
        {
            return await _context.Companies.Where(c => c.UserId == null).ToListAsync();
        }

        public async Task<bool> ApproveCompanyAsync(int companyId)
        {
            var company = await _context.Companies.FindAsync(companyId);
            if (company == null)
                return false;

            company.UserId = company.CompanyId; // Assuming approval links userId to companyId
            _context.Companies.Update(company);
            return await _context.SaveChangesAsync() > 0;
        }

        //public async Task<bool> DeleteCompanyAsync(int companyId)
        //{
        //    // Fetch the company along with the associated user
        //    var company = await _context.Companies.FirstOrDefaultAsync(c => c.UserId == companyId);
        //    Console.WriteLine(company);
        //    if (company == null)
        //        return false;

        //    // Set the user's account status to 0
        //    company.User.AccountStatus = 0;

        //    // Save changes to persist the update
        //    return await _context.SaveChangesAsync() > 0;
        //}

    }

    public class TripsService
    {
        private readonly p20_safar1Context _context;

        public TripsService(p20_safar1Context context)
        {
            _context = context;
        }

        public async Task<List<TripDto>> GetAllTripsAsync()
        {
            using (var context = new p20_safar1Context())
            {
                var trips = await context.Trips
                    .Where(t => t.TripsStatus == 1)  // Filter only active trips
                    .Select(t => new TripDto
                    {
                        TripId = t.TripId,
                        TripName = t.Package.PackageName,
                        Destination = t.Package.Destination,
                        StartDate = t.StartDate,
                        EndDate = t.EndDate,
                        Price = t.Package.PersonPerPackage,
                        Description = t.Package.Description,
                        CompanyId = t.Package.CompanyId,
                        Imgdesc = t.Package.ImageDesc
                        // Excluding Addtowishlists, Bookings, and Tourists
                    })
                    .ToListAsync();

                return trips;
            }
        }



        public async Task<bool> DeleteTripAsync(int tripId)
        {
            var trip = await _context.Trips.FirstOrDefaultAsync(t => t.TripId == tripId);

            if (trip == null)
                return false;

            trip.TripsStatus = 0; // Set trip as inactive instead of deleting

            return await _context.SaveChangesAsync() > 0;
        }

    }

    public class UserService
    {
        private readonly p20_safar1Context _context;

        public UserService(p20_safar1Context context)
        {
            _context = context;
        }

        public async Task<bool> RegisterAdminAsync(DummyUser user)
        {
            var newUser = new User
            {
                RoleId = 1,
                Username = user.Username,
                Password = user.Password,
                Firstname = user.Firstname,
                Lastname = user.Lastname,
                Contactno = user.Contactno,
                Email = user.Email,
                Address = user.Address,
                AccountStatus = 1
            };
            _context.Users.Add(newUser);
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<List<User>> GetAllInactiveUsersAsync()
        {
            return await _context.Users
                                 .Where(u => u.AccountStatus == 0 && u.RoleId == 2) // Fetch only inactive users
                                 .ToListAsync();
        }

        public async Task<bool> ActivateUserAsync(int userId)
        {
            var user = await _context.Users.FirstOrDefaultAsync(u => u.UserId == userId);
            if (user == null)
                return false;

            user.AccountStatus = 1; // Set user as active
            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<List<User>> GetAllActiveUsersAsync()
        {
            return await _context.Users
                                 .Where(u => u.AccountStatus == 1  && u.RoleId==2) // Fetch only active users
                                 .ToListAsync();
        }


        public async Task<bool> DeleteUserAsync(int userId)
        {
            var user = await _context.Users
                .FirstOrDefaultAsync(u => u.UserId == userId);

            if (user == null)
                return false;

            user.AccountStatus = 0; // Set account as inactive

            return await _context.SaveChangesAsync() > 0;
        }
    }

    public class CompanyService
    {
        private readonly p20_safar1Context _context;

        public CompanyService(p20_safar1Context context)
        {
            _context = context;
        }

        public async Task<List<CompanyDto>> GetAllActiveCompaniesAsync()
        {
            return await _context.Companies
                .Where(c => c.User.AccountStatus==1)
                .Select(c => new CompanyDto
                {
                    CompanyId = c.CompanyId,
                    Name = c.CompanyName,
                    Email = c.User.Email,
                    PhoneNumber = c.User.Contactno,
                    Address = c.User.Address,
                    UserId = c.UserId
                    // Excluding Packages
                })
                .ToListAsync();
        }


        public async Task<List<CompanyDto>> GetForApprovalAsync()
        {
            return await _context.Companies
                .Where(c => c.User.AccountStatus == 0)
                .Select(c => new CompanyDto
                {
                    CompanyId = c.CompanyId,
                    Name = c.CompanyName,
                    Email = c.User.Email,
                    PhoneNumber = c.User.Contactno,
                    Address = c.User.Address,
                    UserId = c.UserId
                    // Excluding Packages
                })
                .ToListAsync();
        }


        public async Task<bool> ApproveCompanyAsync(int companyId)
        {
            var company = await _context.Companies
                .Include(c => c.User) // Include User to update AccountStatus
                .FirstOrDefaultAsync(c => c.CompanyId == companyId);

            if (company == null)
                return false;

            company.User.AccountStatus = 1; // Set account as inactive

            return await _context.SaveChangesAsync() > 0;
        }

        public async Task<bool> DeleteCompanyAsync(int companyId)
        {
            var company = await _context.Companies
                .Include(c => c.User) // Include User to update AccountStatus
                .FirstOrDefaultAsync(c => c.CompanyId == companyId);

            if (company == null)
                return false;

            company.User.AccountStatus = 0; // Set account as inactive

            return await _context.SaveChangesAsync() > 0;
        }
    }
}
