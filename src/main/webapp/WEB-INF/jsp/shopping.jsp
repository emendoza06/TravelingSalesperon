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
        background-image: url('/resources/images/ShoppingBackground.png');
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
        <h1 style="color: white"><b>Traveling SalesPerson</b></h1>
        <div class="w3-twothird w3-container">
            <p class="w3-border w3-padding-large w3-padding-32 w3-center">INSERT TSP FORMULA HERE</p>
            <p class="w3-border w3-padding-large w3-padding-64 w3-center">INSERT TSP MAP HERE</p>
        </div>
        <div class="w3-third w3-container">
            <h1 class="w3-text-teal" style="color: white"><b>Shopping Spree!</b>
                <audio controls>
                    <source src = "../../resources/audio/ShoppingAudio.mp4" type="audio/mpeg">Your browser does not support the audio element</audio>
                </audio>
            </h1>
            <p>It's a weekend with your friends at the mall and you're going on a shopping spree. Find the shortest route to visit every store before the mall closes!  </p>
        </div>


    </div>



    <!-- END MAIN -->
</div>


</body>
</html>

