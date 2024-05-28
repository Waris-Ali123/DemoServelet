<%
  if(session.getAttribute("uname")==null){
    response.sendRedirect("Sign_in.jsp");
    }  
    
%>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin: 0px;
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
        }

        body::-webkit-scrollbar {
                    display: none;
                }
                
          #welcomeHeading {  
            /*text-align:center;*/
            
            /*transform: translate(80px,8px);*/
            color:whitesmoke;
            font-weight: 650;
            font-size: 20px;
            /*text-transform: uppercase;*/
                }

          #header {
            display: flex;
            flex-wrap:wrap;
            align-items: center;
            column-gap: 100px;
            row-gap: 15px;
            width:100%;
            justify-content: space-between;
            padding-top: 15px;
            position:absolute;;
            top:0px;
            left:0px;   
        }

        .logo {
            height: 40px;
            margin-left: 15px;
        }
        
        #headerA{
          display: flex;
          flex-wrap: wrap;
          align-items: center;
          gap:40px; 
          padding-right: 15px;
        }

        #headerA a,#userCredential a {
           
            color: aliceblue;
            text-decoration: none;
            font-weight: 600;
            padding:20px;  
        }
        
        #headerA a:hover , #userCredential a:hover{
            border-style: none;
            border-color: rgb(0, 49, 49);
            background-color:white;
            border-radius: 10px;
            color: rgb(18, 71, 94);
        }
        
        #userCredential {
            display:flex;
            align-items: center;
            padding:10px;
            padding-right: 15px;
            gap:7px;
            width:max-content;
        }
        
        #userImage{
            border-radius: 50%;
            padding: 5px;
            /*background-size: cover;*/
        }
        
        #userImage:hover{
            /*border:1px solid white;*/
            padding: 4px;
            transform: scale(1.1);
        }
        


        /* img-container */
        #img-container {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100vh;
        }

        

        /* bgimage style */
        #bgimage {
            width: 100%;
            height: 100vh; 
            z-index: -1; 
            position: absolute;
            left:0px;
            top:0px;

        }

        /* taiba's content */
        #Taibacontent{
            background-color: rgba(0, 0, 0, 0.538);
            color:white;
            width: 750px;
            height: 150px;
            line-height: 25px;
            text-align: center;
            font-size: medium;
            border-radius: 15px;
            padding: 25px;
            display: flex;
            flex-direction: column;
            gap:15px;
           
            
        }

        #Taibacontent h1{
            line-height: 35px;
        }

        
        #container1{
            color:white ;
            width: 100%;
            /* height: 500px; */
            display: flex;
            flex-wrap: wrap-reverse;
            gap: 20px;
            font-family: Nunito,sans-serif;
            /* letter-spacing : 0.162px; */
            font-weight: 450;
            justify-content: center;
            /* transform: translateX(25%); */
            margin-top: 10px;
            /* align-content: center; */
            margin-bottom: 35PX;
            /* padding-left: 25px; */
            /* padding-right: 25px; */
        }  
        
        .HostelVedio{
            border-radius: 15px;
            border:#fff ;
            /* display: flex; */
        }

        
        #normal_container {
            font-family: 'Times New Roman', Times, serif;
            text-align: justify ;
            color: black;
            display: flex;
            flex-direction: column;
            flex-wrap: wrap;
            justify-content:flex-start;
            gap: 15px;
            width:600px;
            padding: 10px;
            /* height: ; */
            
        }
        
        #heading_About_Us {
            color:rgb(18, 84, 0);
            font-family:Georgia;
        }
        
        
        #normal_container p{
            font-size: 17.33px;
            line-height: 30px;
            font-family:serif;
            /* font-weight:normal; */
            text-decoration-thickness: auto;
        }

        #aRead {
            background-color: gold;
            font-size: large;
            border-radius: 5px;
            border: none;
            text-decoration: none;
            color: rgb(0, 42, 0);
            width: max-content;
            text-align: center;
            font-weight: 600;
            transition: all 0.3s ease 0s;
            padding: 10px;

        }

        /* #aRead:hover {
        } */
        
        #aRead:hover {
            background-color: #0c3343;
            /* background-color: greenyellow; */
            box-shadow: 0 0 10px greenyellow;
            color: greenyellow;
            /* color: #fff; */
            transform: translateY(-4px);
            /* box-shadow: 0px 15px 20px #fff; */
        }

        /* Our HallMarks starts */
        
        #container2 {
            width: 100%;
            /* height: 600px; */
            background-color: rgba(211, 211, 211, 0.848);
            display: flex;
            gap:20px;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-image: url("https://visme.co/blog/wp-content/uploads/2017/07/50-Beautiful-and-Minimalist-Presentation-Backgrounds-031.jpg");
            /* background-image: url("https://img.freepik.com/free-photo/wavy-black-white-background_23-2150530980.jpg"); */
            padding-top: 45px;
            padding-bottom: 55px;
        }

        
        .parallax {
            overflow: hidden;
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }
        
        #heading2 {
            text-align:center;
            color:darkgreen;
            font-weight: 650;
            font-size: 30px;
        }
        
        #DirectSubContainer1{
            display: flex;
            flex-wrap: wrap;
            row-gap: 25px;
            column-gap: 15px;
            align-items: center;
            justify-content: center;
        }
        
        #DirectSubContainer2{
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            justify-content: center;
        }
        
        .subcontainer {
            color: darkgreen;
            background-color: #fff;
            border-radius: 50%;
            width: 150px;
            height: 150px;
            display: flex;
            justify-content: center;
            align-items: center; 
            transition: transform .3s ease;
        }
        
        .subcontainer ul {
            display: flex;
        }
        
        .subcontainer ul li {
            list-style-type: none;
            font-weight: 600;
            font-size: 17.33px;
            text-align: center;
            transform: translateX(-20px);
        }
        
        .subcontainer:hover {
            transform: scale(1.1);
            background-color: darkgreen;
            color:#fff;
        }
        
        /* container3  */
        #container3 {
            background-color: rgba(0, 0, 0, 0.9108);
            color:white;
            /*height: 450px;*/
            width: 100%;
            font-size: medium;
            line-height: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            gap: 20px;
            padding-top: 55px;
            padding-bottom: 35px;
/*            padding-left: 25px;
            padding-right: 25px;*/
            
        }

        #container3 p{
            margin-left: 25px;
            margin-right: 25px;
            width: 100%;
            font-weight: 400;
        }

        #container4 {
    
            width: 100%;
            /* height: 600px; */
            background-color: rgba(211, 211, 211, 0.848);
            display: flex;
            gap:20px;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-image: url("https://visme.co/blog/wp-content/uploads/2017/07/50-Beautiful-and-Minimalist-Presentation-Backgrounds-031.jpg");
            /* background-image: url("https://img.freepik.com/free-photo/wavy-black-white-background_23-2150530980.jpg"); */
            padding-top: 45px;
            padding-bottom: 55px;
        }
        
        
        /* footer starts here */
        #footercontainer {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
             justify-content: space-around;
             width:100%;
             /* height: 400px; Set the height of the container */
             border: 2px solid darkcyan; /* Add a border for better visibility */
             background-color: black;
             padding-top: 35px;
          
            }

            
            #footerDirectSubContainer1 {
                width: 400px;
                padding-left: 25px;
                padding-right: 25px;
                height: 350px;  
                display: flex;
                flex-direction: column;
                gap:15px;  

            }
            
            #footerLogo {
                display: flex;
                gap: 15px;
            }

            #footerDirectSubContainer2 {
                display: flex;
                /* width : 700px; */
                flex-wrap: wrap;
                column-gap: 25px;
                padding-left: 25px;
                /* align-items: center; */
                justify-content: center;
                padding-right: 25px;
            }
            
            .InsidefooterSubContainer2{
                /* width:inherit; */
                height: 350px;
                display: flex;
                flex-direction: column;
                gap: 20px;
            }
            
            .InsidefooterSubContainer2 a{
                text-decoration: none;
                color: white;
                display: flex;
                flex-direction: column;
                justify-content: last baseline;
                /* gap: 20PX;  */
            }
            
            .InsidefooterSubContainer2 a:hover{
                text-decoration: underline;
                color: aqua;
            }

            .InsidefooterSubContainer2 span {
                text-align: justify;
                /* line-height:; */
                /* width:fit-content; */
            }
            .footerPara {
                    font-size: medium;
                    font-family:Georgia;
                    text-align: justify;
                    word-spacing: 5px;
                    line-height: 2;
                    color: rgb(44, 44, 44);
            
                }
       
      
    </style>
</head>
<body>
    
    
    
    
    

    <div id="header">
        <a href="Institute.htm">  <img class="logo" src="http://taibaonline.in/wp-content/uploads/2023/10/white-logo.png" alt="TaibaLogo"  > <img></a>
        <div id="headerA">
            <a href="#" >Home</a>
            <a href="About_Us.html">About Us</a>
            <a href="Institute.html"> Institutes </a>
            <a href="Donate.html">Donate Now</a> 
        </div>
        
        <div id="userCredential">
        <img id="userImage" src="GetUserImage?id=<%=session.getAttribute("id")%>" alt="userimage" width="50px" height="50px">
        <div id="welcomeHeading" > Welcome <%=session.getAttribute("uname")%> </div>
        <a href="logout" > Logout </a>
        </div>

        
    </div>
    
    <div id="img-container" class="parallax">
        <img id="bgimage" src="https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm0zMDktYWV3LTAxM18xXzEuanBn.jpg" alt="bg Image" >
        <div id="Taibacontent" >
            <h1>TAIBA COLLEGE OF INTEGRATED STUDIES</h1>
            <p>TCIS is a residential educational program projected endowing with both Islamic and modern education beneath an umbrella. This institute, with an integrated curriculum, intends to produce a dedicated cadre of a vibrant intelligentsia of scholars and propagators, which is spiritually holistic and professionally competent and could lead the society from the frontline.</p>
        </div>
   </div>
   



   

<!-- container1 startss -->

    <div id='container1'   >
        <img class="HostelVedio" src="http://www.faheemhasan.com/taiba/wp-content/uploads/2016/10/video-image.jpg" alt="taiba video image" width="370px" height="450px" >
        <div id="normal_container">
            <h1 id="heading_About_Us"> About us </h1>
            <p>
                Taiba College of Integrated Studies is an educational, socio-cultural, charitable and none-political institution established under the patronage of Jamia Markazu Ssaqafathi Ssunniya- Calicut- Kerala, aiming at providing quality education uniting both material and spiritual concepts to mold a cadre of educationally qualified, spiritually motivated and socially committed leaders ready take up the challenges of today and tomorrow in the field of social reformation.
                <br>
                It principally concentrates on uplifting and empowering the deprived sections of the society with education and training along with the moral values and culture. <br>
            </p> 
        <a id="aRead" href="About_Us.html" class>Read more</a>
      
        </div>
    </div>
<!-- container1 ends -->

    <div id='container2' class="parallax">
        <h2 id="heading2">Our Hallmarks</h2>
        <div id="DirectSubContainer1">

            <span class="subcontainer" >
                <ul>
                    <li>Mehfile Noorani</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Brain Gym</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Practical Da'awa</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Guest Lectures</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Practical da'awa</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                   <li>Guest Lectures</li>
                </ul> 
            </span>
    
    </div>

    <div id="DirectSubContainer2">

            <span class="subcontainer" >
                <UL>
                 <li>Weekly Literary Assembly</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Physical Education</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Student's Clubs</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Socail And charitable programs</li>
                </ul> 
            </span>
            <span class="subcontainer">
                <ul>
                    <li>Study trips</li>
                </ul> 
            </span>
            <span class="subcontainer" >
                <ul>
                    <li>Coaching for moral development</li>
                </ul> 
            </span>
    
        </div>
    </div>



<div id="container3" >
        <h1>Director Speaks</h1>
        <p>
            Welcome to Taiba Group of Institutions. A nongovernmental, socio-cultural and charitable institution founded in 2013 aiming at producing highly talented professionals and scholars molded with spiritual values.Our goal is to create frontline leaders to guide the society towards the ethics and humanity providing both modern and moral education beneath one umbrella besides hostel, food, and dress to them at no cost as well as we run an individual hostel for orphan students with the entire facilities. <br> <br>
            The helping hands of well wishers from India and abroad helped us to launch and to run this institute and we anticipate their cooperation and guidance in future as well. May Allah give best to us for our good deeds and include us among His beloved servants – Ameen <br> <br>
        </p>
            <h2>Aboobacker Sidheeque Nurani - Director Taiba College of Integrated Studies.</h2>
    </div>


<!--    <div>
        <c:forEach var="imageId" items="${imageIds}">
            <img src="Addimage?id=${imageId}" alt="Image ${imageId}" style="width:200px;height:auto;"/>
        </c:forEach>
    </div>-->

    <div id='container4' class="parallax">
        <h2 id="heading2">Our Hallmarks</h2>
        <div id="DirectSubContainer1">
    
            <span class="subcontainer">
                <ul>
                    <li>Campus Masjid</li>
                </ul> 
        </span>
        <span class="subcontainer" >
            <ul>
            <li>Audio Visual Room</li>
        </ul> 
    </span>
        <span class="subcontainer" >
           <ul>
               <li>Hygienic Mess</li>
            </ul> 
        </span>
        <span class="subcontainer" >
            <ul>
                <li>Well-Settled Office</li>
            </ul> 
        </span>
        <span class="subcontainer">
           <ul>
            <li >Spacious Class Rooms</li>
           </ul> 
        </span>
        <span class="subcontainer">
            <ul>
            <li>Well Equipped Computer Lab</li>
        </ul> 
    </span>
    
    </div>
    
    <div id="DirectSubContainer2" >
    
            <span class="subcontainer">
                <ul>
                    <li >Well Furnished Dormitory</li>
                </ul> 
        </span>
        <span class="subcontainer">
            <ul>
            <li >Full Fledged Building With Hostel</li>
            </ul> 
    </span>
        <span class="subcontainer">
           <ul>
               <li >Full Fledged Library</li>
            </ul> 
        </span>
        <span class="subcontainer">
            <ul>
                <li>Concert Hall</li>
            </ul> 
        </span>
        <span class="subcontainer">
           <ul>
            <li >Ample Corridor</li>
           </ul> 
        </span>
        <span class="subcontainer">
            <ul>
            <li>Student's Activities</li>
            </ul> 
    </span>
    
    </div>
    </div>

<!--       
container3 starts i.e. footer  -->
<div  id="footercontainer">
    <div id="footerDirectSubContainer1" >   
        <div id="footerLogo">
            <img src="http://taibaonline.in/wp-content/uploads/2023/10/white-logo.png" alt="Taiba logo" style="width: 100px;">
            <img src="http://taibaonline.in/wp-content/uploads/2023/10/nadi-logo.png" alt="students Union logo" style="width: 80px;margin-left: 10px;">
        </div>
        <div class="footerPara" style="color:aliceblue;margin-top: 20px;font-size: large;">
            A unique combination of modern secular education and moral Islamic learning to bridge the gap between generations and create tomorrow's leaders.
        </div>
    </div>

    <div id="footerDirectSubContainer2" >

        <div class="InsidefooterSubContainer2" style="color:aqua;font-size: large;">
            <span> OUR LINKS </span>
            <span>
                <a  href="index.htm" >Home</a>  <br>
                <a href="About_Us.htm"> About Us</a> <br> 
                <a href="Institute.htm"> Institutes</a> <br> 
                <a href="Addimage.jsp">Add Photos</a>  <br> 
                <a href="DisplayImages.jsp">Gallery</a><br> 
                <a href="TaibaOnline/ Contact_us">Contact us</a>
            </span>
            
        </div>
        
        <div class="InsidefooterSubContainer2" style="color:aqua;font-size: large ;">
            <span> OUR DOWNLOADS  </span>
            <span>
                <a  href="TaibaOnline/TDC_Introduction" >TDC Introduction</a>   <br>
                <a href="TaibaOnline/ Taiba College Brochure">Taiba College Brochure</a> 
            </span>
        </div>
        
        <div class="InsidefooterSubContainer2"  style="color:white;font-size: large;">
            <span style="color:aqua;">CONTACT INFO</span> 
            <span style="line-height: 30px;display: flex;">
                9644006854, 8889995739 <BR> tecindore@gmail.com <BR> Taiba Edu Complex 61/62 Asha Palace, Khajrana Indore M.P. 452016
            </span>
           
        </div>
    </div>

</div>

</body>
</html>
