const weekDays = document.getElementById('week-days');
const timeSlotes = document.getElementById('time-slotes');

function loadAvailabilities() {
  const availableDays = getAvailableDays();
  const availableHours = getAvailableHours();

  weekDays.innerHTML = '';

  availableDays.forEach(day =>{
    const day = document.createElement('div');
    day.classList.add('day');
    day.textContent = day;
    weekDays.appendChild(day)
  });

  timeSlotes.innerHTML = '';

  availableHours.forEach(slot => {
      const hour = document.createElement('div')
      hour.classList.add('slot');
      hour.textContect = slot;
      timeSlotes.appendChild(hour)
  })
}


weekDays.addEventListener('click', function(e){
  if(e.target.classList.includes('day')){

  }
})

timeSlotes.addEventListener('click',function(e){
  if (e.target.classList.includes('slot')){
    document.querySelectorAll('.slot').forEach(slot => slot.classList.remove('selected'));
    e.target.classList.add('selected');
  }
});

loadAvailabilities()


function getAvailableDays(){


}

function getAvailableDays(){


}
