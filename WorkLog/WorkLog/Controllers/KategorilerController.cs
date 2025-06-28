using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WorkLog.Data;
using WorkLog.Models;


namespace TicketProject.Controllers
{
    public class KategorilerController : Controller
    {
        private readonly AppDbContext _context;

        public KategorilerController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var kategoriler = _context.Kategoriler.ToList();
            return View(kategoriler);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Kategori kategori)
        {
            if (ModelState.IsValid)
            {
                _context.Kategoriler.Add(kategori);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(kategori);
        }
    }
}

