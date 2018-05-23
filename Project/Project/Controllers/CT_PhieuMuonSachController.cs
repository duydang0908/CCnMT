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
    public class CT_PhieuMuonSachController : Controller
    {
        private QLThuVienEntities1 db = new QLThuVienEntities1();

        // GET: CT_PhieuMuonSach
        [Authorize]
        public async Task<ActionResult> Index()
        {
            var cT_PhieuMuonSach = db.CT_PhieuMuonSach.Include(c => c.PhieuMuonSach).Include(c => c.SACH);
            return View(await cT_PhieuMuonSach.ToListAsync());
        }

        // GET: CT_PhieuMuonSach/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CT_PhieuMuonSach cT_PhieuMuonSach = await db.CT_PhieuMuonSach.FindAsync(id);
            if (cT_PhieuMuonSach == null)
            {
                return HttpNotFound();
            }
            return View(cT_PhieuMuonSach);
        }

        // GET: CT_PhieuMuonSach/Create
        public ActionResult Create()
        {
            ViewBag.MaPhieuMuon = new SelectList(db.PhieuMuonSaches, "MaPhieuMuon", "MaPhieuMuon");
            ViewBag.Masach = new SelectList(db.SACHes, "Masach", "Tensach");
            return View();
        }

        // POST: CT_PhieuMuonSach/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaPhieuMuon,Masach,SoLuong")] CT_PhieuMuonSach cT_PhieuMuonSach)
        {
            if (ModelState.IsValid)
            {
                db.CT_PhieuMuonSach.Add(cT_PhieuMuonSach);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaPhieuMuon = new SelectList(db.PhieuMuonSaches, "MaPhieuMuon", "MaPhieuMuon", cT_PhieuMuonSach.MaPhieuMuon);
            ViewBag.Masach = new SelectList(db.SACHes, "Masach", "Tensach", cT_PhieuMuonSach.Masach);
            return View(cT_PhieuMuonSach);
        }

        // GET: CT_PhieuMuonSach/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CT_PhieuMuonSach cT_PhieuMuonSach = await db.CT_PhieuMuonSach.FindAsync(id);
            if (cT_PhieuMuonSach == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaPhieuMuon = new SelectList(db.PhieuMuonSaches, "MaPhieuMuon", "MaPhieuMuon", cT_PhieuMuonSach.MaPhieuMuon);
            ViewBag.Masach = new SelectList(db.SACHes, "Masach", "Tensach", cT_PhieuMuonSach.Masach);
            return View(cT_PhieuMuonSach);
        }

        // POST: CT_PhieuMuonSach/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaPhieuMuon,Masach,SoLuong")] CT_PhieuMuonSach cT_PhieuMuonSach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cT_PhieuMuonSach).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaPhieuMuon = new SelectList(db.PhieuMuonSaches, "MaPhieuMuon", "MaPhieuMuon", cT_PhieuMuonSach.MaPhieuMuon);
            ViewBag.Masach = new SelectList(db.SACHes, "Masach", "Tensach", cT_PhieuMuonSach.Masach);
            return View(cT_PhieuMuonSach);
        }

        // GET: CT_PhieuMuonSach/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CT_PhieuMuonSach cT_PhieuMuonSach = await db.CT_PhieuMuonSach.FindAsync(id);
            if (cT_PhieuMuonSach == null)
            {
                return HttpNotFound();
            }
            return View(cT_PhieuMuonSach);
        }

        // POST: CT_PhieuMuonSach/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            CT_PhieuMuonSach cT_PhieuMuonSach = await db.CT_PhieuMuonSach.FindAsync(id);
            db.CT_PhieuMuonSach.Remove(cT_PhieuMuonSach);
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
