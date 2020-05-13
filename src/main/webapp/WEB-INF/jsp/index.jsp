<%--
  Created by IntelliJ IDEA.
  User: Epharra
  Date: 5/5/2020
  Time: 9:46 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<title>Traveling Salesperson</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-black.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Amatic+SC">
<style>
    body, html {height: 100%}
    body,h1,h2,h3,h4,h5,h6 {font-family: "Amatic SC", sans-serif}
    .menu {display: none}
    .bgimg {
        background-repeat: no-repeat;
        background-size: auto;
        background-image: url('/resources/images/mainMenuBanner.png');
        min-height: 96%;
        margin-left: 150px;
    }
</style>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top w3-hide-small">
    <div class="w3-bar w3-xlarge w3-black" id="myNavbar">
        <a href="#" class="w3-bar-item w3-button">HOME</a>
        <a href="#menu" class="w3-bar-item w3-button">START</a>
        <a href="#about" class="w3-bar-item w3-button">ABOUT</a>
        <a href="#contact" class="w3-bar-item w3-button">CONTACT</a>
    </div>
</div>

<!-- Header with image -->
<header class="bgimg w3-display-container" id="home" style="margin-top: 40px">

    <div class="w3-display-bottomleft w3-padding">
        <span class="w3-tag w3-xlarge">Created by CAASE Tech</span>
    </div>
    <style>
        .w3-display-middle.w3-center{
            padding-top: 400px;
        }
    </style>
    <div class="w3-display-middle w3-center">

        <p><a href="#menu" class="w3-button w3-xxlarge w3-black">Begin</a></p>
    </div>
</header>

<!-- Menu Container -->
<div class="w3-container w3-black w3-padding-64 w3-xxlarge" id="menu" style="background-image: url('/resources/images/MenuScroll.png'); filter: grayscale(22%)">
    <div class="w3-content">

        <h1 class="w3-center w3-jumbo" style="margin-bottom:64px; color:black">GRADE LEVEL</h1>
        <div class="w3-row w3-center w3-border w3-border-dark-grey" style="background-color: grey;">
            <a href="javascript:void(0)" onclick="openMenu(event, 'Pizza');" id="myLink">
                <div class="w3-col s4 tablink w3-padding-large w3-hover-red" style="color: black; background-color:pink">K-2</div>
            </a>
            <a href="javascript:void(0)" onclick="openMenu(event, 'Pasta');">
                <div class="w3-col s4 tablink w3-padding-large w3-hover-red" style="color:black; background-color:pink">3-5</div>
            </a>
            <a href="javascript:void(0)" onclick="openMenu(event, 'Starter');">
                <div class="w3-col s4 tablink w3-padding-large w3-hover-red" style="color:black; background-color:pink">6-8</div>
            </a>
        </div>

        <style>
            hr{
                border-top: 3px solid darkgoldenrod;
            }
        </style>

        <div id="Pizza" class="w3-container menu w3-padding-32 w3-white">
            <h1><b>Go to the Zoo</b> <a href="/k2Zoo"><span class="w3-right w3-tag w3-dark-grey w3-round w3-hover-red">Start</span></a></h1>
            <p class="w3-text-grey">Plan a trip to the Zoo and visit every animal on your path!</p>
            <hr>

            <h1><b>To the Moon and back</b> <a href="/k2Moon"><span class="w3-right w3-tag w3-dark-grey w3-round w3-hover-red">Start</span></a> </h1>
            <p class="w3-text-grey">Explore all the stars on your trip throughout the galaxy</p>
            <hr>

        </div>

        <div id="Pasta" class="w3-container menu w3-padding-32 w3-white">
            <h1><b>Shopping Spree!</b> <span class="w3-tag w3-grey w3-round">Popular</span><a href="/shopping"> <span class="w3-right w3-tag w3-dark-grey w3-round w3-hover-red">Start</span></a></h1>
            <p class="w3-text-grey">It's time to shop til you drop and visit every store along the way</p>
            <hr>

            <h1><b>Trick or Treat</b> <a href="/trickorTreat"><span class="w3-right w3-tag w3-dark-grey w3-round w3-hover-red">Start</span></a></h1>
            <p class="w3-text-grey">Can you get all the candy in your neighborhood?</p>
            <hr>

        </div>


        <div id="Starter" class="w3-container menu w3-padding-32 w3-white">
            <h1><b>Lost Phone</b> <span class="w3-tag w3-grey w3-round">New!</span><a href="/phone"><span class="w3-right w3-tag w3-dark-grey w3-round w3-hover-red">Start</span></a></h1>
            <p class="w3-text-grey">Uh-oh, you lost your phone. Retrace your steps by visiting all the places you've been</p>
            <hr>

            <h1><b>Theme Park</b> <a href="/themePark"><span class="w3-right w3-tag w3-dark-grey w3-round w3-hover-red">Start</span></a></h1>
            <p class="w3-text-grey">It's your class trip to the amusement park. Can you ride all the rides? </p>
            <hr>

        </div><br>

    </div>
</div>

<!-- About Container -->
<div class="w3-container w3-padding-64 w3-red w3-grayscale w3-xlarge" id="about">
    <div class="w3-content">
        <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">About</h1>
        <p style="font-family: Arial; font-size: 18px">The traveling salesman problem is a common exercise in computer science which presents a scenario where there exists a list of cities, and given the distance between each pair of cities, a traveler must find the shortest possible path that allows them to visit each city once and return to the starting point. The underlying idea of finding the shortest possible route between many nodes can be applied to many other situations besides cities. As well as transportation, similar ideas are relevant to circuit design where there are cost and speed advantages to using as little material as possible. There are other scientific applications for this including chemistry and genetics, and the problem itself is often used as an example for discussing NP-hard problems.
        </p>

        <!-- Team Container -->
        <!-- Grid -->
        <div class="w3-row-padding">
        <div class="w3-center w3-padding-64">
            <p style="font-size: 30px">We are proud to help you learn.</p>
            <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16" style="font-size: 28px">Who We Are</span>

        </div>


        <!--   TEAM CARDS          -->
            <style>
                img{
                    height: 300px;
                }
                p.teamInfo{
                    font-family: sans-serif;
                    font-size: 16px;
                }
                h3.teamName{
                    font-size: 28px;
                }
                img{
                    filter: saturate(3);
                }
            </style>
            <div class="w3-row-padding">
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <img src="../../resources/images/EpharraTeam.jpg" alt="Epharra Mendoza" style="width:100%">
                    <h3 class="teamName">Epharra Mendoza</h3>
                    <p class="w3-opacity teamRole">Team Lead</p>
                    <p class="teamInfo">I'm Epharra, an undergraduate at the University of Missouri-St. Louis. I am majoring in Computer Science with a minor in Mathematics. I knew programming was for me when I realized that I could combine my creativity with my love for STEM. My favorite part about building this website was knowing that it could inspire our next generation of girls in STEM.</p>
                </div>
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <img src="../../resources/images/SafiTeam.jpg" alt="Safiullah Khan" style="width:100%">
                    <h3 class="teamName">Safiullah Khan</h3>
                    <p class="w3-opacity teamRole">Software Developer</p>
                    <p class="teamInfo">I'm Safi, a senior undergraduate student from the University of Missouri- Saint Louis. During this project, I learned about advanced statistics, and used HTML/CSS. I chose computer science as a subject because I wanted to learn how to make video games, of course. I was excited to know more about it, how this application is created, so I took Computer Science as a subject in Class 11th. But I couldn't get a well-derived answer and I wanted to understand this all. Then, I choose computer science as a major in college.</p>
                </div>
                <div class="w3-col l3 m6 w3-margin-bottom">
                    <img src="../../resources/images/AndrewR.jpg" alt="Mike" style="width:100%">
                    <h3 class="teamName">Andrew Riebow</h3>
                    <p class="w3-opacity teamRole">Software Tester</p>
                    <p class="teamInfo">I'm 22 years old, and I am a senior computer science student. I like hiking, working on cars, video games, and doing programming projects at home.</p>
                </div>
                <div class="w3-col l3 m6 w3-margin-bottom">
<%--                    <img src="../../resources/images/SafiTeam.jpg" alt="Dan" style="width:100%">--%>
                    <h3 class="teamName">Cooper Epstein</h3>
                    <p class="w3-opacity teamRole">Technical Writer</p>
<%--                    <p class="teamInfo">Phasellus eget enim eu lectus faucibus vestibulum. Suspendisse sodales pellentesque elementum.</p>--%>
                </div>
            </div>








        </div>
</div>
</div>



<!-- Contact -->
<div class="w3-container w3-padding-64 w3-blue-grey w3-grayscale-min w3-xlarge" id="contact">
    <div class="w3-content">
        <h1 class="w3-center w3-jumbo" style="margin-bottom:64px">Contact</h1>
        <p></p>
        <p class="w3-xxlarge"><strong>We value your feedback.</strong> We want to offer the best learning experience possible, and with your help, we can! </p>
        <form action="/action_page.php" target="_blank">
            <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Name" required name="Name"></p>
            <p><input class="w3-input w3-padding-16 w3-border" type="number" placeholder="How many people" required name="People"></p>
            <p><input class="w3-input w3-padding-16 w3-border" type="datetime-local" placeholder="Date and time" required name="date" value="2017-11-16T20:00"></p>
            <p><input class="w3-input w3-padding-16 w3-border" type="text" placeholder="Message \ Special requirements" required name="Message"></p>
            <p><button class="w3-button w3-light-grey w3-block" type="submit">SEND MESSAGE</button></p>
        </form>
    </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-48 w3-xxlarge">
    <p>Powered by CAASE Tech </p>
</footer>

<script>
    // Tabbed Menu
    function openMenu(evt, menuName) {
        var i, x, tablinks;
        x = document.getElementsByClassName("menu");
        for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
        }
        tablinks = document.getElementsByClassName("tablink");
        for (i = 0; i < x.length; i++) {
            tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
        }
        document.getElementById(menuName).style.display = "block";
        evt.currentTarget.firstElementChild.className += " w3-red";
    }
    document.getElementById("myLink").click();
</script>

</body>
</html>
