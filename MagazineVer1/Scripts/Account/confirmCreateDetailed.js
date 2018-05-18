var sessionStorageData;
var totalPayPrice = 0;
var payDeleteList = [];
var freeDeleteList = [];
var confirmCreateDetailed = {};

function init() {
    if (undefined == sessionStorage["advertisingCreate"]) {
        window.location = '/Advertising/Create';
        return false;
    }

    sessionStorageData = JSON.parse(sessionStorage["advertisingCreate"]);
    if (undefined === sessionStorageData || '' === sessionStorageData) {
        window.location = '/Advertising/Create';
        return false;
    }

    if (undefined !== sessionStorage["confirmCreateDetailed"]) {
        confirmCreateDetailed = JSON.parse(sessionStorage["confirmCreateDetailed"]);
        if (undefined != confirmCreateDetailed.unifiedInvoice) {

            // 姓名
            if (undefined != confirmCreateDetailed.userName) {
                $('#userName').val(confirmCreateDetailed.userName);
            }

            // 電子信箱
            if (undefined != confirmCreateDetailed.email) {
                $('#email').val(confirmCreateDetailed.email);
            }

            // 手機號碼
            if (undefined != confirmCreateDetailed.phone) {
                $('#phone').val(confirmCreateDetailed.phone);
            }

            // 是否開立發票?
            if (undefined != confirmCreateDetailed.unifiedInvoice.isPublic) {
                $("input[type='radio'][name='isPublic']").each(function () {
                    if ($(this).attr('value') === confirmCreateDetailed.unifiedInvoice.isPublic) {
                        $(this).attr('checked', 'checked');
                        return false;
                    }
                });
            }

            // 發票聯式
            if (undefined != confirmCreateDetailed.unifiedInvoice.type) {
                $("input[type='radio'][name='unifiedInvoiceType']").each(function () {
                    if ($(this).attr('value') === confirmCreateDetailed.unifiedInvoice.type) {
                        $(this).attr('checked', 'checked');
                        return false;
                    }
                });
            }

            // 發票抬頭
            if (undefined != confirmCreateDetailed.unifiedInvoice.title) {
                $('#unifiedInvoiceTitle').val(confirmCreateDetailed.unifiedInvoice.title);
            }

            // 統一編號
            if (undefined != confirmCreateDetailed.unifiedInvoice.number) {
                $('#unifiedInvoiceNumber').val(confirmCreateDetailed.unifiedInvoice.number);
            }

            // 發票地址
            if (undefined != confirmCreateDetailed.unifiedInvoice.address) {
                $('#unifiedInvoiceAddress').val(confirmCreateDetailed.unifiedInvoice.address);
            }
        }
    }

    let today = new Date();
    let startTestDate = today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + today.getDate();
    let endTestDate = today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + (today.getDate() + 3);
    let startDate = today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + (today.getDate() + 4);
    //let endDate = today;

    let freeHtmlTbody = '';
    let freeCount = 0;

    let payHtmlTbody = '';
    let payCount = 0;
    let totalSmPay = 0;
    let totalBroadcastPay = 0;
    $.each(sessionStorageData, function (index, val) {
        let endDate = new Date();
        let sumPay = calculate(val.category.value, val.prices.discount);
        endDate.setDate((today.getDate() + 4) + parseInt(val.prices.value));
        let enddate = endDate.getFullYear() + "/" + (endDate.getMonth() + 1) + "/" + endDate.getDate();

        let broadcastPay = 0;
        if (0 < val.checkBroadcast.length) {
            $.each(val.checkBroadcast, function (index0, val0) {
                broadcastPay += val0.bdf_price;
            });
        }


        if (0 == sumPay && 0 == broadcastPay) {
            freeCount++;

            freeHtmlTbody += `<tr>
                                        <td><input type="checkbox" value= "`+ val.cid + `" class ="delTitle" /></td>
                                        <td><a href="/Advertising/Create?cid=`+ val.cid + `" > ` + val.title + ` </a> </td>
                                        <td> NT$ 0 </td>
                                        <td> NT$ 0 </td>
                                        <td> NT$ 0 </td>
                                        <td> `+ startTestDate + ` ~ ` + endTestDate + ` </td>
                                        <td> `+ startDate + ` ~ ` + enddate + ` </td>
                                    </tr>`;
        } else {
            totalPayPrice += (sumPay + broadcastPay);
            totalSmPay += sumPay;
            totalBroadcastPay += broadcastPay;
            payCount++;

            payHtmlTbody += `<tr>
                                        <td><input type="checkbox" value= "`+ val.cid + `" class ="delTitle" /></td>
                                        <td><a href="/Advertising/Create?cid=`+ val.cid + `" > ` + val.title + ` </a> </td>
                                        <td> NT$ `+ (sumPay + broadcastPay) + ` </td>
                                        <td> NT$ `+ sumPay + ` </td>
                                        <td> NT$ `+ broadcastPay + ` </td>
                                        <td> `+ startTestDate + ` ~ ` + endTestDate + ` </td>
                                        <td> `+ startDate + ` ~ ` + enddate + ` </td>
                                    </tr>`;
        }

    });

    freeHtmlTbody += `<tr>
                                <td>免費項目小計</td>
                                <td> `+ freeCount + ` 則</td>
                                <td>NT$ 0 </td>
                                <td>NT$ 0 </td>
                                <td>NT$ 0 </td>
                                <td></td>
                                <td></td>
                            </tr>`;
    $('#freeHtmlTbody').html(freeHtmlTbody);

    payHtmlTbody += `<tr>
                                <td>付費項目小計</td>
                                <td> `+ payCount + ` 則</td>
                                <td>NT$` + totalPayPrice + ` </td>
                                <td>NT$`+ totalSmPay + ` </td>
                                <td>NT$`+ totalBroadcastPay + ` </td>
                                <td></td>
                                <td></td>
                            </tr>`;
    $('#payHtmlTbody').html(payHtmlTbody);

    if (0 == totalPayPrice) {
        // 是否開立發票?
        $("input[type='radio'][name='isPublic']").each(function () {
            if ($(this).attr('value') == "n") {
                $(this).attr('checked', 'checked');
                return false;
            }
        });

        $('#unifiedInvoiceTitle').attr('disabled', 'disabled');
        $('#unifiedInvoiceNumber').attr('disabled', 'disabled');
        $('#unifiedInvoiceAddress').attr('disabled', 'disabled');
    }
}

init();

// 計算打折後
function calculate(originalPrice, discount) {
    return originalPrice * discount / 100;
}

$('#pay').on('click', '.delTitle', function () {
    let clickValue = this.value;
    if (true === this.checked) {
        payDeleteList.push(this.value);
    } else {
        if (0 < payDeleteList.length) {
            $.each(payDeleteList, function (index, val) {
                if (val == clickValue) {
                    payDeleteList.splice(index, 1);
                    return false;
                }
            });
        }
    }
});

$('#free').on('click', '.delTitle', function () {
    let clickValue = this.value;
    if (true === this.checked) {
        freeDeleteList.push(this.value);
    } else {
        if (0 < freeDeleteList.length) {
            $.each(freeDeleteList, function (index, val) {
                if (val == clickValue) {
                    freeDeleteList.splice(index, 1);
                    return false;
                }
            });
        }
    }
});

// 刪除按鈕
$('#butDelete').click(function () {
    $('#deleteCount').text(freeDeleteList.length + payDeleteList.length);
    $("#dialog-delete").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "是": function () {
                deleteRefresh();
                $(this).dialog("close");
            },
            "否": function () {
                $(this).dialog("close");
            }
        }
    });
});

function deleteRefresh() {
    if (0 < payDeleteList.length && 0 < sessionStorageData.length) {
        let delIndexList = [];
        while (0 < payDeleteList.length) {
            $.each(sessionStorageData, function (index, val) {
                let indexVal = payDeleteList.indexOf(val.cid);
                if (-1 < indexVal) {
                    payDeleteList.splice(indexVal, 1);
                    sessionStorageData.splice(index, 1);
                    return false;
                }
            });
        }
    }

    if (0 < freeDeleteList.length && 0 < sessionStorageData.length) {
        let delIndexList = [];
        while (0 < freeDeleteList.length) {
            $.each(sessionStorageData, function (index, val) {
                let indexVal = freeDeleteList.indexOf(val.cid);
                if (-1 < indexVal) {
                    freeDeleteList.splice(indexVal, 1);
                    sessionStorageData.splice(index, 1);
                    return false;
                }
            });
        }
    }
    sessionStorage["advertisingCreate"] = JSON.stringify(sessionStorageData);
    init();
}

// 取消
$('#cancel').click(function () {
    window.history.back();
});

// 確定
$('#confirm').click(function () {
    $('#requiredUserName').text('');
    $('#requiredEmail').text('');
    $('#requiredPhone').text('');
    $('#requiredUnifiedInvoiceAddress').text('');

    // 姓名
    let userName = $('#userName').val();
    if ('' == userName) {
        $('#requiredUserName').text('姓名欄位必填');
        return false;
    }

    // 電子信箱
    let email = $('#email').val();
    if ('' == email) {
        $('#requiredEmail').text('電子信箱欄位必填');
        return false;
    }

    // 手機號碼(或密碼)
    let phone = $('#phone').val();
    if ('' == phone) {
        $('#requiredPhone').text('手機號碼(或密碼)欄位必填');
        return false;
    }

    // 是否開立發票?
    let isUnifiedInvoicePublic = $('input[name=isPublic]:checked').val();
    if ("y" == isUnifiedInvoicePublic && '' == $('#unifiedInvoiceAddress').val()) {
        $('#requiredUnifiedInvoiceAddress').text('發票地址欄位必填');
    }

    // 發票聯式
    let unifiedInvoiceType = $('input[name=unifiedInvoiceType]:checked').val();

    // 發票抬頭
    let unifiedInvoiceTitle = $('#unifiedInvoiceTitle').val();

    // 統一編號
    let unifiedInvoiceNumber = $('#unifiedInvoiceNumber').val();

    // 發票地址
    let unifiedInvoiceAddress = $('#unifiedInvoiceAddress').val();

    confirmCreateDetailed.userName = userName;
    confirmCreateDetailed.email = email;
    confirmCreateDetailed.phone = phone;
    confirmCreateDetailed.accountExist = false;
    confirmCreateDetailed.unifiedInvoice = {};
    confirmCreateDetailed.unifiedInvoice.isPublic = isUnifiedInvoicePublic;
    confirmCreateDetailed.unifiedInvoice.type = unifiedInvoiceType;
    confirmCreateDetailed.unifiedInvoice.title = unifiedInvoiceTitle;
    confirmCreateDetailed.unifiedInvoice.number = unifiedInvoiceNumber;
    confirmCreateDetailed.unifiedInvoice.address = unifiedInvoiceAddress;
    confirmCreateDetailed.sessionStorageData = sessionStorageData;

    sessionStorage["confirmCreateDetailed"] = JSON.stringify(confirmCreateDetailed);

    let postData = {
        email: email,
        phone: phone
    }

    $("#dialog-accountConfirm").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true
    }).parents(".ui-dialog").find(".ui-dialog-titlebar").remove();

    // 驗證帳號密碼
    $.ajax({
        url: '/Account/ConfirmCreateDetailedAccountVerify',
        type: 'POST',
        data: JSON.stringify(postData),
        dataType: 'json',
        contentType: 'application/json',
        cache: false,
        success: function (data) {
            $("#dialog-accountConfirm").dialog("close");
            $("#dialog-saveing").dialog("close");
            if (true === data.exist && true === data.isError) {
                $("#dialog-accountError").dialog({
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
                return false;
            } else if (true === data.exist) {
                confirmCreateDetailed.accountExist = true;
            } else {
                confirmCreateDetailed.accountExist = false;
            }

            saveing(confirmCreateDetailed);
        },
        error: function (errorData) {
            console.log(errorData);
            $('#dialog-accountConfirm').dialog("close");
            $("#dialog-saveing").dialog("close");

            $("#dialog-serverError").dialog({
                resizable: false,
                height: "auto",
                width: 400,
                modal: true
            })
        }
    });
});

function saveing(data) {
    sessionStorage["confirmCreateDetailed"] = JSON.stringify(data);
    window.location = "/Account/RemittanceAccountInformation";
}