var currentTab = 0; // Current tab is set to be the first tab (0)
        showTab(currentTab); // Display the current tab
        const next = document.getElementById('nextBtn');
        const prev = document.getElementById('prevBtn');
        function showTab(n) {
          // This function will display the specified tab of the form...
          var x = document.getElementsByClassName("step");
          x[n].style.display = "block";
          //... and fix the Previous/Next buttons:
          if (n == 0) {
            document.getElementById("prevBtn").style.display = "none";
          } else {
            document.getElementById("prevBtn").style.display = "inline";
          }
          if (n == (x.length - 1)) {
            document.getElementById("nextBtn").innerHTML = "Submit";
          } else {
            document.getElementById("nextBtn").innerHTML = "Next";
          }
          //... and run a function that will display the correct step indicator:
          fixStepIndicator(n)
        }

        function nextPrev(n) {
          // This function will figure out which tab to display
          var x = document.getElementsByClassName("step");
          // Exit the function if any field in the current tab is invalid:
          if (n == 1 && !validateForm()) return false;
          // Hide the current tab:
          x[currentTab].style.display = "none";
          // Increase or decrease the current tab by 1:
          currentTab = currentTab + n;
          // if you have reached the end of the form...
          if (currentTab >= x.length) {
            // ... the form gets submitted:
            document.getElementById("appointmentForm").submit();
            return false;
          }
          // Otherwise, display the correct tab:
          showTab(currentTab);
        }

        function validateForm() {
          // This function deals with validation of the form fields
          var x, y, i, valid = true;
          x = document.getElementsByClassName("step");
          y = x[currentTab].getElementsByTagName("input");
          // A loop that checks every input field in the current tab:
          for (i = 0; i < y.length; i++) {
            // If a field is empty...
            if (y[i].value == "") {
              // add an "invalid" class to the field:
              y[i].className += " invalid";
              // and set the current valid status to false
              valid = false;
            }
          }
          // If the valid status is true, mark the step as finished and valid:
          if (valid) {
            document.getElementsByClassName("stepIndicator")[currentTab].className += " finish";
          }
          return valid; // return the valid status
        }

        function fixStepIndicator(n) {
          // This function removes the "active" class of all steps...
          var i, x = document.getElementsByClassName("stepIndicator");
          for (i = 0; i < x.length; i++) {
            x[i].className = x[i].className.replace(" active", "");
          }
          //... and adds the "active" class on the current step:
          x[n].className += " active";
        }
        prev.addEventListener('click', function(){nextPrev(-1); });
        next.addEventListener('click', function(){nextPrev(1); });

// let currentTab = 0;
// showTab(currentTab);

// const prev = document.getElementById('prevBtn');
// const next = document.getElementById('nextBtn');

// function showTab(n){
//   const steps = document.getElementsByClassName('step');
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
