using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Common;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class QuyenTypeController : BaseController
    {
        // GET: Admin/QuyenType
        public ActionResult Index(int page = 1, int pagesize = 10)
        {
            var user = new QuyenTypeDao();
            var model = user.ListAll();
            return View(model.ToPagedList(page, pagesize));
        }

        [HttpPost]
        public ActionResult Index(string searchString, int page = 1, int pagesize = 10)
        {
            var menuType = new QuyenTypeDao();
            var model = menuType.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model.ToPagedList(page, pagesize));
        }

        public ActionResult Update() { return View(); }

        [HttpGet]
        [RequiresRouteValues("id")]
        public ActionResult Update(long id)
        {

            var dao = new QuyenTypeDao();
            var result = dao.Find(id);
            if (result != null)
            {
                return View(result);
            }
            return View();
        }

        [HttpPost]
        public ActionResult Update(PhanQuyen model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    var dao = new QuyenTypeDao();
                    long result;

                    result = dao.Insert(model);

                    if (result != 0)
                    {
                        SetAlert("Cập nhật thông tin thành công", "success");
                        return RedirectToAction("Index", "QuyenType");
                    }
                    else
                    {
                        SetAlert("Cập nhật thông tin không thành công", "error");
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Common.WriteLog("QuyenType", "Create-Post", ex.ToString());
            }
            return View();
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {
            var dao = new QuyenTypeDao().Delete(id);
            return RedirectToAction("Index");
        }
    }
}
