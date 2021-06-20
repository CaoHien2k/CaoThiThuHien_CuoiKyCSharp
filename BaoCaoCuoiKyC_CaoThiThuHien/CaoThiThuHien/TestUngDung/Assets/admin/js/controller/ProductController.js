var product = {
    init: function () {
        product.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax(
                {
                    url: "Product/ChangeStatus",
                    data: { id: id },
                    datatype: "json",
                    type: "POST",
                    success: function (response) {
                        console.log(response);
                        if (response.status == true) {
                            btn.text('Hiển thị');
                            btn.removeClass('btn-danger');
                            btn.addClass('btn-success');
                        } else {
                            btn.text('Ẩn');
                            btn.removeClass('btn-success');
                            btn.addClass('btn-danger');
                        }
                    }
                });
        });
    }
}
product.init();