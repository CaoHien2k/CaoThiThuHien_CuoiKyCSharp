namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public long ID { get; set; }


        [StringLength(150)]
        [Required(ErrorMessage = "Chưa nhập tên sản phẩm")]
        public string Name { get; set; }

        [Column(TypeName = "money")]
        [Required(ErrorMessage = "Chưa nhập giá tiền")]
        public decimal UnitCost { get; set; }

        [Required(ErrorMessage = "Chưa nhập số lượng")]
        public int Quantity { get; set; }

        [StringLength(100)]
        public string Image { get; set; }

        [StringLength(150)]

        public string Description { get; set; }

        public bool Status { get; set; }
        [Required(ErrorMessage = "Chưa chọn loại sản phẩm")]
        public long TypeID { get; set; }

        [StringLength(50)]
        public string MetaTitle { get; set; }

        [StringLength(50)]
        public string Size { get; set; }

        [StringLength(150)]
        public string ThuongHieu { get; set; }

        [StringLength(150)]
        public string Color { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(100)]
        public string CreateBy { get; set; }

        public DateTime? TopHot { get; set; }
    }
}
