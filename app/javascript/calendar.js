const weekDays = document.getElementById('week-days');
const timeSlotes = document.getElementById('time-slotes');
const calendar = document.querySelector('.calendar')
const advisorId = calendar.dataset.advisorId

function fetchAvailabilities(){
  return fetch(`/advisors/${advisorId}/availabilities`)
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.json();
    })
    .then(data =>{
      console.log('Availabilities Fetched', data);
      return data;
    })
    .catch(error => {
      console.error('Error fetching availabilities', error);
    });
}

function loadAvailabilities() {
  fetchAvailabilities().then(availabilities =>{
    const availableDays = getAvailableDays(availabilities);
    // const availableHours = getAvailableHours();

    weekDays.innerHTML = '';

    availableDays.forEach(day =>{
      const dayElement = document.createElement('div');
      dayElement.classList.add('day');
      dayElement.textContent = day;
      weekDays.appendChild(dayElement)
    });

    // timeSlotes.innerHTML = '';

    // availableHours.forEach(slot => {
    //   const hour = document.createElement('div')
    //   hour.classList.add('slot');
    //   hour.textContent = slot;
    //   timeSlotes.appendChild(hour)
    // })

  })
}

weekDays.addEventListener('click', function(e){
  if(e.target.classList.includes('day')){
  }
})

// timeSlotes.addEventListener('click',function(e){
//   if (e.target.classList.includes('slot')){
//     document.querySelectorAll('.slot').forEach(slot => slot.classList.remove('selected'));
//     e.target.classList.add('selected');
//   }
// });

loadAvailabilities()

function getAvailableDays(availavbilities){
  const days = availavbilities.map(availability => new Date(availability.date).toDateString());
  return [...new Set(days)]; // Utilisez Set pour éliminer les doublons
}

// function getAvailableHours(){


// }
