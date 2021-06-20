using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PagedList;

namespace ModelEF.DAO
{
    public class QuyenTypeDao
    {
        private CaoThiThuHienContext db;

        public QuyenTypeDao()
        {
            db = new CaoThiThuHienContext();
        }

        public List<PhanQuyen> ListAll()
        {
            return db.PhanQuyens.ToList();
        }

        public IEnumerable<PhanQuyen> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<PhanQuyen> model = db.PhanQuyens;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.Name.Contains(keysearch));
            }
            return model.OrderBy(x => x.Name).ToPagedList(page, pagesize);
        }

        public PhanQuyen Find(long id)
        {
            return db.PhanQuyens.Find(id);
        }

        public long Insert(PhanQuyen entity)
        {
            var dao = Find(entity.ID);
            if (entity.ID == 0)
            {
                db.PhanQuyens.Add(entity);
            }
            else
            {
                dao.Name = entity.Name;
            }
            db.SaveChanges();
            return entity.ID;
        }

        public bool Delete(long id)
        {
            try
            {
                var dao = db.PhanQuyens.Find(id);
                db.PhanQuyens.Remove(dao);
                db.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }
        
    }
}
