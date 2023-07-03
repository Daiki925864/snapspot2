document.addEventListener("DOMContentLoaded", () => {
const tagNameInput = document.querySelector("#tag_name_floatingInput");
  if (tagNameInput){
    const inputElement = document.getElementById("tag_name_floatingInput");
    inputElement.addEventListener("input", () => {
      const keyword = document.getElementById("tag_name_floatingInput").value;
      console.log(keyword);
    });
  };
});