using ModelEF.Model;
using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class CategoryDao
    {
        private CaoThiThuHienContext db;

        public CategoryDao()
        {
            db = new CaoThiThuHienContext();
        }

        public List<Category> ListAll()
        {
            return db.Categories.ToList();
        }

        public IEnumerable<Category> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<Category> model = db.Categories;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.Name.Contains(keysearch));
            }
            return model.OrderBy(x => x.Name).ToPagedList(page, pagesize);
        }

        public Category Find(long id)
        {
            return db.Categories.Find(id);
        }

        public long Insert(Category entity)
        {
            var dao = Find(entity.ID);
            if (entity.ID == 0)
            {
                db.Categories.Add(entity);
            }
            else
            {
                dao.Description = entity.Description;
                dao.Name = entity.Name;
            }
            db.SaveChanges();
            return entity.ID;
        }

        public bool Delete(long id)
        {
            try
            {
                var dao = db.Categories.Find(id);
                db.Categories.Remove(dao);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        //trang người dùng
        
        public Category ViewDetail(long id)
        {
            return db.Categories.Find(id);
        }

    }
}

