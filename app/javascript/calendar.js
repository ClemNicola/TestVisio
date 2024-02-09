const show = document.querySelector('.voir-moins')
const arrow = document.querySelector('.fleche')
const hours = document.querySelectorAll('.time')
// const noneHours = document.querySelectorAll('.none-advisor-hours')

let isReduce = false;


function showLess() {
  const allHours = [...hours];

  const halfHours = Math.ceil(allHours.length / 2);

  if (!isReduce){
    for(let i = 0; i < halfHours; i ++){
      allHours[i].style.display = "none";
    }
    show.textContent = 'Voir plus';
    arrow.style.transform = "rotate(90deg)"
    isReduce = true;
  }else{
    allHours.forEach(element => element.style.display = "");
    isReduced = false

  }

}

show.addEventListener('click', showLess)
