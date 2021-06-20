var user = {
    init: function () {
        user.registerEvents();
    },
    registerEvents: function () {
        $('.btn-active').off('click').on('click', function (e) {
            e.preventDefault();
            var btn = $(this);
            var id = btn.data('id');
            $.ajax(
                {
                    url: "User/ChangeStatus",
                    data: { id: id },
                    datatype: "json",
                    type: "POST",
                    success: function (response) {
                        console.log(response);
                        if (response.status == true) {
                            btn.text('Kích Hoạt');
                            btn.removeClass('btn-danger');
                            btn.addClass('btn-success');
                        } else {
                            btn.text('Chặn');
                            btn.removeClass('btn-success');
                            btn.addClass('btn-danger');
                        }
                    }
                });
        });
    }
}
user.init();