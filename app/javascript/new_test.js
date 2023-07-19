 document.addEventListener("DOMContentLoaded", () => {
  const hideH2Button = document.querySelector("#hide-h2-button");

  hideH2Button.addEventListener("click", () => {
    const h2Tags = document.querySelectorAll("h2");

    h2Tags.forEach((h2) => {
      h2.style.display = "none";
    });
  });
 });

 