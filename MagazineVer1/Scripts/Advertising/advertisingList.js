$('.table tbody tr').click(function () {
    let herf = $(this).attr("data-href");
    if(undefined == herf || "" == herf || null == herf){
        return false;
    }
    window.location = herf;
});