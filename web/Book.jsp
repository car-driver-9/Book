<%-- 
    Document   : Book
    Created on : Apr 13, 2020, 3:41:06 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- Compiled and minified CSS -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">

<!--Let browser know website is optimized for mobile-->
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>

<script> 
                function validate()
                { 
                    var name = document.form.name.value;
                    var address = document.form.address.value;
                    var destination = document.form.destination.value;
                    var home = document.form.home.value; 
                    var way = document.form.way.value;
                    var street = document.form.street.value;
                    var date= document.form.date.value;
                    var time= document.form.time.value;

                    if (name==null || name=="")
                    { 
                    alert(" Name can't be blank"); 
                    return false; 
                    }

                    else if (address==null || address=="")
                    { 
                    alert("address can't be blank"); 
                    return false; 
                    }

                    else if (destination==null || destination=="")
                    { 
                    alert("destination can't be blank"); 
                    return false; 
                    }

                   else if (home==null || home=="")
                    { 
                    alert("home can't be blank"); 
                    return false; 
                    }

                    else if (way==null || way=="")
                    { 
                    alert("way can't be blank"); 
                    return false; 
                    }
                    
                    
                    else if (street==null || street=="")
                    { 
                    alert("street can't be blank"); 
                    return false; 
                    }
                    
                    
                    else if (date==null || date=="")
                    { 
                    alert("date can't be blank"); 
                    return false; 
                    }
                    
                    
                    else if (time==null || time=="")
                    { 
                    alert("time can't be blank"); 
                    return false; 
                    }

                    
                 } 
            </script> 
    </head>

    
    <body>
        <headar>
<div class="waves-light"  style="height:100px;background-image: url(resources/alpha.JPG); 
    /* background-size: cover; */
    /* background-position: center; */
   color: rgba(255, 255, 255, 1);"></div>
  <div style="padding:20px;max-width:420px;margin:auto;">
      </header>
    <h3 style="text-align:center;">Book</h3>
    <div style="height:10px;"></div>
    <form id="book" class="col s12" name="form" action="BookServlet" method="post" onsubmit="return validate()">
    <div class="input-field col s12">
        <input id="name" name="name" type="text" required>
        <label for="name">Name</label>
    </div>
        
         <div class="input-field col s12">
        <select id="address" name="address">
            <option value="" disabled selected>Address</option>
            <option value="Head">Al-Amarat</option>
            <option value="Assistant">Bawshar</option>
            <option value="Secretary">Al-Seeb</option>
            <option value="Others">Qurayyat</option>
        </select>
    </div>
        
         <div class="input-field col s12">
        <select id="destination" name="destination">
            <option value="" disabled selected>Destination</option>
            <option value="Head">Al-Azaiba</option>
            <option value="Assistant">Al-Ghabra</option>
            <option value="Secretary">Ghala</option>
            <option value="Others">Al-Khuwair</option>
        </select>
    </div>
        
        
        
        
    <div class="input-field col s12">  
        <input id="home" name="home" type="text" required>
        <label for="home">Home</label>
    </div>
    <div class="input-field col s12">
        <input id="way" name="way" type="text" required>
        <label for="way">Way</label>
    </div>

    <div class="input-field col s12">
        <input id="street" name="street" type="text" required>
        <label for="street">Street</label>
    </div>
        
        <div class="input-field col s12">
        <input id="date" name="date" type="text" required>
        <label for="date">Date</label>
    </div>
        
        <div class="input-field col s12">
        <input id="time" name="time" type="text" required>
        <label for="time">Time</label>
    </div>


        <br/>
        <div class="row">
            <div class="col s6">
                <button class="btn btn-large waves-effect pink accent-3" type="reset" >Reset
                    <i class="material-icons right">settings_backup_restore</i>
                </button>
            </div>
            <div class="col s6">
                <button class="btn btn-large waves-effect waves-light" id ="send" type="submit" name="send">Send
                    <i class="material-icons right">send</i>
                </button>
            </div>
        </div>
    </div>
</form>
      </div>
     
      <!--Import jQuery before materialize.js-->
      <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
      <script>
        $(document).ready(function() {
    				$('select').material_select();
  			});
      </script>
    </body>
       <style>
           header{
               position:fixed;
           }
       </style>
        <script>
       // Variable to hold request
var request;

// Bind to the submit event of our form
$("#register").submit(function(event){

    // Abort any pending request
    if (request) {
        request.abort();
    }
    // setup some local variables
    var $form = $(this);

    // Let's select and cache all the fields
    var $inputs = $form.find("input, select, button, textarea");

    // Serialize the data in the form
    var serializedData = $form.serialize();

    // Let's disable the inputs for the duration of the Ajax request.
    // Note: we disable elements AFTER the form data has been serialized.
    // Disabled form elements will not be serialized.
    $inputs.prop("disabled", true);

    // Fire off the request to /form.php
    request = $.ajax({
        url: "https://script.google.com/macros/s/AKfycbz3oG_5Nigd67eOike15Ay8LJ53DS0ZzSjhqvS6DDDrMzlGTl4i/exec",
        type: "post",
        data: serializedData
    });

    // Callback handler that will be called on success
    request.done(function (response, textStatus, jqXHR){
        // Log a message to the console
        console.log("Hooray, it worked!");
        console.log(response);
        console.log(textStatus);
        console.log(jqXHR);
      $("#register")[0].reset();
    });

    // Callback handler that will be called on failure
    request.fail(function (jqXHR, textStatus, errorThrown){
        // Log the error to the console
        console.error(
            "The following error occurred: "+
            textStatus, errorThrown
        );
    });

    // Callback handler that will be called regardless
    // if the request failed or succeeded
    request.always(function () {
        // Reenable the inputs
        $inputs.prop("disabled", false);
          
    });

    // Prevent default posting of form
    event.preventDefault();
});

        </script>
    
</html>
