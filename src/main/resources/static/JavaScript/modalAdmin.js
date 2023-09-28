
var modalparent = document.getElementsByClassName("modal_multi");

var modal_btn_multi = document.getElementsByClassName("myBtn_multi");

var span_close_multi = document.getElementsByClassName("close_multi");

function setDataIndex() {

    for (i = 0; i < modal_btn_multi.length; i++)
    {
        modal_btn_multi[i].setAttribute('data-index', i);
        modalparent[i].setAttribute('data-index', i);
        span_close_multi[i].setAttribute('data-index', i);
    }
}

for (i = 0; i < modal_btn_multi.length; i++)
{
    modal_btn_multi[i].onclick = function() {
        var ElementIndex = this.getAttribute('data-index');
        modalparent[ElementIndex].style.display = "block";
    };

    span_close_multi[i].onclick = function() {
        var ElementIndex = this.getAttribute('data-index');
        modalparent[ElementIndex].style.display = "none";
    };

}

window.onload = function() {

    setDataIndex();
};

window.onclick = function(event) {
    if (event.target === modalparent[event.target.getAttribute('data-index')]) {
        modalparent[event.target.getAttribute('data-index')].style.display = "none";
    }

    if (event.target === modal) {
        modal.style.display = "none";
    }
};

var modal = document.getElementById('myModal');

var btn = document.getElementById("myBtn");

var span = modal.getElementsByClassName("close")[0];


btn.onclick = function() {

    modal.style.display = "block";
}

span.onclick = function() {
    modal.style.display = "none";
}