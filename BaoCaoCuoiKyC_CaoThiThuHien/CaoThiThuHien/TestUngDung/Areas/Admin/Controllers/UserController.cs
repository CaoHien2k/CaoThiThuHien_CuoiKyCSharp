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
    public class UserController : BaseController
    {
        // GET: Admin/User
        public ActionResult Index(int page = 1, int pagesize = 5)
        {
            var dao = new UserDao();
            var model = dao.ListAll();
            return View(model.ToPagedList(page, pagesize));
        }
        [HttpPost]
        public ActionResult Index(string searchString, int page = 1, int pagesize = 5)
        {
            var menuType = new UserDao();
            var model = menuType.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model.ToPagedList(page, pagesize));
        }
       

        public ActionResult Update()
        {
            SetViewBag();
            return View();
        }

        [HttpGet]
        [RequiresRouteValues("id")]
        public ActionResult Update(long id)
        {
            
            var dao = new UserDao();
            var result = dao.Find(id);
            if (result != null)
            {
                SetViewBag(result.QuyenID);
                return View(result);
            }
            SetViewBag();
            return View();
        }


        [HttpPost]
        public ActionResult Update(UserAccount model)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    if (string.IsNullOrEmpty(model.Password))
                    {
                        SetAlert("Không được để mật khẩu trống", "warning");
                    }
                    var dao = new UserDao();
                    var pass = Encryptor.EncryptMD5(model.Password);
                    model.Password = pass;
                    long result;
                    result = dao.Insert(model);
                    if (result != 0)
                    {
                        SetAlert("Cập nhật người dùng thành công", "success");
                        return RedirectToAction("Index", "User");
                    }
                    else
                    {
                        SetAlert("Cập nhật người dùng không thành công", "error");
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Common.WriteLog("PhanQuyen", "Create-Post", ex.ToString());
            }
            SetViewBag(model.QuyenID);
            return View();
        }

        

        [HttpDelete]
        public ActionResult Delete(long id)
        {
            try
            {
                var dao = new UserDao().Delete(id);

            }
            catch (Exception ex)
            {
                Common.Common.WriteLog("User", "Delete-Post", ex.ToString());
            }
            return RedirectToAction("Index");
        }

        public void SetViewBag(long? selecteid = null)
        {
            var dao = new QuyenTypeDao();
            ViewBag.QuyenTypeID = new SelectList(dao.ListAll(), "ID", "Name", selecteid);
        }

        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new UserDao().ChangeStatus(id);
            return Json(new { status = result });
        }
    }
}
