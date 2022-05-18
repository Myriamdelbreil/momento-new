function changeCss () {
  let navbarText = document.getElementById("my-trips-btn");
  console.log(navbarText)
  this.scrollY > 680 ? navbarText.style.color = "black" : navbarText.style.color = "white"
}
window.addEventListener("scroll", changeCss);
