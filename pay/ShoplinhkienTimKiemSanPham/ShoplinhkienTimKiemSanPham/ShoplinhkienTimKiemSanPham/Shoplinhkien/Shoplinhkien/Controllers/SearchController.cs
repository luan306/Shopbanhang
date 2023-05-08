using Microsoft.AspNetCore.Mvc;
using Shoplinhkien.Models;

namespace Shoplinhkien.Controllers
{
    public class SearchController : Controller
    {
        private readonly ShoplinkkienContext _context;

        public SearchController(ShoplinkkienContext context)
        {
            _context = context;
        }
        // GET: /<controller>/
        //[HttpPost]
        //public IActionResult FindProduct(string keyword)
        //{
        //    List<Product> ls = new List<Product>();
        //    if (string.IsNullOrEmpty(keyword) || keyword.Length < 1)
        //    {
        //        return PartialView("ListProductsSearchPartial", null);
        //    }
        //    ls = _context.Products.AsNoTracking()
        //                          .Where(x => x.ProductName.Contains(keyword))
        //                          .OrderByDescending(x => x.ProductName)
        //                          .ToList();
        //    if (ls == null)
        //    {
        //        return PartialView("ListProductsSearchPartial", null);
        //    }
        //    else
        //    {
        //        return PartialView("ListProductsSearchPartial", ls);
        //    }
        //}
    }
}
