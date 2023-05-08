using Shoplinhkien.Models;

namespace Shoplinhkien.ModelViews
{
    public class CartItem
    {
        public Product product { get; set; }
        public string TenHH { get; set; }
        public int amount { get; set; }
        public double TotalMoney => amount * product.Price.Value;
        public string ProductName { get; set; }
    }
}
