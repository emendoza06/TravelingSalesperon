<%--
<%--
  Created by IntelliJ IDEA.
  User: Epharra
  Date: 5/6/2020
  Time: 1:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<title>W3.CSS Template</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<script
    language="javascript"
    type="text/javascript"
    src="https://cdn.jsdelivr.net/npm/p5@1.0.0/lib/p5.min.js"
  ></script>

  <script type="text/javascript" src="javascript/map2.js"></script>
<style>
    html,body,h1,h2,h3,h4,h5,h6 {font-family: "Roboto", sans-serif;}
    .w3-sidebar {
        z-index: 3;
        width: 250px;
        top: 43px;
        bottom: 0;
        height: inherit;
    }
    body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
    .menu {display: none}
</style>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top w3-hide-small">
    <div class="w3-bar w3-xlarge w3-black" id="myNavbar">
        <a href="/" class="w3-bar-item w3-button">HOME</a>
    </div>
</div>

<style>
    body{
        margin-top: -100px;
        background-image: url('/resources/images/MoonBackground.png');
        background-repeat: no-repeat;
        background-size: cover;
    }
    .w3-twothird.w3-container{
        padding-right: 20%;
        margin-right: -200px;
    }
    .w3-third.w3-container{
        padding-right: 10%;
    }
    .w3-row.w3-padding-64{
        margin-top: 10%;
    }
    p{
        font-family: Arial;
    }
</style>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px">

    <div class="w3-row w3-padding-64">
        <h1 class="tspheader" style="color: white"><b>Traveling SalesPerson</b></h1>
        <div class="w3-twothird w3-container">

            <style>

                h1{
                    text-align: center;
                }
                h1.tspheader{
                    font-size: 60px;
                    margin-right: 700px;
                }

                h1.w3-text-teal.storytitle{
                    font-size: 50px;
                }

                p{
                    font-size: 20px;
                }

                canvas{
                    padding-left: 0;
                    padding-right: 0;
                    margin-left: auto;
                    margin-right: 50%;
                    display: block;
                    width: 530px;
                    margin-bottom: 30px;
                }
            </style>

            <p class="w3-border w3-padding-large w3-padding-32 w3-center">INSERT TSP FORMULA HERE</p>

        </div>
        <div class="w3-third w3-container">
            <h1 class="w3-text-teal storytitle" style="color: black !important"><b>To the Moon and Back</b>
            <audio controls>
                <source src = "../../resources/audio/MoonAudio.mp4" type="audio/mpeg">Your browser does not support the audio element</audio>
            </audio>
            </h1>
            <p>You are a brave astronaut and you're ready for lift off to the Moon! There's so much to see along your journey. What's the shortest path to the Moon, across the stars, and back? </p>
        </div>




    </div>



    <!-- END MAIN -->
</div>


</body>
</html>

