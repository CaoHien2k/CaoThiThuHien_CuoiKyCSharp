using ModelEF.DAO;
using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Common;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class ProductController : BaseController
    {
        // GET: Admin/Product
        public ActionResult Index(int page = 1, int pagesize = 5)
        {
            var dao = new ProductDao();
            var model = dao.ListAll();
            return View(model.ToPagedList(page, pagesize));
        }
        [HttpPost]
        public ActionResult Index(string searchString, int page = 1, int pagesize = 5)
        {
            var menuType = new ProductDao();
            var model = menuType.ListWhereAll(searchString, page, pagesize);
            ViewBag.SearchString = searchString;
            return View(model.ToPagedList(page, pagesize));
        }
        [HttpPost]
        public JsonResult ChangeStatus(long id)
        {
            var result = new ProductDao().ChangeStatus(id);
            return Json(new { status = result });
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

            var dao = new ProductDao();
            var result = dao.Find(id);
            if (result != null)
            {
                SetViewBag(result.TypeID);
                return View(result);
            }
            SetViewBag();
            return View();
        }

        //tạo và cập nhật sản phẩm
        [HttpPost]
        public ActionResult Update(Product model, HttpPostedFileBase image)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    var dao = new ProductDao();
                    if (image == null)
                    {
                        SetAlert("Vui lòng chọn ảnh", "error");
                    }

                    string fileName = Path.GetFileName(image.FileName);
                    string urlImage = Server.MapPath("~/Image/" + fileName);
                    image.SaveAs(urlImage);
                    model.Image = fileName;


                    long result;
                    result = dao.Insert(model);

                    if (result != 0)
                    {
                        SetAlert("Cập nhật thành công", "success");
                        return RedirectToAction("Index", "Product");
                    }
                    else
                    {
                        SetAlert("Cập nhật thành công", "error");
                    }
                }
            }
            catch (Exception ex)
            {
                Common.Common.WriteLog("Category", "Create-Post", ex.ToString());
            }
            SetViewBag(model.TypeID);
            return View();
        }
       

        public void SetViewBag(long? selecteid = null)
        {
            var dao = new CategoryDao();
            ViewBag.CategoryTypeID = new SelectList(dao.ListAll(), "ID", "Name", selecteid);
        }

        [HttpDelete]
        public ActionResult Delete(long id)
        {
            try
            {
                var dao = new ProductDao().Delete(id);

            }
            catch (Exception ex)
            {
                Common.Common.WriteLog("Product", "Delete-Post", ex.ToString());
            }
            return RedirectToAction("Index");
        }
        //xem trang chi tiết
        public ActionResult DetailAdmin(long id)
        {
            var product = new ProductDao().Find(id);
            return View(product);
        }
    }
    
}
