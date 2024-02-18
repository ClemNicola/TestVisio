const appointmentTypes = document.querySelectorAll('.appointment-radio');
const advisorHours = document.querySelectorAll('.advisor-hours');


function selectedAppointment(){
  const selectedLabel = document.querySelector('label[for="' + this.id + '"] .w-full.text-lg.font-semibold').innerHTML;
  const selectedDuration = document.querySelector('label[for="' + this.id  + '"] .w-full.text-gray-500').innerHTML;
  document.getElementById('appointment-type').innerHTML = selectedLabel + ' - ' + selectedDuration ;

}

function selectedHours() {

  const daySelector = this.closest('.days-container')
  // const selectedDay = daySelector.querySelector('.date-info .day-pick').innerHTML;
  // const selectedDate = daySelector.querySelector('.date-info .date').innerHTML;
  const selectedTime = this.value

  const fullDate = this.id.split('_').pop();

  const selectedDate = document.getElementById('appointment_date').value = fullDate;

  document.getElementById('rdv').innerHTML = 'Rendez-vous le: ' + selectedDate + ' à ' + selectedTime
}

appointmentTypes.forEach(appointment => appointment.addEventListener('change', selectedAppointment));
advisorHours.forEach(hour => hour.addEventListener('change', selectedHours));
