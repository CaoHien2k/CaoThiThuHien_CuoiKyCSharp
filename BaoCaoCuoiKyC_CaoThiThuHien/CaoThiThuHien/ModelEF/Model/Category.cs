namespace ModelEF.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Category")]
    public partial class Category
    {
        public long ID { get; set; }

        [StringLength(100)]
        [Required(ErrorMessage = "Chưa nhập tên loại sản phẩm")]
        public string Name { get; set; }

        [StringLength(150)]
        [Required(ErrorMessage = "Chưa nhập mô tả")]
        public string Description { get; set; }

        [StringLength(50)]
        public string MetaTitle { get; set; }

        public int? DisplayOrder { get; set; }
    }
}
