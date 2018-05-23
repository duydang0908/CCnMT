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
    public class QLSachController : Controller
    {
        private QLThuVienEntities1 db = new QLThuVienEntities1();

        // GET: QLSach
        [Authorize]
        public async Task<ActionResult> Index(int ? page)
        {
            int pageNumber = (page ?? 1);
            int pageSize = 5;
            var SACH = db.SACHes.Include(s => s.CHUDE);
            return View(db.SACHes.ToList().OrderBy(n => n.Masach).ToPagedList(pageNumber, pageSize));
        }

        // GET: QLSach/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SACH sACH = await db.SACHes.FindAsync(id);
            if (sACH == null)
            {
                return HttpNotFound();
            }
            return View(sACH);
        }

        // GET: QLSach/Create
        public ActionResult Create()
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD");
            ViewBag.MaNXB = new SelectList(db.NXBs, "MaNXB", "TenNXB");
            return View();
        }

        // POST: QLSach/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create(/*[Bind(Include = "Masach,Tensach,Mota,Hinhminhhoa,MaCD,MaNXB,SoLuongCon,Ngaycapnhat")]*/ SACH sACH, HttpPostedFileBase fileUpload)
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD");
            ViewBag.MaNXB = new SelectList(db.NXBs, "MaNXB", "TenNXB");
            if (fileUpload == null)
            {
                ViewBag.Thongbao = "Vui lòng chọn ảnh bìa";
                return View();
            }
            {
                if (ModelState.IsValid)
                {
                    // Lưu tên file, lưu ý bổ sung thư viện using System.IO;
                    var fileName = Path.GetFileName(fileUpload.FileName);
                    // Lưu đường dẫn file
                    var path = Path.Combine(Server.MapPath("~/images"), fileName);
                    // Kiễm tra hình ảnh tồn tại
                    if (System.IO.File.Exists(path))
                    {
                        ViewBag.Thongbao = "Hình ảnh đã tồn tại";
                    }
                    else
                    {
                        //Lưu hình ảnh vào đường dẫn
                        fileUpload.SaveAs(path);
                    }
                    sACH.Hinhminhhoa = fileUpload.FileName;
                    // Lưu vào CSDL
                    db.SACHes.Add(sACH);
                    db.SaveChanges();
                }
            }
            return View();
            //return View(sACH);
        }

        // GET: QLSach/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SACH sACH = await db.SACHes.FindAsync(id);
            if (sACH == null)
            {
                return HttpNotFound();
            }
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD", sACH.MaCD);
            ViewBag.MaNXB = new SelectList(db.NXBs, "MaNXB", "TenNXB", sACH.MaNXB);
            return View(sACH);
        }

        // POST: QLSach/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Masach,Tensach,Mota,Hinhminhhoa,MaCD,MaNXB,SoLuongCon,Ngaycapnhat")] SACH sACH)
        {
            if (ModelState.IsValid)
            {
                db.Entry(sACH).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD", sACH.MaCD);
            ViewBag.MaNXB = new SelectList(db.NXBs, "MaNXB", "TenNXB", sACH.MaNXB);
            return View(sACH);
        }

        // GET: QLSach/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            SACH sACH = await db.SACHes.FindAsync(id);
            if (sACH == null)
            {
                return HttpNotFound();
            }
            return View(sACH);
        }

        // POST: QLSach/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            SACH sACH = await db.SACHes.FindAsync(id);
            db.SACHes.Remove(sACH);
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
