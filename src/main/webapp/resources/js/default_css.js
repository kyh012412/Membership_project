const document_head = document.head;

const RESOURCE_PATH = window.location.origin + "/membership/resources/";
const FOLDER_PATH = document.head.dataset.id + "/";
let FILE_PATH = window.location.pathname.split("/").slice(-1);

if(FOLDER_PATH == "home/"){
    FILE_PATH = "home";
}

const main_css = document.createElement("link");
main_css.href = RESOURCE_PATH + "css/main.css";
main_css.rel = "stylesheet";
main_css.type = "text/css";

const document_css = document.createElement("link");
document_css.href = RESOURCE_PATH + "css/" + FOLDER_PATH + FILE_PATH + ".css";
document_css.rel = "stylesheet";
document_css.type = "text/css";

document_head.appendChild(main_css);
document_head.appendChild(document_css);