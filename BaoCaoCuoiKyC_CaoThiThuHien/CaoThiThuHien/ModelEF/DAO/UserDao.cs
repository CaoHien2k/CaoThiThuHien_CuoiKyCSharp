using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using PagedList;
namespace ModelEF.DAO
{
    public class UserDao
    {
        private CaoThiThuHienContext db;

        public UserDao()
        {
            db = new CaoThiThuHienContext();
        }
        public int login(string user, string pass, long status)
        {
            var result = db.UserAccounts.SingleOrDefault(x => x.UserName.Contains(user) && x.Password.Contains(pass) && x.Status == true);
            if (result == null)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        //public List<UserAccount> ListByMenuType(int id)
        //{
        //    return db.UserAccounts.Where(x => x.Status == true && x.QuyenID == id).OrderBy(x => x.UserName).ToList();
        //}

        //lấy ds user
        public List<UserAccount> ListAll()
        {
            return db.UserAccounts.ToList();
        }
        //tìm kiếm tài khoản user
        public IEnumerable<UserAccount> ListWhereAll(string keysearch, int page, int pagesize)
        {
            IQueryable<UserAccount> model = db.UserAccounts;
            if (!string.IsNullOrEmpty(keysearch))
            {
                model = model.Where(x => x.UserName.Contains(keysearch));
            }
            return model.OrderBy(x => x.UserName).ToPagedList(page, pagesize);
        }

        public bool ChangeStatus(long id)
        {
            var sanpham = db.UserAccounts.Find(id);
            sanpham.Status = !sanpham.Status;
            db.SaveChanges();
            return sanpham.Status;
        }

        public long Insert(UserAccount entity)
        {
            var dao = Find(entity.ID);
            if (entity.ID == 0)
            {
                db.UserAccounts.Add(entity);
            }
            else
            {
                dao.UserName = entity.UserName;
                dao.Password = entity.Password;
                dao.QuyenID = entity.QuyenID;
                dao.Status = entity.Status;
            }
            db.SaveChanges();
            return entity.ID;
        }

        public UserAccount Find(long id)
        {
            return db.UserAccounts.Find(id);
        }

        public bool Delete(long id)
        {
            try
            {
                var dao = db.UserAccounts.Find(id);
                db.UserAccounts.Remove(dao);
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
