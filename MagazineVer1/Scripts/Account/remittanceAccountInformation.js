var sessionStorageData;
var confirmCreateDetailed = {};

function init() {
    if (undefined == sessionStorage["advertisingCreate"] || undefined == sessionStorage["confirmCreateDetailed"]) {
        window.location = '/Advertising/Create';
        return false;
    }

    sessionStorageData = JSON.parse(sessionStorage["advertisingCreate"]);
    if (undefined === sessionStorageData || '' === sessionStorageData) {
        window.location = '/Advertising/Create';
        return false;
    }

    confirmCreateDetailed = JSON.parse(sessionStorage["confirmCreateDetailed"]);
    if (undefined === confirmCreateDetailed || {} === confirmCreateDetailed) {
        window.location = '/Advertising/Create';
        return false;
    }

    let postData = [];
    if (0 < sessionStorageData.length) {
        $.each(sessionStorageData, function (index, val) {
            let data = {};
            data.category = val.category;
            data.prices = val.prices;
            data.checkBroadcast = val.checkBroadcast;

            postData.push(data);
        });
    }

    $.ajax({
        url: '/api/Advertising/CalculateAmountRemittance',
        type: 'POST',
        data: JSON.stringify(postData),
        dataType: 'json',
        contentType: 'application/json',
        cache: false,
        success: function (data) {
            if (undefined == confirmCreateDetailed.orderNumber || '' == confirmCreateDetailed.orderNumber || null == confirmCreateDetailed.orderNumber) {
                $('#orderNumber').text(data.orderNumber);
                confirmCreateDetailed.orderNumber = data.orderNumber;
                sessionStorage["confirmCreateDetailed"] = JSON.stringify(confirmCreateDetailed);
            } else {
                $('#orderNumber').text(confirmCreateDetailed.orderNumber);
            }
            $('#totalPrice').text(data.price);
        },
        error: function (errorData) {
            console.log(errorData);
        }
    });
}
init();

// 取消
$("#cancel").on("click", function () {
    window.history.back();
});

// 確定
$("#confirm").on("click", function () {

    $("#dialog-saveing").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true
    }).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();

    $.ajax({
        url: '/Account/ConfirmCreateDetailedSave',
        type: 'POST',
        data: JSON.stringify(confirmCreateDetailed),
        dataType: 'json',
        contentType: 'application/json',
        cache: false,
        success: function (data) {
            $("#dialog-saveing").dialog("close");
            if (true == data.saveResult) {
                sessionStorage.clear();
                $("#dialog-saveedSuccess").dialog({
                    resizable: false,
                    height: "auto",
                    width: 400,
                    modal: true,
                    buttons: {
                        "確定": function () {
                            $(this).dialog("close");
                            window.location = "/Advertising/PublishedInquire";
                        }
                    }
                });
            }
            else {
                dataSaveError();
            }
        },
        error: function (errorData) {
            console.log(errorData);
            $("#dialog-saveing").dialog("close");
            dataSaveError();
        }
    });
});

function dataSaveError() {
    $("#dialog-saveedError").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "確定": function () {
                $(this).dialog("close");
            }
        }
    });
}