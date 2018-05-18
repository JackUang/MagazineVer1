var countyTownshipCityData = {};
var PushAdvertisingStatistics = [];
var isCheckData = [];
var cid = '';
var sessionStorageData;
var currentCreateStorageData;

function init() {
    cid = QueryString('cid');
    if ('' == cid) {
        window.location = '/Advertising/Create';
        return false;
    }

    if (undefined == sessionStorage["advertisingCreate"]) {
        window.location = '/Advertising/Create';
        return false;
    }

    sessionStorageData = JSON.parse(sessionStorage["advertisingCreate"]);
    if (undefined === sessionStorageData || '' === sessionStorageData) {
        window.location = '/Advertising/Create';
        return false;
    }
    $.each(sessionStorageData, function (index, val) {
        if (cid === val.cid) {
            currentCreateStorageData = val;

            if (undefined !== val.checkBroadcast && '' !== val.checkBroadcast && 0 < val.checkBroadcast.length) {
                isCheckData = val.checkBroadcast;
            }

            return false;
        }
    });

    $.get("/api/Advertising/CountyCity", function (data) {
        countyTownshipCityData = data;

        let options = '';
        $.each(data, function (key, val) {
            options += '<option value="' + key + '">' + key + '</option>';
        });
        $("#countyCity").append(options);
    });

    $.get("/api/Broadcast/BroadcastType", function (data) {
        let options = '<option value="all">所有播點</option>';
        $.each(data, function (key, val) {
            options += '<option value="' + val.bpt_id + '">' + val.bpt_broadcastPoint + '</option>';
        });
        $("#broadcastType").html(options);
    });

    $.get("/api/Broadcast/PushAdvertisingStatistics", function (data) {
        let body = '';
        let total = 0;

        if (undefined === data) {
            total = 0;
            body += '<tr>' +
                        '<td>&nbsp;</td>' +
                        '<td>&nbsp;</td>' +
                        '<td>&nbsp;</td>' +
                        '<td>&nbsp;</td>' +
                        '<td>&nbsp;</td>' +
                        '<td>&nbsp;</td>' +
                        '<td>&nbsp;</td>' +
                    '</tr>';
        } else if (undefined !== data && 0 < isCheckData.length) {
            PushAdvertisingStatistics = data;
            $.each(data, function (index, val) {
                total += 1;
                // 確認是否有勾選過的資料
                if (0 < isCheckData.length && true === isCheckedData(val)) {
                    body += '<tr>' +
                        '<td><input type="checkbox" name="vehicle" value="Bike" data-id="' + val.rowNumber + '" checked></td>' +
                        '<td>' + val.bpt_broadcastPoint + '</td>' +
                        '<td>' + val.bdf_name + '</td>' +
                        '<td>' + val.d_name + '</td>' +
                        '<td>' + val.d_location3 + '</td>' +
                        '<td>' + val.d_location4 + '</td>' +
                        '<td>' + val.bdf_price + '</td>' +
                    '</tr>';
                } else {
                    body += '<tr>' +
                        '<td><input type="checkbox" name="vehicle" value="Bike" data-id="' + val.rowNumber + '"></td>' +
                        '<td>' + val.bpt_broadcastPoint + '</td>' +
                        '<td>' + val.bdf_name + '</td>' +
                        '<td>' + val.d_name + '</td>' +
                        '<td>' + val.d_location3 + '</td>' +
                        '<td>' + val.d_location4 + '</td>' +
                        '<td>' + val.bdf_price + '</td>' +
                    '</tr>';
                }
            });
        } else if (undefined !== data) {
            PushAdvertisingStatistics = data;
            $.each(data, function (index, val) {
                total += 1;
                body += '<tr>' +
                            '<td><input type="checkbox" name="vehicle" value="Bike" data-id="' + val.rowNumber + '"></td>' +
                            '<td>' + val.bpt_broadcastPoint + '</td>' +
                            '<td>' + val.bdf_name + '</td>' +
                            '<td>' + val.d_name + '</td>' +
                            '<td>' + val.d_location3 + '</td>' +
                            '<td>' + val.d_location4 + '</td>' +
                            '<td>' + val.bdf_price + '</td>' +
                        '</tr>';
            });
        }
        $("#pushAdvertisingStatistics").html(body);
        $('#total').text(total);

        // 統計共加值播點
        BonusStatistics();
        // 統計播點價格總計
        TotalPrice();
    });
}
init();

// 偵測縣市點選切換鄉鎮市區
$("#countyCity").on('change', function () {
    var options = '<option value="">=== 請選擇 ===</option>';
    var countyCity = this.value;

    if (undefined === countyTownshipCityData) {
        return;
    }

    if ('' === countyCity) {
        $("#townshipCity").html(options);
        return;
    }

    $.each(countyTownshipCityData, function (key) {
        if (key === countyCity) {
            $.each(countyTownshipCityData[key], function (key, val) {
                options += '<option value="' + val + '">' + val + '</option>';
            });
            $("#townshipCity").html(options);
            return;
        }
    });
});

// 依使用者條件搜尋推播廣告
function search() {
    let county = $("#countyCity option:selected").val();
    let township = $("#townshipCity option:selected").val();
    let broadcastPointType = $("#broadcastType option:selected").val();
    let keywords = $("#keywords").val();
    let dataType = 'false';
    let body = '';
    let total = 0;
    PushAdvertisingStatistics = [];

    $("#searchError").html('');
    if ('' !== county && (undefined === township || '' === township)) {
        $("#searchError").html('請選擇鄉鎮市區');
        township = '';
        return;
    }

    if ('' === county) {
        dataType = 'true';
    }

    body += '<tr>' +
                '<td>&nbsp;</td>' +
                '<td>&nbsp;</td>' +
                '<td>&nbsp;</td>' +
                '<td><img src="./../Content/ajax-loader.gif" /></td>' +
                '<td>&nbsp;</td>' +
                '<td>&nbsp;</td>' +
                '<td>&nbsp;</td>' +
            '</tr>';
    $("#pushAdvertisingStatistics").html(body);

    var formData = {
        getDataType: dataType,
        county: county,
        township: township,
        broadcastPointType: broadcastPointType,
        keywords: keywords
    };

    $.ajax({
        url: "/api/Broadcast/SearchBroadcastResult",
        type: "POST",
        data: formData,
        success: function (data, textStatus, jqXHR) {
            body = '';
            if (undefined === data) {
                total = 0;
                body += '<tr>' +
                            '<td>&nbsp;</td>' +
                            '<td>&nbsp;</td>' +
                            '<td>&nbsp;</td>' +
                            '<td>&nbsp;</td>' +
                            '<td>&nbsp;</td>' +
                            '<td>&nbsp;</td>' +
                            '<td>&nbsp;</td>' +
                        '</tr>';
            }
            if (undefined !== data) {
                PushAdvertisingStatistics = data;
                $.each(data, function (index, val) {
                    total += 1;
                    // 確認是否有勾選過的資料
                    if (0 < isCheckData.length && true === isCheckedData(val)) {
                        body += '<tr>' +
                            '<td><input type="checkbox" name="vehicle" value="Bike" data-id="' + val.rowNumber + '" checked></td>' +
                            '<td>' + val.bpt_broadcastPoint + '</td>' +
                            '<td>' + val.bdf_name + '</td>' +
                            '<td>' + val.d_name + '</td>' +
                            '<td>' + val.d_location3 + '</td>' +
                            '<td>' + val.d_location4 + '</td>' +
                            '<td>' + val.bdf_price + '</td>' +
                        '</tr>';
                    } else {
                        body += '<tr>' +
                            '<td><input type="checkbox" name="vehicle" value="Bike" data-id="' + val.rowNumber + '"></td>' +
                            '<td>' + val.bpt_broadcastPoint + '</td>' +
                            '<td>' + val.bdf_name + '</td>' +
                            '<td>' + val.d_name + '</td>' +
                            '<td>' + val.d_location3 + '</td>' +
                            '<td>' + val.d_location4 + '</td>' +
                            '<td>' + val.bdf_price + '</td>' +
                        '</tr>';
                    }
                });
            }
            $("#pushAdvertisingStatistics").html(body);
            $('#total').text(total);
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
}

$('#pushAdvertisingStatistics').on('click', '[name="vehicle"]', function () {
    var dataId = $(this).attr("data-id");
    if (this.checked === true) {
        if (0 < PushAdvertisingStatistics.length) {
            $.each(PushAdvertisingStatistics, function (index, val) {
                if (dataId == val.rowNumber) {
                    isCheckData.push(val);
                    return false;
                }
            });
        }
    } else {
        if (0 < isCheckData.length) {
            $.each(isCheckData, function (index, val) {
                if (dataId == val.rowNumber) {
                    isCheckData.splice(index, 1);
                    return false;
                }
            });
        }
    }
    BonusStatistics();
    TotalPrice();
});

// 統計共加值播點
function BonusStatistics() {
    if (0 <= isCheckData.length) {
        $('#bonusTotal').text(isCheckData.length);
    } else {
        $('#bonusTotal').text('0');
    }
}

// 統計播點價格總計
function TotalPrice() {
    let sum = 0;
    if (0 <= isCheckData.length) {
        $.each(isCheckData, function (index, val) {
            sum += val.bdf_price;
        });
    }
    $('#totalPrice').text(sum);
}

// 確認是否有勾選過的資料
function isCheckedData(data) {
    let result = false;

    if (0 >= isCheckData.length) {
        return false;
    }

    $.each(isCheckData, function (index, val) {
        if ((data.bdf_name == val.bdf_name) && (data.bdf_price == val.bdf_price) &&
           (data.bpt_broadcastPoint == val.bpt_broadcastPoint) && (data.d_location3 == val.d_location3) &&
           (data.d_location4 == val.d_location4) && (data.d_name == val.d_name)) {
            result = true;
            return false;
        }
    });
    return result;
}

// 確定
$('#confirm').click(function () {
    currentCreateStorageData.checkBroadcast = isCheckData;
    $.each(sessionStorageData, function (index, val) {
        if (cid === val.cid) {
            sessionStorageData.splice(index, 1);
            return false;
        }
    });
    sessionStorageData.push(currentCreateStorageData);
    saveToStorage(sessionStorageData);
    window.location = '/Advertising/ConfirmCreate' + '?cid=' + cid;
});

// 取消
$('#cancel').click(function () {
    window.location = '/Advertising/Create' + '?cid=' + cid;
});

function saveToStorage(data) {
    sessionStorage["advertisingCreate"] = JSON.stringify(sessionStorageData);
}
