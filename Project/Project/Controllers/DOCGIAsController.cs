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
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace Project.Controllers
{
    public class DOCGIAsController : Controller
    {
        private QLThuVienEntities1 db = new QLThuVienEntities1();

        // GET: DOCGIAs
        public async Task<ActionResult> Index(int ? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            var dg = db.DOCGIAs.Include(s => s.MaDG);
            return View(db.DOCGIAs.ToList().OrderBy(n => n.MaDG).ToPagedList(pageNumber, pageSize));
        }

        // GET: DOCGIAs/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DOCGIA dOCGIA = await db.DOCGIAs.FindAsync(id);
            if (dOCGIA == null)
            {
                return HttpNotFound();
            }
            return View(dOCGIA);
        }

        // GET: DOCGIAs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: DOCGIAs/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "MaDG,TenDG,DiaChi,DienThoai,Email,TenDN,MatKhau")] DOCGIA dOCGIA)
        {
            if (ModelState.IsValid)
            {
                db.DOCGIAs.Add(dOCGIA);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(dOCGIA);
        }

        // GET: DOCGIAs/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DOCGIA dOCGIA = await db.DOCGIAs.FindAsync(id);
            if (dOCGIA == null)
            {
                return HttpNotFound();
            }
            return View(dOCGIA);
        }

        // POST: DOCGIAs/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "MaDG,TenDG,DiaChi,DienThoai,Email,TenDN,MatKhau")] DOCGIA dOCGIA)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dOCGIA).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(dOCGIA);
        }

        // GET: DOCGIAs/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DOCGIA dOCGIA = await db.DOCGIAs.FindAsync(id);
            if (dOCGIA == null)
            {
                return HttpNotFound();
            }
            return View(dOCGIA);
        }

        // POST: DOCGIAs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            DOCGIA dOCGIA = await db.DOCGIAs.FindAsync(id);
            db.DOCGIAs.Remove(dOCGIA);
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
