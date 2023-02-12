// navbar button slide up and down
const menu = document.getElementById('mobile-menu');
const toggle = () => menu.classList.toggle("hidden");

// Student login and teacher login
function StudentLogin() {
    document.getElementById("StudentForm").style.display = "block";
    document.getElementById("TeacherForm").style.display = "none";
    document.getElementById("StudentBtn").style.backgroundColor = "darkred";
    document.getElementById("TeacherBtn").style.backgroundColor = "#2C3E50";
}
function TeacherLogin() {
    document.getElementById("StudentForm").style.display = "none";
    document.getElementById("TeacherForm").style.display = "block";
    document.getElementById("TeacherBtn").style.backgroundColor = "darkred";
    document.getElementById("StudentBtn").style.backgroundColor = "#2C3E50";
}

// navbar profile
const navprofilemenu = document.getElementById('navprofilemenu');
const navprofile = () => navprofilemenu.classList.toggle("hidden");


//  data send 
function formdata(val1) {
    document.getElementById("coursevalue").value = val1;
}


// Admin dashboard page
// <!-- section hide and show code -->
var divs = ["Section1", "Section2", "Section3"];
var visibleId = null;

function show(id) {
    if (visibleId !== id) {
        visibleId = id;
    }
    hide();
}

function hide() {
    var div, i, id;
    for (i = 0; i < divs.length; i++) {
        id = divs[i];
        div = document.getElementById(id);
        if (visibleId === id) {
            div.style.display = "block";
        } else {
            div.style.display = "none";
        }
    }
}