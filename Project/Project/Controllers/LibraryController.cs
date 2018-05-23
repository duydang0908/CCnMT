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

namespace Project.Controllers
{
    public class LibraryController : Controller
    {
        QLThuVienEntities1 data = new QLThuVienEntities1();

        private QLThuVienEntities1 db = new QLThuVienEntities1();

        // GET: Library
        public async Task<ActionResult> Index(int ?page)
        {
            //var sACHes = db.SACHes.Include(s => s.CHUDE).Include(s => s.LoaiSach).Include(s => s.NXB);
            //return View(await sACHes.ToListAsync());
            int pageSize = 5;
            int pageNum = (page ?? 1);
            var sachmoi = Laysachmoi(15);
            return View(sachmoi.ToPagedList(pageNum, pageSize));
        }

        // GET: Library/Details/5
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

        // GET: Library/Create
        public ActionResult Create()
        {
            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD");
            
            ViewBag.MaNXB = new SelectList(db.NXBs, "MaNXB", "TenNXB");
            return View();
        }

        // POST: Library/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Masach,Tensach,MaLoaiSach,Mota,Hinhminhhoa,MaCD,MaNXB,Ngaycapnhat")] SACH sACH)
        {
            if (ModelState.IsValid)
            {
                db.SACHes.Add(sACH);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            ViewBag.MaCD = new SelectList(db.CHUDEs, "MaCD", "TenCD", sACH.MaCD);
            
            return View(sACH);
        }

        // GET: Library/Edit/5
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

        // POST: Library/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Masach,Tensach,MaLoaiSach,Mota,Hinhminhhoa,MaCD,MaNXB,Ngaycapnhat")] SACH sACH)
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

        // GET: Library/Delete/5
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

        // POST: Library/Delete/5
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

        private List<SACH> Laysachmoi(int count)
        {
            return data.SACHes.OrderByDescending(a => a.Ngaycapnhat).Take(count).ToList();
        }

        public ActionResult Chude()
        {
            var chude = from cd in data.CHUDEs select cd;
            return PartialView(chude);
        }

        public ActionResult Nxb()
        {
            var nxb = from c in data.NXBs select c;
            return PartialView(nxb);
        }

        public ActionResult sachTheochude(int id)
        {
            var sach = from s in data.SACHes where s.MaCD == id select s;
            return View(sach);
        }
        public ActionResult sachTheoNXB(int id)
        {
            var sach = from s in data.NXBs where s.MaNXB == id select s;
            return View(sach);
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(FormCollection collection)
        {
            var tendn = collection["username"];
            var mk = collection["pass"];
            if (String.IsNullOrEmpty(tendn) || String.IsNullOrEmpty(mk))
                ViewData["Loi2"] = "Phải điền đầy đủ thông tin";
            else
            {
                DOCGIA dg = data.DOCGIAs.SingleOrDefault(n => n.TenDN == tendn && n.MatKhau == mk);
                {
                    if (dg != null)
                    {
                        ViewBag.Thongbao = "Đăng nhập thành công";
                        Session["Taikhoan"] = dg.TenDG;
                        return RedirectToAction("Index", "Library");
                    }
                    else
                        ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng";
                }
            }
            return View();
        }
        
        public ActionResult Logout()
        {
            Session.Clear();
            return RedirectToAction("Index", "Library");
        }

    }
}
