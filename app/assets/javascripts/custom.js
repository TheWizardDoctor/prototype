// this funciton is for the dropdown buttons like quater change or ascending/descending filters
function dropButton(i) {
    document.getElementById("dropbox"+i).classList.toggle("show");
}

// this function is a search funtion for the quater button
// REVIEW 
function filterFunction() {
    var input, filter, ul, li, a, i;
    input = document.getElementById("myInput");
    filter = input.value.toUpperCase();
    div = document.getElementById("myDropdown");
    a = div.getElementsByTagName("a");
    for (i = 0; i < a.length; i++) {
        if (a[i].innerHTML.toUpperCase().indexOf(filter) > -1) {
            a[i].style.display = "";
        } else {
            a[i].style.display = "none";
        }
    }
}

// this function is for toggling the lists in the teams index page (dropdown list)
function dropdown(id) {
  document.getElementById(id).classList.toggle("show")
}
