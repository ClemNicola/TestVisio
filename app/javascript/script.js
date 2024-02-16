document.addEventListener('DOMContentLoaded', (event) => {
  let currentTab = 0; // Initialise l'onglet actuel à 0
  showTab(currentTab); // Affiche l'onglet actuel

  function showTab(n) {
    let steps = document.getElementsByClassName('step');
    for (let i = 0; i < steps.length; i++) {
      steps[i].style.display = "none";
    }
    steps[n].style.display = "block";

    let prev = document.getElementById('prevBtn');
    let next = document.getElementById('nextBtn');
    let submit = document.getElementById('submitBtn');

    prev.style.display = n === 0 ? "none" : "inline";
    if (n === steps.length - 1) {
      next.style.display = "none"; // Cache le bouton Next
      submit.style.display = "inline-block"; // Affiche le bouton Submit
    } else {
      next.style.display = "inline-block"; // Affiche le bouton Next
      submit.style.display = "none"; // Cache le bouton Submit
    }

    fixStepIndicator(n);
  }

  function nextPrev(n) {
    let steps = document.getElementsByClassName('step');
    if (n == 1 && !validateForm()) return false;

    steps[currentTab].style.display = "none";
    currentTab += n;

    if (currentTab >= steps.length) currentTab = steps.length - 1;

    showTab(currentTab); // Affiche nouvel onglet
  }

  function validateForm() {
    let valid = true;
    let step = document.getElementsByClassName('step')[currentTab];
    let inputs = step.getElementsByTagName('input');

    for (let input of inputs) {
      if (input.value == "") {
        input.classList.add("invalid"); // Utilise classList.add pour ajouter une classe
        valid = false;
      } else {
        input.classList.remove("invalid"); // Retire la classe "invalid" si le champ est rempli
      }
    }

    if (valid) {
      let stepIndicators = document.getElementsByClassName('stepIndicator');
      if (stepIndicators[currentTab]) stepIndicators[currentTab].classList.add("finish");
    }

    return valid;
  }

  function fixStepIndicator(n) {
    let stepIndicators = document.getElementsByClassName('stepIndicator');
    for (let indicator of stepIndicators) {
      indicator.classList.remove("active"); // Utilise classList.remove pour retirer une classe
    }
    if (stepIndicators[n]) stepIndicators[n].classList.add("active");
  }

  document.getElementById('prevBtn').addEventListener('click', () => nextPrev(-1));
  document.getElementById('nextBtn').addEventListener('click', () => nextPrev(1));
});

// let currentTab = 0;
// showTab(currentTab);

// const prev = document.getElementById('prevBtn');
// const next = document.getElementById('nextBtn');

// function showTab(n){
//   let steps = document.getElementsByClassName('step');
//   steps[n].style.display = 'block';
//   if (n == 0){
//     document.getElementById('prevBtn').style.display = "none";
//   } else {
//     document.getElementById('prevBtn').style.display = "inline";
//   }

//   if (n == steps.length -1 ){
//     document.getElementById('nextBtn').innerHTML = "Submit";
//   }else {
//     document.getElementById('nextBtn').innerHTML = "Next";
//   }

//   fixStepIndicator(n)
// }

// function fixStepIndicator(n){
//   let i, x = document.getElementsByClassName('stepIndicator');
//   for(i = 0; i < x.length; i ++){
//     x[i].className = x[i].className.replace("active", "");
//   }
//   x[n].className += "active";
// }

// function nextPrev(n){
//   const steps = document.getElementsByClassName('step');
//   if (n == 1 && !validateForm()) return false;
//   steps[currentTab].style.display = "none";
//   currentTab = currentTab + n;

//   if (currentTab >= steps.length){
//     document.getElementById("signUpForm").submit();
//     return false;
//   }
//   showTab(currentTab)
// }

// function validateForm(){
//   let x,y,i, valid = true;

//   x = document.getElementsByClassName('step');
//   y = x[currentTab].getElementsByTagName('input');

//   for (i = 0; i < y.length; i ++){
//     if (y[i].value = ""){
//       y[i].className += " invalid";
//       valid = false;
//     }
//   }
//   if(valid) {
//     document.getElementsByClassName("stepIndicator")[currentTab].className += " finish";
//   }
//   return valid;
// }

// prev.addEventListener('click', function(){nextPrev(-1); });
// next.addEventListener('click', function(){nextPrev(1); });
