using Shoplinhkien.Models;

namespace Shoplinhkien.ModelViews
{
    public class HomeViewVM
    {
        public List<TblTinTuc> TinTucs { get; set; }
        public List<ProductHomeVM> Products { get; set; }
        //public QuangCao quangcao { get; set; }
    }
}
