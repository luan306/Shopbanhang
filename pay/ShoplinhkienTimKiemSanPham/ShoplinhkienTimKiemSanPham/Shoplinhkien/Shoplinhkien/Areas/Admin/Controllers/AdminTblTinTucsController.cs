using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using PagedList.Core;
using Shoplinhkien.Helpper;
using Shoplinhkien.Models;

namespace Shoplinhkien.Areas.Admin.Controllers
{
    [Area("Admin")]
    //[Authorize]
    public class AdminTblTinTucsController : Controller
    {
        private readonly ShoplinkkienContext _context;
        public INotyfService _notyfService { get; }

        public AdminTblTinTucsController(ShoplinkkienContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        //GET: Admin/AdminTblTinTucs
        //public IActionResult Index(int? page)
        //{
        //    var pageNumber = page == null || page <= 0 ? 1 : page.Value;
        //    var pageSize = 20;
        //    var lsTblTinTuc = _context.TblTinTucs.AsNoTracking().OrderByDescending(x => x.PostId);
        //    PagedList<TblTinTuc> models = new PagedList<TblTinTuc>(lsTblTinTuc, pageNumber, pageSize);
        //    ViewBag.CurrentPage = pageNumber;
        //    return View(models);
        //}
        public IActionResult Index(int? page)
        {

            var collection = _context.TblTinTucs.AsNoTracking().ToList();
            foreach (var item in collection)
            {
                if (item.CreatedDate == null)
                {
                    item.CreatedDate = DateTime.Now;
                    _context.Update(item);
                    _context.SaveChanges();
                }
            }

            var pageNumber = page == null || page <= 0 ? 1 : page.Value;
            var pageSize = 10;
            var lsTinDangs = _context.TblTinTucs
                .AsNoTracking()
                .OrderBy(x => x.PostId);
            PagedList<TblTinTuc> models = new PagedList<TblTinTuc>(lsTinDangs, pageNumber, pageSize);

            ViewBag.CurrentPage = pageNumber;
            return View(models);
        }

        // GET: Admin/AdminTblTinTucs/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.TblTinTucs == null)
            {
                return NotFound();
            }

            var tblTinTuc = await _context.TblTinTucs
                .FirstOrDefaultAsync(m => m.PostId == id);
            if (tblTinTuc == null)
            {
                return NotFound();
            }

            return View(tblTinTuc);
        }

        // GET: Admin/AdminTblTinTucs/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminTblTinTucs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PostId,Title,Scontents,Contents,Thumb,Published,Alias,CreatedDate,Author,AccountId,Tags,CatId,IsHot,IsNewfeed,MetaKey,MetaDesc,Views")] TblTinTuc tblTinTuc, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (ModelState.IsValid)
            {
                //Xu ly Thumb
                if (fThumb != null)
                {
                    string extension = Path.GetExtension(fThumb.FileName);
                    string imageName = Utilities.SEOUrl(tblTinTuc.Title) + extension;
                    tblTinTuc.Thumb = await Utilities.UploadFile(fThumb, @"news", imageName.ToLower());
                }
                if (string.IsNullOrEmpty(tblTinTuc.Thumb)) tblTinTuc.Thumb = "default.jpg";
                tblTinTuc.Alias = Utilities.SEOUrl(tblTinTuc.Title);
                tblTinTuc.CreatedDate = DateTime.Now;


                _context.Add(tblTinTuc);
                await _context.SaveChangesAsync();
                _notyfService.Success("Thêm mới thành công");
                return RedirectToAction(nameof(Index));
            }
            return View(tblTinTuc);
        }

        // GET: Admin/AdminTblTinTucs/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.TblTinTucs == null)
            {
                return NotFound();
            }

            var tblTinTuc = await _context.TblTinTucs.FindAsync(id);
            if (tblTinTuc == null)
            {
                return NotFound();
            }
            return View(tblTinTuc);
        }

        // POST: Admin/AdminTblTinTucs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PostId,Title,Scontents,Contents,Thumb,Published,Alias,CreatedDate,Author,AccountId,Tags,CatId,IsHot,IsNewfeed,MetaKey,MetaDesc,Views")] TblTinTuc tblTinTuc, Microsoft.AspNetCore.Http.IFormFile fThumb)
        {
            if (id != tblTinTuc.PostId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    //Xu ly Thumb
                    if (fThumb != null)
                    {
                        string extension = Path.GetExtension(fThumb.FileName);
                        string imageName = Utilities.SEOUrl(tblTinTuc.Title) + extension;
                        tblTinTuc.Thumb = await Utilities.UploadFile(fThumb, @"news", imageName.ToLower());
                    }
                    if (string.IsNullOrEmpty(tblTinTuc.Thumb)) tblTinTuc.Thumb = "default.jpg";
                    tblTinTuc.Alias = Utilities.SEOUrl(tblTinTuc.Title);

                    _context.Update(tblTinTuc);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Chỉnh sửa thành công");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TblTinTucExists(tblTinTuc.PostId))
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
            return View(tblTinTuc);
        }

        // GET: Admin/AdminTblTinTucs/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.TblTinTucs == null)
            {
                return NotFound();
            }

            var tblTinTuc = await _context.TblTinTucs
                .FirstOrDefaultAsync(m => m.PostId == id);
            if (tblTinTuc == null)
            {
                return NotFound();
            }

            return View(tblTinTuc);
        }

        // POST: Admin/AdminTblTinTucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var tinDang = await _context.TblTinTucs.FindAsync(id);
            _context.TblTinTucs.Remove(tinDang);
            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa thành công");
            return RedirectToAction(nameof(Index));
        }

        private bool TblTinTucExists(int id)
        {
            return (_context.TblTinTucs?.Any(e => e.PostId == id)).GetValueOrDefault();
        }
    }
}
