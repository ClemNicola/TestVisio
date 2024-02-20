const show = document.querySelector('.voir-moins')
// const arrow = document.querySelector('.fleche')
const columns = document.querySelectorAll('.day-selector')

const arrowRight = document.getElementById('right')
const arrowLeft = document.getElementById('left')
// const noneHours = document.querySelectorAll('.none-advisor-hours')

let isReduce = true;


function showLess() {


  columns.forEach(column =>{

    const slots = column.querySelectorAll('li');
    const slotsToggle = Array.from(slots).slice(10);

    slotsToggle.forEach(slot => {
      slot.style.display = isReduce ? "none" : ""
    });


  });

  show.textContent = isReduce ? 'Voir plus' : 'Voir moins';

  if (!show.querySelector('.fleche')) {
    let i = document.createElement('i');
    i.classList.add('fleche', 'fa-solid', 'fa-greater-than');
    show.appendChild(i);
    i.style.transform = isReduce ? "rotate(90deg)" : "";
    i.style.margin = "0 1rem"
  }

  isReduce = !isReduce;

}
function updateDate() {

}

function backDate() {

}

document.addEventListener('DOMContentLoaded', showLess);
show.addEventListener('click', showLess);

arrowRight.addEventListener('click', updateDate)
arrowLeft.addEventListener('click', backDate)
