using Shoplinhkien.Models;

namespace Shoplinhkien.ModelViews
{
    public class ProductHomeVM
    {
        public Category category { get; set; }
        public List<Product> lsProducts { get; set; }
    }
}
