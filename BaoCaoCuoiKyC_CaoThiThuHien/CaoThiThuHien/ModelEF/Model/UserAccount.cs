namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserAccount")]
    public partial class UserAccount
    {
        public long ID { get; set; }


        [StringLength(50)]
        [Required(ErrorMessage = "Chưa nhập tên tài khoản")]
        public string UserName { get; set; }

        [StringLength(50)]
        [Required(ErrorMessage = "Chưa nhập mật khẩu")]
        public string Password { get; set; }

        [Required(ErrorMessage = "Chưa chọn quyền truy cập")]
        public long QuyenID { get; set; }

        public bool Status { get; set; }
    }
}
