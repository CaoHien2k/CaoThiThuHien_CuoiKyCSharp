using ModelEF.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace TestUngDung.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }
        //In danh mục sản phẩm
        public PartialViewResult Category()
        {
            var model = new CategoryDao().ListAll();
            return PartialView(model);
        }
        //hiển thị sp từng danh mục
        public ActionResult ProductCategory(long id)
        {
            var productcategory = new CategoryDao().ViewDetail(id);
            ViewBag.Category = productcategory;
            var model = new ProductDao().ListCategoryID(id);
            return View(model);
        }
        //hiển thị tất cả sản phẩm
        public ActionResult AllProduct()
        {
            var model = new ProductDao().ListAll();
            return View(model);
        }
        //chi tiết sản phẩm
        public ActionResult Detail(long id)
        {
            var product = new ProductDao().ViewDetail(id);
            ViewBag.Category = new CategoryDao().ViewDetail(product.ID);
            ViewBag.RelatedProducts = new ProductDao().ListRelatedProducts(id);
            return View(product);
        }
    }
}