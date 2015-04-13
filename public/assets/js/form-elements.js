var FormElements = function () {
    //function to initiate jquery.inputlimiter
   
    
  
    //function to initiate bootstrap-timepicker
    var runTimePicker = function () {
        $('.time-picker').timepicker();
    };
   
    
    
    return {
        //main function to initiate template pages
        init: function () {
            
            runTimePicker();
           
        }
    };
}();