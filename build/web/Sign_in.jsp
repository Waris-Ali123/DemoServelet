<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign In page</title>
    <script type="text/javascript" >
        function validateEntries(){

            var name = document.getElementById("name").value;
            if(name=="" || name==null ){
                document.getElementById("errormsg").innerHTML = "<b> <span style=\"color:red\">Alert: </span> Please enter the name too</b>";
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
            background-image: linear-gradient(to bottom right, #33ccff 49%, #0091ff 100%);
            background-repeat: no-repeat;
            background-position: fixed;
            background-size: cover;
            width: 100%;
            height: 100vh;

        }
        #container1 {
            width: 30%;
            height: 50%;
            /* background-color:#ffffff; */
            background-color: rgba(255, 255, 255, 0.123);
            opacity: .9;
            transform: translate(100%,20%);
            box-shadow: 15px 15px 15px 15px #004eae;
            border-radius: 25px;
            padding: 10px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap:29px;
            padding: 30px 20px;
        }
        h1{
            text-align: center;
            color: black;
        }

        #form1{
            display: flex;
            flex-direction: column;
            gap:25px;
            align-items: center;
            /* justify-content: space-evenly; */
        }

        #inputParentContainer {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            gap: 25px;
            /* width: 60%; */
        }
        
        .inputContainer {
            /* width: 60%; */
            display: flex;
            justify-content: center;
            align-items: center;
            
            
            
        }
        
        #name {
            width: 100%;
            height: 30px;
            border-radius: 15px;
            padding: 5px;
            padding-left: 10px;
            font-size: 15px;
            /* text-align: center; */
            background-color: white;
            border: unset;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
            /* transform: translateX(5px); */
        }
        
        
        #name:focus{
            background-color: rgba(0, 0, 0, 0.085);
            color: Black;
            padding: 5px;
            
        }
        
        #password {
            width:100%;
            height: 30px;
            border-radius: 15px;
            padding: 5px;
            font-size: 15px;
            text-align:start;
            background-color: white;
            border: unset;
            font-family: Cambria, Cochin, Georgia, Times, 'Times New Roman', serif;
        }
        
        #password:focus{
            background-color: rgba(0, 0, 0, 0.085);
            color: Black;
        }
        /* #loginButton{

        } */

        /* input{
            padding-left: 10px;
        } */

        input::placeholder{
            color: black;
            text-align: left;
            transform: translateX(5px);
        }
        
        #loginButton {
            width: 75%;
            height: 40px;
            background-color:rgb(0, 90, 90);
            border-radius:25px;
            border:none;
            color:white;
            font-size: larger;
            font-family: Georgia;
            text-align: center;
            padding: 5px;
            transition: all 0.3s ease 0s;
            /* transform: translateX(110%); */

        }

        #loginButton:hover {
        background-color: #0c3343;
	    box-shadow: 0px 15px 20px #fff;
	    color: #fff;
	    transform: translateY(-7px);  
        }

        #createOne {
            text-decoration: none;
            font-weight: 600;
            transition:all .5s ease 0s;
        }

        #createOne:hover{
            /* color:#0c3343; */
            transform: translateY(-3px);
        }

        #container1 a{
            text-decoration: none;
        }
    </style>
</head>
<body>
    
    <input type="hidden" id="status" value="<%=request.getAttribute("status") %>"  >

    <div id="container1">
        <h1>LOGIN</h1>
        <form id="form1" action="login"  method="post" onsubmit="return validateEntries();">
            <div id="inputParentContainer">  
                
                <div class="inputContainer">
                    <input type="text" placeholder="Name" name="name" id="name">
                </div>
                <div class="inputContainer">
                    <input type="password" placeholder="Password" name="password" id="password">
                </div>
            </div>
            
            <button type="submit" id="loginButton">Sign In</button>
        </form>

        <a href="Sign_up.jsp">
            <div id="createOne">Create an account ?</div>
        </a>

        <span id="errormsg"></span>

    </div>
    
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link rel="stylesheet" href="alert/dist/sweetalert.css">
        
        <script type="text/javascript">
            
            var status = document.getElementById("status").value;
            if(status == "failed"){
//                swal("congrats","Account created successfully","success");
//                document.getElementById("status").value = "";
//            }
//            else{
                swal("Sorry!","Invalid Username or Password","error");
                document.getElementById("status").value = "";
            }
            
            
        </script>
        
    
</body>
</html>
