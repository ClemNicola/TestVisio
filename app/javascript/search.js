document.addEventListener('DOMContentLoaded', () => {
  const form = document.getElementById('search-cities')
  const displayAdvisorsArea = document.querySelector('.grid');
  const cityNameInput = document.getElementById('city-name');


  form.addEventListener('input', (event) => {
    event.preventDefault();
    const cityValue = cityNameInput.value.trim().toLowerCase();
    filterAdvisorByCity(cityValue);
  });

  function displayAdvisors(filterAdvisors){
    displayAdvisorsArea.innerHTML = "";
    filterAdvisors.forEach(advisor => {
      const advisorElement = document.createElement('div')
      advisorElement.className = 'card-advisor';
      advisorElement.innerHTML = `
        <img src="https://source.unsplash.com/random/?portrait" alt="Advisors">
        <h2 id="advisor-name">${advisor.first_name} ${advisor.last_name}</h2>
        <h6> ${advisor.speciality}</h6>
        <p id="loc"> ${advisor.address}, <strong>${advisor.city}</strong></p>
        <div class="advisor-info">
          <p id="bio">${advisor.bio}</p>
        </div>
        <div class="parent-rdv">
        <a class="rdv" href="/show_advisor_path/${advisor.id}"><strong>prendre rendez-vous</strong></a>
        </div>
      `;
      displayAdvisorsArea.appendChild(advisorElement)
    })
  }

  function filterAdvisorByCity(city){
    let filteredAdvisors;
    if (city){
      filteredAdvisors = advisors.filter(advisor => advisor.city.toLowerCase() === city);
    } else {
      filteredAdvisors = advisors
    }
    displayAdvisors(filteredAdvisors);

    if (city){
      displayAdvisorsArea.scrollIntoView({ behavior: 'smooth', block: 'start' });
    }
  }
});
