using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.Identity.Client;
using Shoplinhkien.Extension;
using Shoplinhkien.Models;
using Shoplinhkien.ModelViews;

namespace Shoplinhkien.Areas.Admin.Controllers
{
    //[Area("Admin")]
    //public class AdminAccountsController : Controller
    //{
    //    private readonly ShoplinkkienContext _context;


    //    public AdminAccountsController(ShoplinkkienContext context)
    //    {
    //        _context = context;
    //    }

    //    // GET: Admin/AdminAccounts
    //    public async Task<IActionResult> Index()
    //    {
    //        ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "Descriptiton");
    //        List<SelectListItem> lsTrangThai = new List<SelectListItem>();
    //        lsTrangThai.Add(new SelectListItem() { Text = "Active", Value = "1" });
    //        lsTrangThai.Add(new SelectListItem() { Text = "Block", Value = "0" });
    //        ViewData["lsTrangThai"] = lsTrangThai;

    //        var shoplinkkienContext = _context.Accounts.Include(a => a.Role);
    //        return View(await shoplinkkienContext.ToListAsync());
    //    }

    //    // GET: Admin/AdminAccounts/Details/5
    //    public async Task<IActionResult> Details(int? id)
    //    {
    //        if (id == null || _context.Accounts == null)
    //        {
    //            return NotFound();
    //        }

    //        var account = await _context.Accounts
    //            .Include(a => a.Role)
    //            .FirstOrDefaultAsync(m => m.AccountId == id);
    //        if (account == null)
    //        {
    //            return NotFound();
    //        }

    //        return View(account);
    //    }

    //    // GET: Admin/AdminAccounts/Create
    //    public IActionResult Create()
    //    {
    //        ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId");
    //        return View();
    //    }

    //    // POST: Admin/AdminAccounts/Create
    //    // To protect from overposting attacks, enable the specific properties you want to bind to.
    //    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public async Task<IActionResult> Create([Bind("AccountId,Phone,Email,Password,Salt,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
    //    {
    //        if (ModelState.IsValid)
    //        {
    //            _context.Add(account);
    //            await _context.SaveChangesAsync();
    //            return RedirectToAction(nameof(Index));
    //        }
    //        ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", account.RoleId);
    //        return View(account);
    //    }

    //    // GET: Admin/AdminAccounts/Edit/5
    //    public async Task<IActionResult> Edit(int? id)
    //    {
    //        if (id == null || _context.Accounts == null)
    //        {
    //            return NotFound();
    //        }

    //        var account = await _context.Accounts.FindAsync(id);
    //        if (account == null)
    //        {
    //            return NotFound();
    //        }
    //        ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", account.RoleId);
    //        return View(account);
    //    }

    //    // POST: Admin/AdminAccounts/Edit/5
    //    // To protect from overposting attacks, enable the specific properties you want to bind to.
    //    // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
    //    [HttpPost]
    //    [ValidateAntiForgeryToken]
    //    public async Task<IActionResult> Edit(int id, [Bind("AccountId,Phone,Email,Password,Salt,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
    //    {
    //        if (id != account.AccountId)
    //        {
    //            return NotFound();
    //        }

    //        if (ModelState.IsValid)
    //        {
    //            try
    //            {
    //                _context.Update(account);
    //                await _context.SaveChangesAsync();
    //            }
    //            catch (DbUpdateConcurrencyException)
    //            {
    //                if (!AccountExists(account.AccountId))
    //                {
    //                    return NotFound();
    //                }
    //                else
    //                {
    //                    throw;
    //                }
    //            }
    //            return RedirectToAction(nameof(Index));
    //        }
    //        ViewData["RoleId"] = new SelectList(_context.Roles, "RoleId", "RoleId", account.RoleId);
    //        return View(account);
    //    }

    //    // GET: Admin/AdminAccounts/Delete/5
    //    public async Task<IActionResult> Delete(int? id)
    //    {
    //        if (id == null || _context.Accounts == null)
    //        {
    //            return NotFound();
    //        }

    //        var account = await _context.Accounts
    //            .Include(a => a.Role)
    //            .FirstOrDefaultAsync(m => m.AccountId == id);
    //        if (account == null)
    //        {
    //            return NotFound();
    //        }

    //        return View(account);
    //    }

    //    // POST: Admin/AdminAccounts/Delete/5
    //    [HttpPost, ActionName("Delete")]
    //    [ValidateAntiForgeryToken]
    //    public async Task<IActionResult> DeleteConfirmed(int id)
    //    {
    //        if (_context.Accounts == null)
    //        {
    //            return Problem("Entity set 'ShoplinkkienContext.Accounts'  is null.");
    //        }
    //        var account = await _context.Accounts.FindAsync(id);
    //        if (account != null)
    //        {
    //            _context.Accounts.Remove(account);
    //        }

    //        await _context.SaveChangesAsync();
    //        return RedirectToAction(nameof(Index));
    //    }

    //    private bool AccountExists(int id)
    //    {
    //        return (_context.Accounts?.Any(e => e.AccountId == id)).GetValueOrDefault();
    //    }



    //}
    [Area("Admin")]
    [Authorize(Roles = "Admin")]
    public class AdminAccountsController : Controller
    {
        private readonly ShoplinkkienContext _context;
        public INotyfService _notyfService { get; }
        public AdminAccountsController(ShoplinkkienContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/AdminAccounts

        public async Task<IActionResult> Index()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "Descriptiton");
            List<SelectListItem> lsTrangThai = new List<SelectListItem>();
            lsTrangThai.Add(new SelectListItem() { Text = "Hoạt động", Value = "1" });
            lsTrangThai.Add(new SelectListItem() { Text = "Khóa", Value = "0" });
            ViewData["lsTrangThai"] = lsTrangThai;



            var dbMarketsContext = _context.Accounts.Include(a => a.Role);
            return View(await dbMarketsContext.ToListAsync());
        }
        public IActionResult Filtter(int AccountId = 0)
        {

            var url = $"/Admin/AdminAccounts?AccountId={AccountId}";
            if (AccountId == 0)
            {
                url = $"/Admin/AdminAccounts";
            }
            return Json(new { status = "success", redirectUrl = url });

        }
        // GET: Admin/AdminAccounts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // GET: Admin/AdminAccounts/Create
        public IActionResult Create()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            return View();
        }

        // POST: Admin/AdminAccounts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("AccountId,Phone,Email,Password,Salt,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
        {
            if (ModelState.IsValid)
            {

                _context.Add(account);
                await _context.SaveChangesAsync();
                _notyfService.Success("Tạo mới tài khoản thành công");
                return RedirectToAction(nameof(Index));
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }
        //ChangePassword
        public IActionResult ChangePassword()
        {
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName");
            return View();
        }

        [HttpPost]
        public IActionResult ChangePassword(ChangePasswordViewModel model)
        {
            if (ModelState.IsValid)
            {
                var taikhoan = _context.Accounts.AsNoTracking().SingleOrDefault(x => x.Email == model.Email);
                if (taikhoan == null) return RedirectToAction("Login", "Accounts");
                var pass = (model.PasswordNow.Trim() + taikhoan.Salt.Trim()).ToMD5();
                {
                    string passnew = (model.Password.Trim() + taikhoan.Salt.Trim()).ToMD5();
                    taikhoan.Password = passnew;
                    taikhoan.LastLogin = DateTime.Now;
                    _context.Update(taikhoan);
                    _context.SaveChanges();
                    _notyfService.Success("Đổi mật khẩu thành công");
                    return RedirectToAction("Login", "Accounts", new { Area = "Admin" });
                }
            }


            return View();
        }

        // GET: Admin/AdminAccounts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts.FindAsync(id);
            if (account == null)
            {
                return NotFound();
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // POST: Admin/AdminAccounts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("AccountId,Phone,Email,Password,Salt,Active,FullName,RoleId,LastLogin,CreateDate")] Account account)
        {
            if (id != account.AccountId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(account);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!AccountExists(account.AccountId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["QuyenTruyCap"] = new SelectList(_context.Roles, "RoleId", "RoleName", account.RoleId);
            return View(account);
        }

        // GET: Admin/AdminAccounts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var account = await _context.Accounts
                .Include(a => a.Role)
                .FirstOrDefaultAsync(m => m.AccountId == id);
            if (account == null)
            {
                return NotFound();
            }

            return View(account);
        }

        // POST: Admin/AdminAccounts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var account = await _context.Accounts.FindAsync(id);
            _context.Accounts.Remove(account);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool AccountExists(int id)
        {
            return _context.Accounts.Any(e => e.AccountId == id);
        }

    }
}
