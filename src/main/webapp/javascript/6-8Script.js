var cities = [];
var points = [];
var usersRoute = [];

var totalCities = 5;

var order = [];

var totalPermutations;
var count = 0;

var recordDistance;
var bestEver;
var recordDistanceLong;
var worstEver;

var stillLooping = true;

var shortestRoute = [];
var shortestRouteTotalDistance;
var longestRoute = [];
var longestRouteTotalDistance;


var overshotAnswer = false;
var longestRouteDrawnFlag = false;
var shortestRouteDrawnFlag = false;



function setup() {
    var canvas = createCanvas(600, 229);
    canvas.parent("sketch-holder1");
    for (var i = 0; i < totalCities; i++) {
        var v = createVector(random(width), random(height / 2));
        cities[i] = v;
        order[i] = i;

        var x = cities[i].x;
        var y = cities[i].y;
        var r = 15;
        var label = String.fromCharCode(65 + i);
        point = new Point(x, y, r, label);
        points.push(point);
        // usersRoute.push(point);
    }

    // saveShortestRoute();

    //distance shortest
    var d = calcDistance(cities, order);
    recordDistance = d;
    bestEver = order.slice();

    //distance longest
    var dlong = calcDistance(cities, order);
    recordDistanceLong = d;
    worstEver = order.slice();

    totalPermutations = factorial(totalCities);
    console.log("Total permutations is " + totalPermutations);
}

function draw() {
    if (stillLooping) {
        background(0);
        frameRate(5);
        fill(255);
        for (var p = 0; p < points.length; p++) {
            points[p].show();
        }

        for (var i = 0; i < cities.length; i++) {
            ellipse(cities[i].x, cities[i].y, 8, 8);
        }

        stroke(255, 0, 255);
        strokeWeight(4);
        noFill();
        // beginShape();
        //Order of visited points, put the best order in shortestRoute array
        for (var i = 0; i < order.length; i++) {
            var n = bestEver[i];
            shortestRoute[i] = points[n];
            vertex(cities[n].x, cities[n].y);
        }
        //Order of visited points, put the worst order in longestRoute array
        // for(var i = 0; i < order.length; i++){
        //     var n = worstEver[i];
        //     longestRoute[i] = points[n];
        // }
        // endShape();



        translate(0, height / 2);
        stroke(255);
        strokeWeight(1);
        noFill();

        // getRoutePossibility(order);
         // beginShape();

        //Put a new order of points in route possibilities
        // for (var pos = 0; pos < order.length; pos++) {
        //   var n = order[pos];
        //   routePossibility[pos] = points[n];
        // }
        // routesToGraph.push(routePossibility);
        //
        // console.log("Amount of route possibilities: " + routesToGraph.length);
        // routesToGraph.forEach((routes)=>{
        //     console.log("New route " + routesToGraph[routes]);
        //     routes.forEach((possibility) =>{
        //         console.log(" " + possibility.label);
        //     });
        // });
        // endShape();


        //Shortest route calculation
        var d = calcDistance(cities, order);
        if (d < recordDistance) {
            recordDistance = d;
            bestEver = order.slice();
        }

        // //For bar graph, longest route calculation
        // var dlong = calcDistance(cities, order);
        // if (dlong > recordDistanceLong) {
        //     recordDistanceLong = dlong;
        //     worstEver = order.slice();
        // }

        textSize(32);
        // var s = '';
        // for (var i = 0; i < order.length; i++) {
        //   s += order[i];
        // }
        fill(255);
        var percent = 100 * (count / totalPermutations);
        text(nf(percent, 0, 2) + "% completed", 20, height / 2 - 50);

        nextOrder();
    }



    /*-----------After Animation Runs (User Interaction)-----------------------*/

    else {
        shortestRouteTotalDistance = 0;
        for(var acc = 0; acc < shortestRoute.length -1; acc++){
            shortestRouteTotalDistance += dist(shortestRoute[acc].x, shortestRoute[acc].y, shortestRoute[acc+1].x, shortestRoute[acc+1].y);
        }
        console.log("Shortest route total distance  " + shortestRouteTotalDistance);
        $('#startingnode').html("Draw the shortest and longest routes starting and ending on point  " + shortestRoute[0].label);
        for(var s = 0; s < shortestRoute.length; s++){
            console.log("Best route " + shortestRoute[s].label);
        }

        buildLongestRoute();

            if(longestRouteDrawnFlag === false && shortestRouteDrawnFlag === false) {
                TESTER = document.getElementById('bar-graph');
                var data = [
                    {
                        x: ['shortest route', 'longest route'],
                        y: [shortestRouteTotalDistance, longestRouteTotalDistance],
                        type: 'bar',
                        marker: {
                            color: ['blue', 'blue']
                        }
                    }
                ];

                Plotly.newPlot(TESTER, data);
            }


        if(longestRouteDrawnFlag === true && shortestRouteDrawnFlag === false) {
            TESTER = document.getElementById('bar-graph');
            var data = [
                {
                    x: ['shortest route', 'longest route'],
                    y: [shortestRouteTotalDistance, longestRouteTotalDistance],
                    type: 'bar',
                    marker: {
                        color: ['blue', 'red']
                    }
                }
            ];

            Plotly.newPlot(TESTER, data);
        }


        if(longestRouteDrawnFlag === false && shortestRouteDrawnFlag === true) {
            TESTER = document.getElementById('bar-graph');
            var data = [
                {
                    x: ['shortest route', 'longest route'],
                    y: [shortestRouteTotalDistance, longestRouteTotalDistance],
                    type: 'bar',
                    marker: {
                        color: ['red', 'blue']
                    }
                }
            ];

            Plotly.newPlot(TESTER, data);
        }

        if(longestRouteDrawnFlag === true && shortestRouteDrawnFlag === true) {
            TESTER = document.getElementById('bar-graph');
            var data = [
                {
                    x: ['shortest route', 'longest route'],
                    y: [shortestRouteTotalDistance, longestRouteTotalDistance],
                    type: 'bar',
                    marker: {
                        color: ['red', 'red']
                    }
                }
            ];

            Plotly.newPlot(TESTER, data);
        }





        background(0);
        fill(255);
        for (var p = 0; p < points.length; p++) {
            points[p].show();
        }
        stroke(255, 0, 255);
        strokeWeight(4);
        noFill();
        beginShape();


        for (var u = 0; u < usersRoute.length; u++) {
            vertex(usersRoute[u].x, usersRoute[u].y);
        }
        endShape();
        //If all points in route has been clicked
        if(usersRoute.length >= 6){
            console.log("In  under 6 function check. Array length is " + usersRoute.length);
            var userRouteFlag = false;

            // usersRoute = [];
            // noStroke();
            //Check if route path was overshot or undershot
            var user_sum = 0;
            var answer_sum = 0;
            //Find the total route distance that user drew. Find total route distance answer.
            usersRoute.pop();
            for(var acc = 0; acc < usersRoute.length -1; acc++){
                user_sum += dist(usersRoute[acc].x, usersRoute[acc].y, usersRoute[acc +1].x, usersRoute[acc+1].y);
                answer_sum += dist(shortestRoute[acc].x, shortestRoute[acc].y, shortestRoute[acc+1].x, shortestRoute[acc+1].y);
            }

            console.log("User sum is " + user_sum);
            console.log("Answer sum is " + answer_sum);

            if(user_sum === longestRouteTotalDistance){
                longestRouteDrawnFlag = true;
                console.log("Longest Drawn");
            }
            if(user_sum === shortestRouteTotalDistance){
               shortestRouteDrawnFlag = true;
               console.log("Shortest Drawn");
            }

            console.log("Exceeded lines to make" );
            // if(longestRouteDrawnFlag === true){
            //     console.log("Longest route drawn ");
            //     for(var sh = 0; sh < usersRoute.length; sh++) {
            //         if(usersRoute[sh] !== longestRoute[sh]){
            //             userRouteFlag = true;
            //         }
            //     }
            // }
            // if(shortestRouteDrawnFlag === true) {
            //     console.log("Shortest route drawn");
            //     for (var sh = 0; sh < usersRoute.length; sh++) {
            //         if (usersRoute[sh] !== shortestRoute[sh]) {
            //             console.log("Try Again");
            //             console.log("You picked " + usersRoute[sh].label + " but the right answer is " + shortestRoute[sh].label);
            //             userRouteFlag = true;
            //         }
            //     }
            // }


            if(userRouteFlag === true){
                console.log("User flag outside loop is " + userRouteFlag);
            }
            else if(longestRouteDrawnFlag === true && shortestRouteDrawnFlag === true){
                window.setTimeout( function(){
                    window.location = "/reward";
                }, 950 );
            }
        }

    }
}



function swap(a, i, j) {
    var temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}

function calcDistance(points, order) {
    var sum = 0;
    for (var i = 0; i < order.length - 1; i++) {
        var cityAIndex = order[i];
        var cityA = points[cityAIndex];
        var cityBIndex = order[i + 1];
        var cityB = points[cityBIndex];
        var d = dist(cityA.x, cityA.y, cityB.x, cityB.y);
        sum += d;
    }
    return sum;
}

// This is my lexical order algorithm

function nextOrder() {
    count++;

    // STEP 1 of the algorithm
    // https://www.quora.com/How-would-you-explain-an-algorithm-that-generates-permutations-using-lexicographic-ordering
    var largestI = -1;
    for (var i = 0; i < order.length - 1; i++) {
        if (order[i] < order[i + 1]) {
            largestI = i;
        }
    }
    if (largestI == -1) {
        // noLoop();
        stillLooping = false;
        console.log("finished");
        clear();
    }

    // STEP 2
    var largestJ = -1;
    for (var j = 0; j < order.length; j++) {
        if (order[largestI] < order[j]) {
            largestJ = j;
        }
    }

    // STEP 3
    swap(order, largestI, largestJ);

    // STEP 4: reverse from largestI + 1 to the end
    var endArray = order.splice(largestI + 1);
    endArray.reverse();
    order = order.concat(endArray);
}

function factorial(n) {
    if (n == 1) {
        return 1;
    } else {
        return n * factorial(n - 1);
    }
}

function buildLongestRoute(){
    longestRoute[0] = shortestRoute[0];
    var max_distance = -1;
    var rmLocation;
    var shortestRouteCopy = shortestRoute.slice();

    //Get the second point in route
    for(var i = 0; i < shortestRouteCopy.length -1; i++){
            var current_dist = dist(shortestRouteCopy[0].x, shortestRouteCopy[0].y, shortestRouteCopy[i+1].x, shortestRouteCopy[i+1].y);

        if(current_dist > max_distance){
            max_distance = current_dist;
            longestRoute[1] = shortestRouteCopy[i+1];

            rmLocation = i+1;
        }
    }

    shortestRouteCopy.splice(rmLocation, 1);


    //Get the third point in route
    max_distance = -1;
    for(var i = 0; i < shortestRouteCopy.length -1; i++){
        var current_dist = dist(longestRoute[1].x, longestRoute[1].y, shortestRouteCopy[i+1].x, shortestRouteCopy[i+1].y);

        if(current_dist > max_distance){
            max_distance = current_dist;
            longestRoute[2] = shortestRouteCopy[i+1];

            rmLocation = i+1;
        }
    }

    shortestRouteCopy.splice(rmLocation, 1);

    //Get the fourth point in route
    max_distance = -1;
    for(var i = 0; i < shortestRouteCopy.length -1; i++){
        var current_dist = dist(longestRoute[2].x, longestRoute[2].y, shortestRouteCopy[i+1].x, shortestRouteCopy[i+1].y);


        if(current_dist > max_distance){
            longestRoute[3] = shortestRouteCopy[i+1];

            rmLocation = i+1;
        }
    }
    shortestRouteCopy.splice(rmLocation, 1);

    longestRoute[4] = shortestRouteCopy[1];


    longestRouteTotalDistance = 0;
    for(var acc = 0; acc < longestRoute.length -1; acc++){
        longestRouteTotalDistance += dist(longestRoute[acc].x, longestRoute[acc].y, longestRoute[acc+1].x, longestRoute[acc+1].y);
    }
    console.log("Longest route is " + longestRouteTotalDistance);
}


function mousePressed() {
    for (var i = 0; i < points.length; i++) {
        points[i].clicked(mouseX, mouseY);
    }
}


class Point {
    constructor(x, y, r, label) {
        this.x = x;
        this.y = y;
        this.r = r;
        this.brightness = 0;
        this.toggled = false;
        this.label = label;
    }

    //When point is clicked, pass in mouse location
    clicked(px, py) {
        var d = dist(px, py, this.x, this.y); //Find difference between current mouse location and point
        //If mouse is within object radius
        if (d < this.r) {
            //When point is clicked...
            if(this.toggled === true && usersRoute.length === 5 && usersRoute[0].label === this.label)
            {
                usersRoute.push(this);
            }
            if (!this.toggled) {
                this.toggled = true;
                //change color
                this.brightness = 255;

                //Idea 1
                //If mouse click is within radius of point, then push point to usersRoute array
                usersRoute.push(this);

            } else {
                usersRoute.pop();
                this.toggled = false;
                this.brightness = 0;
            }
            // console.log("Clicked on point!!!");
        }
    }

    show() {
        stroke(355);
        strokeWeight(3);
        fill(this.brightness, 125);
        ellipse(this.x, this.y, this.r * 2);
        text(this.label, this.x - this.r / 4, this.y - this.r / 4.5);
    }
}

$(document).ready(function () {
    $('#start').click(function() {

        // $(this).prop("disabled",true);
        // $('.progress-bar').animate({
        //     width: "+=600px"
        // });
        if(overshotAnswer ===true){
            $('.progress-bar').animate({
                width: "+=700px"
            });
            $('.progress-bar').css({
                background: "red"
            });
            // $("h4").html("This is a long route!");
        }
        else {
            $('.progress-bar').animate({
                width: "+=600px"
            });
            $('.progress-bar').css({
                background: "#14bfcc"
            });
        }
    });

    $('#reset').click(function() {
        // $(this).prop("disabled",false);
        $('.progress-bar').css('width','0')
    });


});


