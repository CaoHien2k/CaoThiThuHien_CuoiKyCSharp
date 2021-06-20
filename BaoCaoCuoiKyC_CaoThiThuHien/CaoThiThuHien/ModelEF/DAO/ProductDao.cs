using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class ProductDao
    {
        private CaoThiThuHienContext db;

        public ProductDao()
        {
            db = new CaoThiThuHienContext();
        }

        //public List<Product> ListByMenuType(int id)
        //{
        //    return db.Products.Where(x => x.Status == true && x.TypeID == id).OrderBy(x => x.Name).ToList();
        //}


       //hiển thị sản phẩm theo sl tăng dần và giá giảm dần
        public List<Product> ListAll()
        {
            return db.Products.OrderByDescending(s => s.UnitCost).ThenBy(s => s.Quantity).ToList();
        }
        public IEnumerable<Product> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<Product> model = db.Products;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.Name.Contains(keysearch));
            }
            return model.OrderBy(x => x.Name).ToPagedList(page, pagesize);
        }

        public bool ChangeStatus(long id)
        {
            var sanpham = db.Products.Find(id);
            sanpham.Status = !sanpham.Status;
            db.SaveChanges();
            return sanpham.Status;
        }

        public long Insert(Product entity)
        {
            var dao = Find(entity.ID);
            if (entity.ID == 0)
            {
                db.Products.Add(entity);
            }
            else
            {
                dao.Image = entity.Image;
                dao.Name = entity.Name;
                dao.UnitCost = entity.UnitCost;
                dao.Quantity = entity.Quantity;
                dao.Description = entity.Description;
                dao.Status = entity.Status;
                dao.TypeID = entity.TypeID;
            }
            db.SaveChanges();
            return entity.ID;
        }

        public Product Find(long id)
        {
            return db.Products.Find(id);
        }

        public bool Delete(long id)
        {
            try
            {
                var dao = db.Products.Find(id);
                db.Products.Remove(dao);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        //trang người dùng
        //sản phẩm mới
        public List<Product> LisOneProduct(int top)
        {
            return db.Products.OrderByDescending(x=>x.CreateDate).Take(top).ToList();
        }
        //sản phẩm hot
        public List<Product> LisTwoProduct(int top)
        {
            return db.Products.Where(x => x.TopHot!=null && x.TopHot>DateTime.Now).OrderByDescending(x => x.CreateDate).Take(top).ToList();
        }
        //sản phẩm liên quan
        public List<Product> ListRelatedProducts(long id)
        {
            var product = db.Products.Find(id);
            return db.Products.Where(x => x.ID != id && x.TypeID==product.TypeID).ToList();
        }
        public Product ViewDetail(long id)
        {
            return db.Products.Find(id);
        }
        //hiển thị sản phẩm từng danh mục
        public List<Product> ListCategoryID(long id)
        {
            return db.Products.Where(x => x.TypeID == id).ToList();
        }
    }
}

