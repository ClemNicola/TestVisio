const show = document.querySelector('#voir-moins')
const arrow = document.querySelector('.fleche')
const columns = document.querySelectorAll('.day-selector')
// const noneHours = document.querySelectorAll('.none-advisor-hours')

let isReduce = true;


function showLess() {


  columns.forEach(column =>{

    const slots = column.querySelectorAll('li');
    const slotsToggle = Array.from(slots).slice(10);

    slotsToggle.forEach(slot => {
      slot.style.display = isReduce ? "none" : "";
    });

  });

  show.textContent = isReduce ? 'Voir plus' : 'Voir moins';
  arrow.style.transform = isReduce ? "rotate(90deg)" : "rotate(-90deg)";
  isReduce = !isReduce;

}

document.addEventListener('DOMContentLoaded', showLess);
show.addEventListener('click', showLess);
