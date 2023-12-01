let list = document.querySelectorAll(".navigation li");

function activeLink(){
    list.forEach(item=>{
        item.classList.remove("hovered");
    });
    this.classList.add("hovered");
}
list.forEach(item=>item.addEventListener("mouseover", activeLink));

let toggle = document.querySelector(".toggle");
let navigation = document.querySelector(".navigation");
let main = document.querySelector(".main");

toggle.onclick = function(){
    navigation.classList.toggle("active");
    main.classList.toggle("active");
}

let scoreElements = document.querySelectorAll(".score");

function applyStyles(scoreElement) {
    let scoreValue = parseFloat(scoreElement.textContent);

    if (scoreValue <= 5) {
        scoreElement.textContent = "Malo";
        scoreElement.style.backgroundColor = "#FF0000";
    } else if (scoreValue >= 6 && scoreValue <= 7) {
        scoreElement.textContent = "Regular";
        scoreElement.style.backgroundColor = "#FFA500"; 
    } else if (scoreValue >= 8 && scoreValue <= 10) {
        scoreElement.textContent = "Bueno";
        scoreElement.style.backgroundColor = "#00FF00"; 
    }
}

scoreElements.forEach(item => {
    applyStyles(item);
});
