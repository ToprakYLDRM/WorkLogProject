using Microsoft.AspNetCore.Mvc;
using WorkLog.Data;
using WorkLog.Models;

namespace WorkLog.Controllers
{
    public class MusterilerController : Controller
    {
        private readonly AppDbContext _context;

        public MusterilerController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var musteriler = _context.Musteriler.ToList();
            return View(musteriler);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Musteri musteri)
        {
            if (ModelState.IsValid)
            {
                _context.Musteriler.Add(musteri);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(musteri);
        }
    }
}
