using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class MenuDao
    {
        CaoThiThuHienContext db = null;
        public MenuDao()
        {
            db = new CaoThiThuHienContext();
        }
        public List<Menu> ListByGroupID(int groupId)
        {
            return db.Menus.Where(x => x.TypeID == groupId && x.Status == true).OrderBy(x=>x.DisplayOrder).ToList();
        }
        public Menu Find(long id)
        {
            return db.Menus.Find(id);
        }
    }
}
