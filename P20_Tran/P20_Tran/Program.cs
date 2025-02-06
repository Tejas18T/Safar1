using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Diagnostics;
using P20_Tran.Models;
using P20_Tran.Service;

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
    options.AddPolicy("AllowLocalhost3020",
        builder => builder
            .WithOrigins("http://localhost:3020") // Allow only this origin
            .AllowAnyMethod()   // Allow all HTTP methods (GET, POST, PUT, DELETE, etc.)
            .AllowAnyHeader()); // Allow all headers
});

// Register UserService with Scoped lifetime (for dependency injection)
builder.Services.AddScoped<UserService>();

// Register database context (with MySQL) with Scoped lifetime
builder.Services.AddDbContext<p20_safar1Context>(options =>
{
    options.UseMySql(builder.Configuration.GetConnectionString("SafarDB"),
        new MySqlServerVersion(new Version(8, 0, 21)))
         .EnableDetailedErrors() // Enable detailed error messages from EF Core
        .EnableSensitiveDataLogging()
        .ConfigureWarnings(warnings => warnings.Ignore(CoreEventId.DetachedLazyLoadingWarning));  
}, ServiceLifetime.Scoped);

// Add Swagger (API documentation) for development environment
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

// Apply CORS globally (must be before authorization)
app.UseCors("AllowLocalhost3020");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

// Redirect HTTP to HTTPS
app.UseHttpsRedirection();

// Enable authorization middleware
app.UseAuthorization();

// Map controllers to the endpoints
app.MapControllers();

// Run the application
app.Run();
