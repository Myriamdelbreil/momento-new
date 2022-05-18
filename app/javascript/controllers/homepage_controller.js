function changeNavbarText () {
  const navbarText = document.getElementById("my-trips-btn");
  this.scrollY > 680 ? navbarText.style.color = "black" : navbarText.style.color = "white"
}

function scrollDown () {
  const timelineHome = document.querySelector(".home-timeline");
  timelineHome.scrollIntoView();
}

const scrollButton = document.getElementById("scrollable")
scrollButton.addEventListener("click", scrollDown)
window.addEventListener("scroll", changeNavbarText);
