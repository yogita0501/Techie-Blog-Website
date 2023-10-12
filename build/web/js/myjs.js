function doLike(pid, uid)
{
    changeIcon();
    console.log(pid + "," + uid);
    const d = {
        uid: uid,
        pid: pid,
        operation: 'like'
    };

    $.ajax({
        url: "LikeServlet",
        data: d,
        success: function (data, textStatus, jqXHR) {
            console.log(data);
            if (data.trim() == 'true')
            {
                let c = $(".like-counter").html();
                c++;
                $('.like-counter').html(c);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            console.log(data);
        }
    });
}


function changeIcon(){
    var icon = document.getElementById('like');
    if(icon.classList.contains('fa-thumbs-up')){
        icon.classList.remove('fa-thumbs-up');
        icon.classList.add('fa-heart');
    }
}