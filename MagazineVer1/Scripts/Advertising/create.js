var discounting = 100;
var priceing = 0;
var countyTownshipCityData;
var storageData;
var sessionStorageData = [];
var cid = QueryString('cid');

// 新增播點資料暫存
var checkBroadcast = [];

function init() {
    if (undefined !== sessionStorage["advertisingCreate"]) {
        sessionStorageData = JSON.parse(sessionStorage["advertisingCreate"]);
        $('#createCount').text(sessionStorageData.length);
    }
    if ('' !== cid) {
        getInitData(getToStorage);
    } else {
        getInitData();
    }
}

function getInitData(cb) {
    $.get("/api/Advertising/CreateAdvertisingInitData", function (data) {
        if (data.categorys) {
            var options = '';
            $.each(data.categorys, function (key, val) {
                options += '<option data-id="' + val.id + '" data-pic="' + val.pic + '" value="' + val.price + '">' + val.name + '</option>';
            });
            $("#infoGroupp").append(options);
        }
        if (data.infoPrices) {
            var options = '';
            $.each(data.infoPrices, function (key, val) {
                options += '<option data-id="' + val.id + '" data-discount="' + val.discount + '" value="' + val.days + '">' + val.name + '</option>';
            });
            $("#infoPrices").append(options);
        }
        if (data.countyTownshipCitys) {
            var options = '';

            countyTownshipCityData = data.countyTownshipCitys;
            $.each(data.countyTownshipCitys, function (key, val) {
                options += '<option value="' + key + '">' + key + '</option>';
            });
            $("#countyCity").append(options);
        }

        if ('function' === typeof cb) {
            setTimeout(cb(), 500);
        }
    });

    // 到期日
    var today = new Date();
    $("#expiredDay").text(today.getFullYear() + "/" + (today.getMonth() + 1) + "/" + (today.getDate() + 3));
}

init();

// 取得類別
$("#infoGroupp").on('change', function () {
    let price = this.value;
    price = price === "" ? 0 : price;
    $("#infoGrouppPrice").text(price);

    priceing = price;
    calculate(priceing, discounting);
});

// 取得刊登期
$("#infoPrices").on('change', function () {
    var day = this.value === '' ? 0 : this.value;
    $("#infoPriceDay").text(day);

    var discount = $(this).find(':selected').data('discount');
    discount = discount === undefined ? 0 : discount;
    $("#infoPriceDiscount").text(discount);

    discounting = discount;
    calculate(priceing, discounting);
});

// 計算打折後
function calculate(originalPrice, discount) {
    var discounted = originalPrice * discount / 100;
    $("#discountedPrice").text(discounted);
}

// 偵測縣市點選切換鄉鎮市區
$("#countyCity").on('change', function () {
    let options = '<option value="">=== 請選擇 ===</option>';
    let countyCity = this.value;

    if (undefined === countyTownshipCityData) {
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

// 圖片暫存區清單資料
var fileLisets = [];

//允許的圖片副檔名
var re = /\.(jpg|png|jpeg|gif|bmp)$/i;

// 複製一份 input type="file" 元件
var uploader = $("#uploader").clone();

// 上傳圖片
$("#uploaderLabel").on("change", "#uploader", function () {

    // 圖片最大檔案大小
    var imageFileMaxSize = 2 * 1024 * 1024;

    // 圖片最大上傳數量
    var imageFileMaxCount = 5;

    $("#errorMsg").text("");

    // 暫存區圖片超過五張
    if (fileLisets.length >= imageFileMaxCount) {
        $("#errorMsg").text("圖片最大上傳數量五張");
        clearInputFileData();
        return;
    }

    var imgCount = (imageFileMaxCount - fileLisets.length) >= 0 ? (imageFileMaxCount - fileLisets.length) : 0;
    imgCount = (imgCount - this.files.length) <= 0 ? imgCount : this.files.length;

    if (this.files.length > imgCount) {
        $("#errorMsg").text("圖片最大上傳數量五張");
    }
    var fd = new FormData();
    for (i = 0; i < imgCount; i++) {
        if (true && !re.test(this.files[i].name)) {
            continue;
        }

        if (imageFileMaxSize < this.files[i].size) {
            $("#errorMsg").text("檔案大小不可超過 2 MB");
            continue;
        }

        fd.append("file" + i, this.files[i]);
    }

    // 上傳圖片暫存到 Server
    $("#refresh").text('上傳圖片...');
    $.ajax({
        url: '/api/Advertising/UploadImage',
        data: fd,
        type: 'post',
        contentType: false,
        processData: false
    })
    .done(function (msg) {
        $.each(msg, function (index, val) {
            var imgId = index.split(".")[0] || index;
            $("#previewImg").append('<div class="col-sm-2"><div><img data-id="' + imgId + '" data-name="' + index + '" src="' + val + '" style="max-width: 150px; max-height: 150px;" class="image" /></div><div><button class="delete" id=' + imgId + '>刪除</button></div></div>');
            var item = {
                id: imgId,
                fileName: index,
                path: val
            };
            fileLisets.push(item);
        });
    })
    .fail(function (err) {
        console.log(err);
        $("#errorMsg").text("上傳圖片失敗");
    })
    .always(function () {
        clearInputFileData();
        $("#refresh").text('');
    });

    if (this.files.length > imageFileMaxCount) {
        $("#errorMsg").text("圖片最大上傳數量五張");
    }
});

// 從新產生 input type="file" 元件
function clearInputFileData() {
    $("#uploader").remove();
    $("#uploaderLabel").append(uploader);
}

// 刪除圖片
$("#previewImg").on("click", ".delete", function () {
    $("#errorMsg").text("");

    // 取圖刪除按鈕 Id 值
    var butId = $(this).attr('id');
    var imageFileName = "";

    // 刪除圖片暫存區清單資料
    if (0 < fileLisets.length) {
        $.each(fileLisets, function (index, val) {
            if (val.id === butId) {
                fileLisets.splice(index, 1);
                imageFileName = val.fileName
                return false;
            }
        });
    }

    // 刪除圖片顯示
    $(this).parent().parent('.col-sm-2').remove();

    if(imageFileName === ""){
        return;
    }

    // 刪除暫存在伺服器裡的圖片
    $.ajax({
        url: '/api/Advertising/UploadImage?fileName=' + imageFileName,
        type: 'DELETE'
    })
    .done(function (msg) {
        console.log(msg);
    })
    .fail(function (err) {
        console.log(err);
    });
});

// 確定
$("#confirm").on("click", function () {
    if (false === confirm()) {
        //cid = '';
        return;
    }
    $("#dialog-confirm").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "是": function () {
                //window.location = '@Url.Action("BonusBroadcast")' + '?cid=' + cid;
                window.location = '/Advertising/BonusBroadcast?cid=' + cid;
            },
            "否": function () {
                $(this).dialog("close");
                ContinueToPublished();
            }
        }
    });
    $(".ui-dialog-titlebar").hide();
});

// 判斷是否繼續刊登
function ContinueToPublished() {
    $("#dialog-published").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "繼續刊登": function () {
                //window.location = '@Url.Action("Create")';
                // 判斷刊登廣告數量是否達到上限值
                if (50 <= sessionStorageData.length) {
                    $(this).dialog("close");
                    $("#dialog-limit").dialog({
                        resizable: false,
                        height: "auto",
                        width: 400,
                        modal: true,
                        buttons: {
                            "確定": function () {
                                $(this).dialog("close");
                                window.location = "/Account/ConfirmCreateDetailed";
                            }
                        }
                    });
                } else {
                    window.location = '/Advertising/Create';
                }
            },
            "我要結帳": function () {
                //$(this).dialog("close");
                window.location = '/Account/ConfirmCreateDetailed';
            }
        }
    });
    $(".ui-dialog-titlebar").hide();
}

// 取消
$("#cancel").on("click", function () {
    window.history.back();
});

function confirm() {
    $('#cityErrorMsg').text('');
    $('#inputErrorMsg').text('');

    if ('' == cid || undefined == cid || '' == QueryString('cid')) {
        cid = (new Date()).valueOf() + stringGen(6);
    } else {
        sessionStorageData = JSON.parse(sessionStorage["advertisingCreate"]);
        $.each(sessionStorageData, function (index, val) {
            if (cid === val.cid) {
                sessionStorageData.splice(index, 1);
                return false;
            }
        });
    }

    // 類別
    categoryText = $("#infoGroupp option:selected").text();
    categoryValue = $("#infoGroupp option:selected").val();
    categoryId = $("#infoGroupp option:selected").attr("data-id");

    // 刊登期
    pricesText = $("#infoPrices option:selected").text();
    pricesValue = $("#infoPrices option:selected").val();
    pricesId = $("#infoPrices option:selected").attr("data-id");
    pricesDiscount = $("#infoPrices option:selected").attr("data-discount");

    // 是否公開您的廣告
    var isPublic = $('input[name=isPublic]:checked').val();

    // 縣市
    countyCity = $("#countyCity option:selected").val();
    if ('' == countyCity) {
        $('#inputErrorMsg').text('請選擇縣市');
        return false;
    }

    // 鄉鎮市區
    townshipCity = $("#townshipCity option:selected").val();
    if ('' == townshipCity) {
        $('#inputErrorMsg').text('請選擇鄉鎮市區');
        return false;
    }

    // 標題
    title = $('#title').val();
    if ('' == title) {
        $('#inputErrorMsg').text('請輸入廣告標題');
        return false;
    }

    // 內容
    contents = $('#contents').val();
    if ('' == contents) {
        $('#inputErrorMsg').text('請輸入廣告內容');
    }

    // 圖片暫存區清單資料
    fileLisets

    // URL
    url = $('#url').val();

    // LINE
    line = $('#lineUrl').val();

    let data = {
        cid:cid,
        category: {
            id: categoryId,
            text: categoryText,
            value: categoryValue
        },
        prices: {
            id: pricesId,
            text: pricesText,
            value: pricesValue,
            discount: pricesDiscount
        },
        isPublic : isPublic,
        countyCity: countyCity,
        townshipCity: townshipCity,
        title: title,
        contents: contents,
        fileLisets: fileLisets,
        url: url,
        line: line,
        checkBroadcast: checkBroadcast
    }

    saveToStorage(data);
    //window.location = '@Url.Action("BonusBroadcast")' + '?cid=' + cid;
    return true;
};

// 顯示使用者之前儲存的圖片
$('#userImage').click(function () {
    $("#dialog-images").dialog({
        resizable: false,
        height: "auto",
        width: 400,
        modal: true,
        buttons: {
            "確定": function () {
                $(this).dialog("close");
            },
            "取消": function () {
                $(this).dialog("close");
            }
        }
    });
});

$('#dialog-images').on('click', "input[type='checkbox'][name='infosImage']", function () {
    $("#errorMsg").text("");

    let fileName = $(this).val().substring($(this).val().lastIndexOf("/") + 1);
    let imgId = fileName.substring(0, fileName.lastIndexOf("."));
    let path = $(this).val();

    if (this.checked === true)
    {
        if (5 <= fileLisets.length) {
            $("#errorMsg").text("圖片最大上傳數量五張");
        } else {
            var item = {
                id: imgId,
                fileName: fileName,
                path: path
            };
            fileLisets.push(item);
            $("#previewImg").append('<div class="col-sm-2"><div><img data-id="' + imgId + '" data-name="' + fileName + '" src="' + path + '" style="max-width: 150px; max-height: 150px;" class="image" /></div><div><button class="delete" id=' + imgId + '>刪除</button></div></div>');
        }
    }
    else
    {
        if (0 < fileLisets.length) {
            $.each(fileLisets, function (index, val) {
                if (imgId == val.id) {
                    fileLisets.splice(index, 1);
                    return false;
                }
            });
        }
    }
})

// 亂數產生
function stringGen(len) {
    var text = "";

    var charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for (var i = 0; i < len; i++)
        text += charset.charAt(Math.floor(Math.random() * charset.length));

    return text;
}

function getToStorage() {
    if ('' === sessionStorage["advertisingCreate"] || undefined === sessionStorage["advertisingCreate"]) {
        // window.location = '@Url.Action("Create")';
        window.location = '/Advertising/Create';
        return;
    } else {
        sessionStorageData = JSON.parse(sessionStorage["advertisingCreate"]);
        $.each(sessionStorageData, function(index, val){
            if (cid === val.cid) {
                // 類別
                $("#infoGroupp option").each(function (index, option) {
                    if (($(this).attr("data-id") === val.category.id) &&
                        ($(this).text() === val.category.text) &&
                        ($(this).val() === val.category.value)) {
                        $(this).attr('selected', 'selected');

                        let price = val.category.value;
                        price = price === "" ? 0 : price;
                        $("#infoGrouppPrice").text(price);

                        priceing = price;
                        calculate(priceing, discounting);

                        return false;
                    }
                });

                // 是否公開您的廣告
                $("input[type='radio'][name='isPublic']").each(function () {
                    if ($(this).attr('value') === val.isPublic) {
                        $(this).attr('checked', 'checked');
                        return false;
                    }
                });

                // 刊登期
                $("#infoPrices option").each(function (index, option) {
                    if (($(this).attr("data-id") === val.prices.id) &&
                        ($(this).text() === val.prices.text) &&
                        ($(this).val() === val.prices.value) &&
                        ($(this).attr("data-discount") === val.prices.discount)) {
                        $(this).attr('selected', 'selected');

                        $("#infoPriceDay").text(val.prices.value);
                        let discount = val.prices.discount;
                        discount = discount === undefined ? 0 : discount;
                        $("#infoPriceDiscount").text(discount);

                        discounting = discount;
                        calculate(priceing, discounting);

                        return false;
                    }
                });

                // 縣市
                $("#countyCity option").each(function (index, option) {
                    if ($(this).val() === val.countyCity) {
                        $(this).attr('selected', 'selected');
                        return false;
                    }
                });

                // 鄉鎮市區
                $("#townshipCity option").each(function (index, option) {
                    console.log($(this));
                    let options = '<option value="">=== 請選擇 ===</option>';
                    $.each(countyTownshipCityData, function (key) {
                        if (key === val.countyCity) {
                            $.each(countyTownshipCityData[key], function (key, val1) {
                                if (val1 === val.townshipCity) {
                                    options += '<option value="' + val1 + '" selected>' + val1 + '</option>';
                                } else{
                                    options += '<option value="' + val1 + '">' + val1 + '</option>';
                                }
                            });
                            $("#townshipCity").html(options);
                            return false;
                        }
                    });
                });

                // 標題
                $("#title").val(val.title);

                // 內容
                $("#contents").val(val.contents);

                // 圖片
                if (0 < val.fileLisets.length) {
                    fileLisets = val.fileLisets;
                    $.each(val.fileLisets, function (index, val1) {
                        $("#previewImg").append('<div class="col-sm-2"><div><img data-id="' + val1.id + '" data-name="' + val1.fileName + '" src="' + val1.path + '" style="max-width: 150px; max-height: 150px;" class="image" /></div><div><button class="delete" id=' + val1.id + '>刪除</button></div></div>');
                    });
                }

                // URL
                $("#url").val(val.url);

                // LINE URL
                $("#lineUrl").val(val.line);

                // 新增播點資料暫存
                if (undefined !== val.checkBroadcast && 0 < val.checkBroadcast.length) {
                    checkBroadcast = val.checkBroadcast;

                    // ConfirmCreate.cshtml 頁面使用
                    let content = '';
                    $('#bonusCount').text(val.checkBroadcast.length);
                    $.each(val.checkBroadcast, function (index, val) {
                        content += '<p>' + val.d_name + '</p>';
                    });
                    console.log(content);
                    $('#bonusCoutent').html(content);
                }
            }
        });
    }
}

function saveToStorage(data) {
    sessionStorageData.push(data);
    sessionStorage["advertisingCreate"] = JSON.stringify(sessionStorageData);
}