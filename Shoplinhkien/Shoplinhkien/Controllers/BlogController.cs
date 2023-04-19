using Microsoft.AspNetCore.Mvc;

namespace Shoplinhkien.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
