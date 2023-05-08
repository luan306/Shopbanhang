using AspNetCoreHero.ToastNotification.Abstractions;
using BraintreeHttp;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PayPal.Core;
using PayPal.v1.Payments;
using Shoplinhkien.Extension;
using Shoplinhkien.Helpper;
using Shoplinhkien.Models;
using Shoplinhkien.ModelViews;
using Order = Shoplinhkien.Models.Order;
using Payment = PayPal.v1.Payments.Payment;

namespace Shoplinhkien.Controllers
{
    public class CheckoutController : Controller
    {
        private readonly ShoplinkkienContext _context;
        private readonly string _clientId;
        private readonly string _secretKey;
        public double TyGiaUSD = 23300;
        public INotyfService _notyfService { get; }
        public CheckoutController(ShoplinkkienContext context, INotyfService notyfService, IConfiguration config)
        {
            _context = context;
            _notyfService = notyfService;
            _clientId = config["PaypalSettings:ClientId"];
            _secretKey = config["PaypalSettings:SecretKey"];
        }
        public List<CartItem> GioHang
        {
            get
            {
                var gh = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (gh == default(List<CartItem>))
                {
                    gh = new List<CartItem>();
                }
                return gh;
            }
        }
        [Route("checkout.html", Name = "Checkout")]
        public IActionResult Index(string returnUrl = null)
        {
            //Lay gio hang ra de xu ly
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            MuaHangVM model = new MuaHangVM();
            if (taikhoanID != null)
            {
                var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                model.CustomerId = khachhang.CustomerId;
                model.FullName = khachhang.FullName;
                model.Email = khachhang.Email;
                model.Phone = khachhang.Phone;
                model.Address = khachhang.Address;
            }
            ViewData["lsTinhThanh"] = new SelectList(_context.Locations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
            ViewBag.GioHang = cart;
            return View(model);
        }

        [HttpPost]
        [Route("checkout.html", Name = "Checkout")]
        public IActionResult Index(MuaHangVM muaHang)
        {
            //Lay ra gio hang de xu ly
            var cart = HttpContext.Session.Get<List<CartItem>>("GioHang");
            var taikhoanID = HttpContext.Session.GetString("CustomerId");
            MuaHangVM model = new MuaHangVM();
            if (taikhoanID != null)
            {
                var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                model.CustomerId = khachhang.CustomerId;
                model.FullName = khachhang.FullName;
                model.Email = khachhang.Email;
                model.Phone = khachhang.Phone;
                model.Address = khachhang.Address;

                khachhang.LocationId = muaHang.TinhThanh;
                khachhang.District = muaHang.QuanHuyen;
                khachhang.Ward = muaHang.PhuongXa;
                khachhang.Address = muaHang.Address;
                _context.Update(khachhang);
                _context.SaveChanges();
            }
            try
            {
                //if (ModelState.IsValid)
                //{
                //Khoi tao don hang
                Order donhang = new Order();
                donhang.CustomerId = model.CustomerId;
                donhang.Address = model.Address;
                donhang.LocationId = model.TinhThanh;
                donhang.District = model.QuanHuyen;
                donhang.Ward = model.PhuongXa;

                donhang.OrderDate = DateTime.Now;
                donhang.TransactStatusId = 1;//Don hang moi
                donhang.Deleted = false;
                donhang.Paid = false;
                donhang.Note = Utilities.StripHTML(model.Note);
                donhang.Total = Convert.ToInt32(cart.Sum(x => x.TotalMoney));
                _context.Add(donhang);
                _context.SaveChanges();
                //tao danh sach don hang

                foreach (var item in cart)
                {
                    OrderDetail orderDetail = new OrderDetail();
                    orderDetail.OrderId = donhang.OrderId;
                    orderDetail.ProductId = item.product.ProductId;
                    orderDetail.Amount = item.amount;
                    orderDetail.TotalMoney = donhang.Total;
                    orderDetail.Price = item.product.Price;
                    orderDetail.CreateDate = DateTime.Now;
                    _context.Add(orderDetail);
                }
                _context.SaveChanges();
                //clear gio hang
                HttpContext.Session.Remove("GioHang");
                //Xuat thong bao
                _notyfService.Success("Đơn hàng đặt thành công");
                //cap nhat thong tin khach hang
                return RedirectToAction("Success");


                //}
            }
            catch
            {
                ViewData["lsTinhThanh"] = new SelectList(_context.Locations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
                ViewBag.GioHang = cart;
                return View(model);
            }
            ViewData["lsTinhThanh"] = new SelectList(_context.Locations.Where(x => x.Levels == 1).OrderBy(x => x.Type).ToList(), "Location", "Name");
            ViewBag.GioHang = cart;
            return View(model);
        }
        [Route("dat-hang-thanh-cong.html", Name = "Success")]
        public IActionResult Success()
        {
            try
            {
                var taikhoanID = HttpContext.Session.GetString("CustomerId");
                if (string.IsNullOrEmpty(taikhoanID))
                {
                    return RedirectToAction("Login", "Accounts", new { returnUrl = "/dat-hang-thanh-cong.html" });
                }
                var khachhang = _context.Customers.AsNoTracking().SingleOrDefault(x => x.CustomerId == Convert.ToInt32(taikhoanID));
                var donhang = _context.Orders
                    .Where(x => x.CustomerId == Convert.ToInt32(taikhoanID))
                    .OrderByDescending(x => x.OrderDate)
                    .FirstOrDefault();
                MuaHangSuccessVM successVM = new MuaHangSuccessVM();
                successVM.FullName = khachhang.FullName;
                successVM.DonHangID = donhang.OrderId;
                successVM.Phone = khachhang.Phone;
                successVM.Address = khachhang.Address;
                successVM.PhuongXa = GetNameLocation(donhang.Ward.Value);
                successVM.TinhThanh = GetNameLocation(donhang.District.Value);
                return View(successVM);
            }
            catch
            {
                return View();
            }
        }
        public string GetNameLocation(int idlocation)
        {
            try
            {
                var location = _context.Locations.AsNoTracking().SingleOrDefault(x => x.LocationId == idlocation);
                if (location != null)
                {
                    return location.NameWithType;
                }
            }
            catch
            {
                return string.Empty;
            }
            return string.Empty;
        }
        [Authorize]
        public async System.Threading.Tasks.Task<IActionResult> PaypalCheckout()
        {
            var environment = new SandboxEnvironment(_clientId, _secretKey);
            var client = new PayPalHttpClient(environment);

            #region Create Paypal Order
            var itemList = new ItemList()
            {
                Items = new List<Item>()
            };
            var total = Math.Round(GioHang.Sum(p => p.TotalMoney) / TyGiaUSD, 2);
            foreach (var item in GioHang)
            {
                itemList.Items.Add(new Item()
                {
                    Name = item.ProductName,
                    Currency = "USD",
                    Price = Math.Round(item.TotalMoney / TyGiaUSD, 2).ToString(),
                    Quantity = item.amount.ToString(),
                    Sku = "sku",
                    Tax = "0"
                });
            }
            #endregion

            var paypalOrderId = DateTime.Now.Ticks;
            var hostname = $"{HttpContext.Request.Scheme}://{HttpContext.Request.Host}";
            var payment = new Payment()
            {
                Intent = "sale",
                Transactions = new List<Transaction>()
                {
                    new Transaction()
                    {
                        Amount = new Amount()
                        {
                            Total = total.ToString(),
                            Currency = "USD",
                            Details = new AmountDetails
                            {
                                Tax = "0",
                                Shipping = "0",
                                Subtotal = total.ToString()
                            }
                        },
                        ItemList = itemList,
                        Description = $"Invoice #{paypalOrderId}",
                        InvoiceNumber = paypalOrderId.ToString()
                    }
                },
                RedirectUrls = new RedirectUrls()
                {
                    CancelUrl = $"{hostname}/GioHang/CheckoutFail",
                    ReturnUrl = $"{hostname}/GioHang/CheckoutSuccess"
                },
                Payer = new Payer()
                {
                    PaymentMethod = "paypal"
                }
            };

            PaymentCreateRequest request = new PaymentCreateRequest();
            request.RequestBody(payment);

            try
            {
                var response = await client.Execute(request);
                var statusCode = response.StatusCode;
                Payment result = response.Result<Payment>();

                var links = result.Links.GetEnumerator();
                string paypalRedirectUrl = null;
                while (links.MoveNext())
                {
                    LinkDescriptionObject lnk = links.Current;
                    if (lnk.Rel.ToLower().Trim().Equals("approval_url"))
                    {
                        //saving the payapalredirect URL to which user will be redirected for payment  
                        paypalRedirectUrl = lnk.Href;
                    }
                }

                return Redirect(paypalRedirectUrl);
            }
            catch (HttpException httpException)
            {
                var statusCode = httpException.StatusCode;
                var debugId = httpException.Headers.GetValues("PayPal-Debug-Id").FirstOrDefault();

                //Process when Checkout with Paypal fails
                return Redirect("/GioHang/CheckoutFail");
            }
        }

        public IActionResult CheckoutFail()
        {
            //Tạo đơn hàng trong database với trạng thái thanh toán là "Chưa thanh toán"
            //Xóa session
            return View();
        }

        public IActionResult CheckoutSuccess()
        {
            //Tạo đơn hàng trong database với trạng thái thanh toán là "Paypal" và thành công
            //Xóa session
            return View();
        }

    } 
}