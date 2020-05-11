<%--
  Created by IntelliJ IDEA.
  User: Epharra
  Date: 5/6/2020
  Time: 1:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<title>Shopping Spree</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
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
<script
        language="javascript"
        type="text/javascript"
        src="https://cdn.jsdelivr.net/npm/p5@1.0.0/lib/p5.min.js"
></script>

<script type="text/javascript" src="/javascript/3-5Script.js"></script>
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
        background-size: contain;
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
    h4{
        font-size: 40px;
        text-align: inherit;
        color: red;
    }
</style>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible -->
<div class="w3-main" style="margin-left:250px">

    <div class="w3-row w3-padding-64">
        <h1><b>Traveling SalesPerson</b></h1>
        <div class="w3-twothird w3-container">

            <div class="progress-container">
                <ul>
                    <li></li>
                    <li></li>
                    <%--                    <li></li>--%>
                    <%--                    <li></li>--%>
                    <%--                    <li></li>--%>
                </ul>
                <div class="progress-bar"></div>
            </div>

            <button class="button" id="start">Check</button>
            <button class="button" id="reset">Reset</button>



            <style>

                .progress-container {
                    z-index: -99;
                    position: relative;
                    margin: 50px auto 50px;
                    padding: 4px 0 0;
                    width: 600px;
                    height: 6px;
                    background: #444;
                    -moz-box-shadow: inset 0 0 2px #666;
                    -webkit-box-shadow: inset 0 0 2px #666;
                    box-shadow: inset 0 0 2px #666;
                }
                .progress-container ul li {
                    position: absolute;
                    top: -1px;
                    left: 0;
                    margin: 0;
                    padding: 0;
                    display: inline-table;
                    height: 10px;
                    width: 10px;
                    background: #14bfcc;
                    border-radius: 50%;
                }
                .progress-container ul li:nth-child(2) {
                    margin-left: 190px;
                }
                /*.progress-container ul li:nth-child(3) {*/
                /*    margin-left: 400px;*/
                /*}*/
                /*.progress-container ul li:nth-child(4) {*/
                /*    margin-left: 600px;*/
                /*}*/
                .progress-container ul li:last-child {
                    margin-left: 600px;
                }
                .progress-container ul li:before {
                    z-index: -99;
                    position: absolute;
                    top: -5px;
                    left: -5px;
                    content: '';
                    height: 20px;
                    width: 20px;
                    background: #444;
                    border-radius: 50%;
                }
                .progress-container .progress-bar {
                    height: 2px;
                    width: 0%;
                    background: #09a6b2;
                    -webkit-transition: width 1s ease-in-out;
                    -moz-transition: width 1s ease-in-out;
                    -o-transition: width 1s ease-in-out;
                    transition: width 1s ease-in-out;
                }
                .button {
                    margin: 20px auto;
                    padding: 10px;
                    width: 150px;
                    font-family: Helvetica, Arial, sans-serif;
                    font-size: 12px;
                    text-transform: uppercase;
                    text-decoration: none;
                    color: #fff;
                    background: #14bfcc;
                    text-align: center;
                    border: 1px solid #09a6b2;
                    cursor: pointer;
                }
                #reset {
                    background: #ff4c4c;
                    border-color: #9e2626;
                }

            </style>

            <!--Canvas div -->
            <div
                    id="sketch-holder1" class="w3-border w3-padding-large w3-padding-64 w3-center"
            >

            </div>

            <h4 id=""></h4>
        </div>
        <div class="w3-third w3-container">
            <h1 class="w3-text-teal" style="color: white"><b>Shopping Spree!</b>
                <audio controls>
                    <source src = "../../resources/audio/ShoppingAudio.mp4" type="audio/mpeg">Your browser does not support the audio element</audio>
                </audio>
            </h1>
            <p>It's a weekend with your friends at the mall and you're going on a shopping spree. Find the shortest route to visit every store before the mall closes!  </p>
            <p id="startingnode"></p>
            <style>
                p#startingnode{
                    color: coral;
                    font-size: 25px;
                }
                p{
                    font-size: 28px;
                }
            </style>
        </div>


    </div>



    <!-- END MAIN -->
</div>


</body>
</html>
