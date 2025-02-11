using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using P20_Tran.Models;
using P20_Tran.Service;
using Steeltoe.Discovery.Client;

public class Program
{
    public static void Main(string[] args)
    {
        var builder = WebApplication.CreateBuilder(args);

        // Add services to the container.
        builder.Services.AddControllers()
            .AddNewtonsoftJson(options =>
            {
                // Handle reference loop issues during JSON serialization
                options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            });

        // Enable CORS for localhost:3020 only (for development purposes)
        builder.Services.AddCors(options =>
        {
            options.AddPolicy("AllowFrontend",
                policy =>
                {
                    policy.WithOrigins("http://localhost:3020") // Allow only frontend origin
                          .AllowAnyMethod()
                          .AllowAnyHeader()
                          .AllowCredentials();
                });
        });


        // Register services with Scoped lifetime (for dependency injection)
        builder.Services.AddScoped<UserService>();
        builder.Services.AddScoped<TripsService>();
        builder.Services.AddScoped<CompanyService>();
        builder.Services.AddScoped<AdminService>();

        // Register database context (with MySQL) with Scoped lifetime
        builder.Services.AddDbContext<p20_safar1Context>(options =>
        {
            options.UseMySql(builder.Configuration.GetConnectionString("SafarDB"),
                new MySqlServerVersion(new Version(8, 0, 21)))
                .EnableDetailedErrors()
                .EnableSensitiveDataLogging()
                .ConfigureWarnings(warnings => warnings.Ignore(CoreEventId.DetachedLazyLoadingWarning));
        });

        // Add Swagger (API documentation) for development environment
        builder.Services.AddEndpointsApiExplorer();
        builder.Services.AddSwaggerGen();

        // Add service discovery (Steeltoe Discovery Client)
        builder.Services.AddDiscoveryClient(builder.Configuration);

        var app = builder.Build();

        // Apply CORS globally (must be before authorization)
        app.UseCors("AllowLocalhost3020");

        // Configure the HTTP request pipeline.
        if (app.Environment.IsDevelopment())
        {
            app.UseSwagger();
            app.UseSwaggerUI();
        }

        // Enable service discovery
        app.UseDiscoveryClient();

        // Redirect HTTP to HTTPS (Uncomment if HTTPS is required)
        // app.UseHttpsRedirection();

        // Enable authorization middleware
        app.UseAuthorization();

        // Map controllers to the endpoints
        app.MapControllers();

        // Run the application
        app.Run();
    }
}