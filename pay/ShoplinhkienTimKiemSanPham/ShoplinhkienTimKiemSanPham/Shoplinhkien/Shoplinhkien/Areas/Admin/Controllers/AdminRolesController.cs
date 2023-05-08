﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using AspNetCoreHero.ToastNotification.Abstractions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Shoplinhkien.Models;

namespace Shoplinhkien.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class AdminRolesController : Controller
    {
        private readonly ShoplinkkienContext _context;
        public INotyfService _notyfService { get; }

        public AdminRolesController(ShoplinkkienContext context, INotyfService notyfService)
        {
            _context = context;
            _notyfService = notyfService;
        }

        // GET: Admin/AdminRoles
        public async Task<IActionResult> Index()
        {
            //return _context.Roles != null ? 
            //            View(await _context.Roles.ToListAsync()) :
            //            Problem("Entity set 'ShoplinkkienContext.Roles'  is null.");
            return View(await _context.Roles.ToListAsync());
        }

        // GET: Admin/AdminRoles/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            //if (id == null || _context.Roles == null)
            //{
            //    return NotFound();
            //}

            //var role = await _context.Roles
            //    .FirstOrDefaultAsync(m => m.RoleId == id);
            //if (role == null)
            //{
            //    return NotFound();
            //}

            //return View(role);
            if (id == null)
            {
                return NotFound();
            }
            var role = await _context.Roles.FirstOrDefaultAsync(m => m.RoleId == id);
            if (role == null)
            {
                return NotFound();
            }
            return View(role);
        }

        // GET: Admin/AdminRoles/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Admin/AdminRoles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("RoleId,RoleName,Descriptiton")] Role role)
        {
            if (ModelState.IsValid)
            {
                _context.Add(role);
                await _context.SaveChangesAsync();
                _notyfService.Success("Tạo mới thành công");
                return RedirectToAction(nameof(Index));
            }
            return View(role);
        }

        // GET: Admin/AdminRoles/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            //if (id == null || _context.Roles == null)
            //{
            //    return NotFound();
            //}

            //var role = await _context.Roles.FindAsync(id);
            //if (role == null)
            //{
            //    return NotFound();
            //}
            //return View(role);
            if (id == null)
            {
                return NotFound();
            }
            var role = await _context.Roles.FindAsync(id);
            if (role == null)
            {
                return NotFound();
            }
            return View(role);
        }

        // POST: Admin/AdminRoles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("RoleId,RoleName,Descriptiton")] Role role)
        {
            if (id != role.RoleId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(role);
                    await _context.SaveChangesAsync();
                    _notyfService.Success("Cập nhật thành công");
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!RoleExists(role.RoleId))
                    {
                        _notyfService.Success("Có lỗi xảy ra");
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(role);
        }

        // GET: Admin/AdminRoles/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            //if (id == null || _context.Roles == null)
            //{
            //    return NotFound();
            //}

            //var role = await _context.Roles
            //    .FirstOrDefaultAsync(m => m.RoleId == id);
            //if (role == null)
            //{
            //    return NotFound();
            //}

            //return View(role);
            if (id == null)
            {
                return NotFound();
            }
            var role = await _context.Roles.FirstOrDefaultAsync(m => m.RoleId == id);
            if (role == null)
            {
                return NotFound();
            }
            return View(role);
        }

        // POST: Admin/AdminRoles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            //if (_context.Roles == null)
            //{
            //    return Problem("Entity set 'ShoplinkkienContext.Roles'  is null.");
            //}
            //var role = await _context.Roles.FindAsync(id);
            //if (role != null)
            //{
            //    _context.Roles.Remove(role);
            //}

            //await _context.SaveChangesAsync();
            //return RedirectToAction(nameof(Index));
            var role = await _context.Roles.FindAsync(id);
            _context.Roles.Remove(role);
            await _context.SaveChangesAsync();
            _notyfService.Success("Xóa quyền truy cập thành công");
            return RedirectToAction(nameof(Index));
        }

        private bool RoleExists(int id)
        {
            //return (_context.Roles?.Any(e => e.RoleId == id)).GetValueOrDefault();
            return _context.Roles.Any(e => e.RoleId == id);
        }
    }
}
