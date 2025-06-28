using Microsoft.AspNetCore.Mvc;
using WorkLog.Data;
using WorkLog.Models;

namespace WorkLog.Controllers
{
    public class KullanicilarController : Controller
    {
        private readonly AppDbContext _context;

        public KullanicilarController(AppDbContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var kullanicilar = _context.Kullanicilar.ToList();
            return View(kullanicilar);
        }

        public IActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Kullanici kullanici)
        {
            if (ModelState.IsValid)
            {
                _context.Kullanicilar.Add(kullanici);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(kullanici);
        }
    }
}
