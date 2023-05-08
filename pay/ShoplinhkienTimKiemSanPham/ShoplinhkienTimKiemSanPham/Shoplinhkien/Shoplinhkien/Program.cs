//using AspNetCoreHero.ToastNotification;
//using Microsoft.EntityFrameworkCore;
//using Shoplinhkien.Models;
//using System.Configuration;
//using System.Text.Encodings.Web;
//using System.Text.Unicode;

//var builder = WebApplication.CreateBuilder(args);

//// Add services to the container.
//var stringConnectdb = builder.Configuration.GetConnectionString("dbshoplinkkien");
//IServiceCollection serviceCollection = builder.Services.AddDbContext<ShoplinkkienContext>(options => options.UseSqlServer(stringConnectdb));
//builder.Services.AddSingleton<HtmlEncoder>(HtmlEncoder.Create(allowedRanges: new[] { UnicodeRanges.All }));
//builder.Services.AddControllersWithViews().AddRazorRuntimeCompilation();
//builder.Services.AddNotyf(config => { config.DurationInSeconds = 3; config.IsDismissable = true; config.Position = NotyfPosition.TopRight; });
//var app = builder.Build();

//// Configure the HTTP request pipeline.
//if (!app.Environment.IsDevelopment())
//{
//    app.UseExceptionHandler("/Home/Error");
//    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
//    app.UseHsts();
//}

//app.UseHttpsRedirection();
//app.UseStaticFiles();

//app.UseRouting();

//app.UseAuthorization();

//app.MapControllerRoute(
//    name: "default",
//    pattern: "{controller=Home}/{action=Index}/{id?}");
//app.MapControllerRoute(
//            name: "areas",
//            pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
//          );
//app.Run();


using Shoplinhkien;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Shoplinhkien
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                });
    }
}

