using ModelEF.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class SlideDao
    {

        CaoThiThuHienContext db = null;
        public SlideDao()
        {
            db = new CaoThiThuHienContext();
        }
        public List<Slide> ListAll()
        {
            return db.Slides.Where(x=>x.Status == true).OrderBy(y=>y.DisplayOrder).ToList();
        }
    }
}
