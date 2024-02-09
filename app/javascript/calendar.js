const show = document.querySelector('.voir-moins')
const arrow = document.querySelector('.fleche')
const hours = document.querySelectorAll('.time')
const columns = document.querySelectorAll('.day-selector')
// const noneHours = document.querySelectorAll('.none-advisor-hours')

let isReduce = false;


function showLess() {


  columns.forEach(column =>{
    const hours = column.querySelectorAll('.time');
    const timeToggle = Array.from(hours).slice(10);

    timeToggle.forEach(time => {
      time.style.display = isReduce ? "" : "none";
    });
  });

  show.textContent = isReduce ? 'Voir moins' : 'Voir plus';
  arrow.style.transform = isReduce ? "rotate(90deg)" : "rotate(0deg)";
  isReduce = !isReduce;

}

show.addEventListener('click', showLess)
