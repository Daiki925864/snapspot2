document.addEventListener("DOMContentLoaded", () => {
const tagNameInput = document.querySelector("#tag_name_floatingInput");
  if (tagNameInput){
    const inputElement = document.getElementById("tag_name_floatingInput");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("tag_name_floatingInput").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/posts/search_tag/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.tag_name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("tag_name_floatingInput").value = clickElement.textContent;
              clickElement.remove();
            });
          });
        };
      };
    });
  };
});