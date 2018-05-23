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
    public class BaoCaoMuonSachesController : Controller
    {
        private QLThuVienEntities1 db = new QLThuVienEntities1();

        // GET: BaoCaoMuonSaches
        [Authorize]
        public async Task<ActionResult> Index()
        {
            var baoCaoMuonSaches = db.BaoCaoMuonSaches.Include(b => b.CHUDE);
            return View(await baoCaoMuonSaches.ToListAsync());
        }

        // GET: BaoCaoMuonSaches/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaoCaoMuonSach baoCaoMuonSach = await db.BaoCaoMuonSaches.FindAsync(id);
            if (baoCaoMuonSach == null)
            {
                return HttpNotFound();
            }
            return View(baoCaoMuonSach);
        }

        // GET: BaoCaoMuonSaches/Create
        public ActionResult Create()
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD");
            return View();
        }

        // POST: BaoCaoMuonSaches/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaBaoCaoMuonSach,MaCD,SoLuotMuon")] BaoCaoMuonSach baoCaoMuonSach)
        {
            if (ModelState.IsValid)
            {
                db.BaoCaoMuonSaches.Add(baoCaoMuonSach);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD", baoCaoMuonSach.MaCD);
            return View(baoCaoMuonSach);
        }

        // GET: BaoCaoMuonSaches/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaoCaoMuonSach baoCaoMuonSach = await db.BaoCaoMuonSaches.FindAsync(id);
            if (baoCaoMuonSach == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD", baoCaoMuonSach.MaCD);
            return View(baoCaoMuonSach);
        }

        // POST: BaoCaoMuonSaches/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaBaoCaoMuonSach,MaCD,SoLuotMuon")] BaoCaoMuonSach baoCaoMuonSach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(baoCaoMuonSach).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD", baoCaoMuonSach.MaCD);
            return View(baoCaoMuonSach);
        }

        // GET: BaoCaoMuonSaches/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            BaoCaoMuonSach baoCaoMuonSach = await db.BaoCaoMuonSaches.FindAsync(id);
            if (baoCaoMuonSach == null)
            {
                return HttpNotFound();
            }
            return View(baoCaoMuonSach);
        }

        // POST: BaoCaoMuonSaches/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            BaoCaoMuonSach baoCaoMuonSach = await db.BaoCaoMuonSaches.FindAsync(id);
            db.BaoCaoMuonSaches.Remove(baoCaoMuonSach);
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
