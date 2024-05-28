<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Page</title>
    <script>
        function validateForm(){
            // var inputobj = document.getElementsByClassName("inputbox").value;
            
            var name = document.getElementById("name").value;
            var mob = document.getElementById("mob").value;
            var city = document.getElementById("city").value;
            var pas1 = document.getElementById("password1").value;
            var pas2 = document.getElementById("password2").value;
            
            var email = document.getElementById("email").value;
            var atposition=email.indexOf("@");  
            var dotposition=email.lastIndexOf(".");  
            if (atposition<1 || dotposition<atposition+2 || dotposition+2>=email.length){   //this is copied only
            alert("Please enter a valid e-mail address \n atpostion:"+atposition+"\n dotposition:"+dotposition);  
            return false;  
            }  
            
            else if(name=="" || name==null || !isNaN(name)){
                alert("Insert Correct Name in the Name field");
                return false;
            }

            else if(isNaN(mob) || mob.length!=10){
                alert("Mobile number allows 10 digits only");
                return false;
            }

            else if(!isNaN(city) || city=="" || city==null ){
                alert("Insert correct city name in the city field");
                return false;
            }
            
            else if(pas1.length < 6 || pas2.length < 6){
                alert("Passward must contain atleast six letters")
                return false;
            }
            
            else if(pas1 != pas2){
                alert("Passwords must be the same");
                return false;
            }
            

            return true;
        }
        </script>
    <style>
        *{
            margin: 0px;
            font-family: system-ui;
        }
        body{
            /* background-image: linear-gradient(); */
            background-image: linear-gradient(to bottom right, #33ccff 49%, #0091ff 100%);
            /* background-image: radial-gradient( circle 976px at 51.2% 51%,  rgba(11,27,103,1) 0%, rgba(16,66,157,1) 0%, rgba(11,27,103,1) 17.3%, rgba(11,27,103,1) 58.8%, rgba(11,27,103,1) 71.4%, rgba(16,66,157,1) 100.2%, rgba(187,187,187,1) 100.2% ); */
            background-repeat: no-repeat;
            /* background-image: linear-gradient( 132.6deg,  rgba(71,139,214,1) 23.3%, rgba(37,216,211,1) 84.7% ); */

            background-size: cover;
            background-position: fixed;
            width: 100%;
            height: 100vh;
        }
        
        #container1 {
            width: 50%;
            height: 70%;
            /* background-colo:; */
            /* background-color:rgb(182, 180, 155); */
            background-image: linear-gradient(to bottom right, #33ccff 49%, #0091ff 100%);

            
            transform: translate(50%,20%);
            box-shadow: 10px 15px 20px 20px #b0d4ff;
            border-radius: 25px;
            padding: 10px;
            display: flex;
            flex-direction: column;
            gap:29px;
        }

        #signUp {
            font-weight: bolder;
            transform: translate(5%,45%);
        }
        
        #form1 {
            transform: translate(5%);
            display: flex;
            flex-direction: column;
            justify-content: space-evenly;
            align-items: left;
            height: inherit;
            gap: 15px;
        }
        
        .rows {
            font-size: large;
            font-weight: 500;
            width: 80%;
            display: flex;
            align-items:end;
            gap: 10px;
            /* text-align-last: center; */
            justify-content: space-between;
            /* font-size: 17.33px; */
        }
        
        .inputbox {
            width: 400px;
            height: 30px;
            background-color:unset;
            /* background-color: #00ffff71; */
            border: none;
            border-bottom:2px solid black;
            /* align-items: center; */
            
            
        }
        
        input  {
            border: none;
            outline: none;
            background-color: none;
            border-radius: 1px;
            /* font-size: 17.33px; */
            /* font-weight: 550; */
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }

        /* :-ms-input-placeholder{

        } */

        /* #submitButton{
            border: none;
            width: 20%;
            border-radius: 5px;
            font-size: 20px;
            font-weight: 600;
        } */

        
        #submitButton {
            width: 50%;
            height: 40px;
            background-color:rgb(0, 94, 105);
            /* background-color:chartreuse; */
            border-radius:15px;
            border:none;
            color:white;
            font-size: larger;
            font-family: Georgia;
            text-align: center;
            padding: 5px;
            transition: all 0.3s ease 0s;
            transform: translate(40%,60%);

        }

        #submitButton:hover {
        background-color: #0c3343;
	    box-shadow: 0px 15px 20px #fff;
	    color: #fff;
	    /* transform: translateY(-7px); */
        transform: translate(40%,45%);   
        }

        #had_an_account {
            transform: translate(30%,20%);
        }

        #anker {
            text-decoration: none;
        }





    </style>
</head> 
<body>
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status") %>"  >
    
    
    <div id="container1" >
        <h1 id='signUp' >Sign Up</h1>
        <form id="form1" method="post" action="register" enctype="multipart/form-data" onsubmit="return validateForm()">
            <div class="rows">
                Name: <input id="name" name="name" class="inputbox" type="text" />
            </div>
            <div class="rows">
                E-mail: <input id="email" name="email" class="inputbox" type="email" />
            </div>
            <div class="rows">
                Mobile NO: <input id="mob" name="contact" class="inputbox" type="text" />
            </div>
            <div class="rows">
                City: <input id="city" name="city" class="inputbox" type="text" />
            </div>
            <div class="rows">
                Password: <input id="password1" name="password1" class="inputbox" type="password" />
            </div>
            <div class="rows">
                Confirm Password: <input id="password2" name="password2" class="inputbox" type="password" />
            </div>
            
            <div class="rows">
                    <label> Profile Photo: </label> 
                    <input type="file" name="image" id="image">
            </div>

            <button type="submit" id="submitButton" >Submit</button>
            <span id="had_an_account"> already had an account? <a id="anker" href="Sign_in.jsp"><b>login</b></a></span>


        </form>
       

    </div>
    
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
        
        <script type="text/javascript">
            
            var status = document.getElementById("status").value;
            if(status == "success"){
                swal("congrats","Account created successfully","success");
                document.getElementById("status").value = "";
                <%--<jsp:forward page="Sign_In.jsp" />--%>  
//                dispatcher = request.get
            }
//            else{
//                swal("Somethind went wrong","Please try again","error");
//                document.getElementById("status").value = "";
//            }
            
            
        </script>

    
</body>
</html>