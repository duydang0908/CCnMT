using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Project;

namespace Project.Controllers
{
    public class PhieuMuonSachesController : Controller
    {
        private QLThuVienEntities1 db = new QLThuVienEntities1();

        // GET: PhieuMuonSaches
        public async Task<ActionResult> Index()
        {
            var phieuMuonSaches = db.PhieuMuonSaches.Include(p => p.DOCGIA);
            return View(await phieuMuonSaches.ToListAsync());
        }

        // GET: PhieuMuonSaches/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuMuonSach phieuMuonSach = await db.PhieuMuonSaches.FindAsync(id);
            if (phieuMuonSach == null)
            {
                return HttpNotFound();
            }
            return View(phieuMuonSach);
        }

        // GET: PhieuMuonSaches/Create
        public ActionResult Create()
        {
            ViewBag.MaDG = new SelectList(db.DOCGIAs, "MaDG", "TenDG");
            return View();
        }

        // POST: PhieuMuonSaches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaPhieuMuon,MaDG,NgayMuon")] PhieuMuonSach phieuMuonSach)
        {
            if (ModelState.IsValid)
            {
                db.PhieuMuonSaches.Add(phieuMuonSach);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaDG = new SelectList(db.DOCGIAs, "MaDG", "TenDG", phieuMuonSach.MaDG);
            return View(phieuMuonSach);
        }

        // GET: PhieuMuonSaches/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuMuonSach phieuMuonSach = await db.PhieuMuonSaches.FindAsync(id);
            if (phieuMuonSach == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaDG = new SelectList(db.DOCGIAs, "MaDG", "TenDG", phieuMuonSach.MaDG);
            return View(phieuMuonSach);
        }

        // POST: PhieuMuonSaches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaPhieuMuon,MaDG,NgayMuon")] PhieuMuonSach phieuMuonSach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(phieuMuonSach).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaDG = new SelectList(db.DOCGIAs, "MaDG", "TenDG", phieuMuonSach.MaDG);
            return View(phieuMuonSach);
        }

        // GET: PhieuMuonSaches/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PhieuMuonSach phieuMuonSach = await db.PhieuMuonSaches.FindAsync(id);
            if (phieuMuonSach == null)
            {
                return HttpNotFound();
            }
            return View(phieuMuonSach);
        }

        // POST: PhieuMuonSaches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            PhieuMuonSach phieuMuonSach = await db.PhieuMuonSaches.FindAsync(id);
            db.PhieuMuonSaches.Remove(phieuMuonSach);
            await db.SaveChangesAsync();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
