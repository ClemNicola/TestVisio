const show = document.querySelector('.voir-moins')
const arrow = document.querySelector('.fleche')
const columns = document.querySelectorAll('.day-selector')
// const noneHours = document.querySelectorAll('.none-advisor-hours')

let isReduce = false;


function showLess() {


  columns.forEach(column =>{

    const hours = column.querySelectorAll('.time');
    const inputs = document.querySelectorAll('input')
    const labels = document.querySelectorAll('label')

    const timeToggle = Array.from(hours).slice(10);
    const inputToggle = Array.from(inputs).slice(10);
    const labelToggle = Array.from(labels).slice(10);

    timeToggle.forEach(time => {
      time.style.display = isReduce ? "" : "none";
    });

    inputToggle.forEach(input => {
      input.style.display = isReduce ? "" : "none";
    });

    labelToggle.forEach(label => {
      label.style.display = isReduce ? "" : "none";
    });
  });

  show.textContent = isReduce ? 'Voir moins' : 'Voir plus';
  arrow.style.transform = isReduce ? "rotate(90deg)" : "rotate(0deg)";
  isReduce = !isReduce;

}

show.addEventListener('click', showLess)
