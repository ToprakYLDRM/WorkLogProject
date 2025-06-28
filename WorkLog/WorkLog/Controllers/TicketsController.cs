using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using WorkLog.Data;
using WorkLog.Models;

namespace WorkLog.Controllers
{
    public class TicketsController : Controller
    {
        private readonly AppDbContext _context;

        public TicketsController(AppDbContext context)
        {
            _context = context;
        }

        public async Task<IActionResult> Index(string musteri, string kategori, string kullanici, DateTime? tarih, string searchString)
        {
            var tickets = _context.Tickets.AsQueryable();

            if (!string.IsNullOrEmpty(musteri))
                tickets = tickets.Where(t => t.Musteri == musteri);

            if (!string.IsNullOrEmpty(kategori))
                tickets = tickets.Where(t => t.Kategori == kategori);

            if (!string.IsNullOrEmpty(kullanici))
                tickets = tickets.Where(t => t.Kullanici == kullanici);

            if (tarih.HasValue)
                tickets = tickets.Where(t => t.Tarih.Date == tarih.Value.Date);

            if (!string.IsNullOrEmpty(searchString))
            {
                tickets = tickets.Where(s =>
                    s.Baslik.Contains(searchString) ||
                    s.Aciklama.Contains(searchString) ||
                    s.Musteri.Contains(searchString) ||
                    s.Kategori.Contains(searchString) ||
                    s.Kullanici.Contains(searchString)
                );
                ViewData["CurrentFilter"] = searchString;
            }
            else
            {
                ViewData["CurrentFilter"] = string.Empty;
            }

            return View(await tickets.ToListAsync());
        }

        public IActionResult Create()
        {
            ViewBag.Musteriler = _context.Musteriler.ToList();
            ViewBag.Kategoriler = _context.Kategoriler.ToList();
            ViewBag.Kullanicilar = _context.Kullanicilar.ToList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Ticket ticket)
        {
            if (ModelState.IsValid)
            {
                _context.Tickets.Add(ticket);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }
            return View(ticket);
        }


        public IActionResult Edit(int? id)
        {
            if (id == null) return NotFound();

            var ticket = _context.Tickets.Find(id);
            if (ticket == null) return NotFound();

            ViewBag.Musteriler = _context.Musteriler.ToList();
            ViewBag.Kategoriler = _context.Kategoriler.ToList();
            ViewBag.Kullanicilar = _context.Kullanicilar.ToList();

            return View(ticket);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Edit(int id, Ticket ticket)
        {
            if (id != ticket.Id) return NotFound();

            if (ModelState.IsValid)
            {
                _context.Update(ticket);
                _context.SaveChanges();
                return RedirectToAction(nameof(Index));
            }

            ViewBag.Musteriler = _context.Musteriler.ToList();
            ViewBag.Kategoriler = _context.Kategoriler.ToList();
            ViewBag.Kullanicilar = _context.Kullanicilar.ToList();

            return View(ticket);
        }

        public IActionResult Delete(int? id)
        {
            if (id == null) return NotFound();

            var ticket = _context.Tickets.FirstOrDefault(t => t.Id == id);
            if (ticket == null) return NotFound();

            return View(ticket);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public IActionResult DeleteConfirmed(int id)
        {
            var ticket = _context.Tickets.Find(id);
            if (ticket != null)
            {
                _context.Tickets.Remove(ticket);
                _context.SaveChanges();
            }

            return RedirectToAction(nameof(Index));
        }


    }
}
