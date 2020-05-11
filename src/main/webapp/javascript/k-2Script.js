var cities = [];
var points = [];
var usersRoute = [];

var totalCities = 5;

var order = [];

var totalPermutations;
var count = 0;

var recordDistance;
var bestEver;
clickedpoint = [];
var stillLooping = true;

var shortestRoute = [];

var progressBarTrackRouteAccuracy = false;
var overshotAnswer = false;
var undershotAnswer = false;

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

  var d = calcDistance(cities, order);
  recordDistance = d;
  bestEver = order.slice();

  totalPermutations = factorial(totalCities);
  console.log(totalPermutations);
}
//variable to stop console logging after logged once
var looping = 1;
var loopingtwice = 1;

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
    beginShape();
    for (var i = 0; i < order.length; i++) {
      var n = bestEver[i];
      shortestRoute[i] = points[n];
      vertex(cities[n].x, cities[n].y);
    }
    endShape();

    translate(0, height / 2);
    stroke(255);
    strokeWeight(1);
    noFill();
    /* beginShape();
            for (var i = 0; i < order.length; i++) {
              var n = order[i];
              vertex(cities[n].x, cities[n].y);
            }
            endShape(); */

    var d = calcDistance(cities, order);
    if (d < recordDistance) {
      recordDistance = d;
      bestEver = order.slice();
    }

    textSize(32);
    // var s = '';
    // for (var i = 0; i < order.length; i++) {
    //   s += order[i];
    // }
    fill(255);
    var percent = 100 * (count / totalPermutations);
    text(nf(percent, 0, 2) + "% completed", 20, height / 2 - 50);

    nextOrder();
  } else {
    /*-----------After Animation Runs (User Interaction)-----------------------*/
    $("#startingnode").html(
      "Draw the shortest route starting and ending on point  " +
        shortestRoute[0].label,
    );
    if (looping == loopingtwice) {
      console.log(shortestRoute.length);

      for (var s = 0; s < shortestRoute.length; s++) {
        console.log("Best route " + shortestRoute[s].label);
      }
    }
    loopingtwice = loopingtwice + 1;
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
    //T
    if (usersRoute.length >= 1 && usersRoute.length < 6) {
      if (looping == loopingtwice) {
        console.log(
          "In custom function check. Array length is " + usersRoute.length,
        );
      }
      loopingtwice = loopingtwice + 1;

      // usersRoute = [];
      // noStroke();
      //Check if route path was overshot or undershot
      var user_sum = 0;

      //Find the total route distance that user drew. Find total route distance answer.
      //usersRoute.pop();
      for (var acc = 0; acc < usersRoute.length - 1; acc++) {
        user_sum += dist(
          usersRoute[acc].x,
          usersRoute[acc].y,
          usersRoute[acc + 1].x,
          usersRoute[acc + 1].y,
        );
      }
      $("#formulaContainer").html(
        "The total route of paths   " +
          showFormula(clickedpoint) +
          " = " +
          user_sum,
      );
    }
    //If all points in route has been clicked
    else if (usersRoute.length >= 6) {
      console.log(
        "In  under 6 function check. Array length is " + usersRoute.length,
      );

      var userRouteFlag = false;

      // usersRoute = [];
      // noStroke();
      //Check if route path was overshot or undershot
      var user_sum = 0;
      var answer_sum = 0;
      //Find the total route distance that user drew. Find total route distance answer.
      usersRoute.pop();
      for (var acc = 0; acc < usersRoute.length - 1; acc++) {
        user_sum += dist(
          usersRoute[acc].x,
          usersRoute[acc].y,
          usersRoute[acc + 1].x,
          usersRoute[acc + 1].y,
        );
        answer_sum += dist(
          shortestRoute[acc].x,
          shortestRoute[acc].y,
          shortestRoute[acc + 1].x,
          shortestRoute[acc + 1].y,
        );
      }
      $("#startingNode").html(
        "The total route sum is   " + showFormula(clickedpoint) + user_sum,
      );

      console.log("User sum is " + user_sum);
      console.log("Answer sum is " + answer_sum);

      if (user_sum > answer_sum) {
        //Overshot
        console.log("Checking for overshot. Is true ");
        overshotAnswer = true;
      } else {
        overshotAnswer = false;
      }

      console.log("Exceeded lines to make");
      for (var sh = 0; sh < usersRoute.length; sh++) {
        if (usersRoute[sh] !== shortestRoute[sh]) {
          console.log("Try Again");
          console.log(
            "You picked " +
              usersRoute[sh].label +
              " but the right answer is " +
              shortestRoute[sh].label,
          );
          userRouteFlag = true;
        }
      }

      if (userRouteFlag === true) {
        console.log("User flag outside loop is " + userRouteFlag);
      } else if (userRouteFlag === false) {
        window.setTimeout(function () {
          window.location = "/reward";
        }, 700);
      }
    }
  }
}
function showFormula(clickedpoints) {
  console.log(clickedpoints.length);
  switch (clickedpoints.length) {
    case 1:
      return clickedpoints[0];
    case 2:
      return clickedpoints[0] + " + " + clickedpoints[1];
    case 3:
      return (
        clickedpoints[0] + " + " + clickedpoints[1] + " + " + clickedpoints[2]
      );
    case 4:
      return (
        clickedpoints[0] +
        " + " +
        clickedpoints[1] +
        " + " +
        clickedpoints[2] +
        " + " +
        clickedpoints[3]
      );
    case 5:
      return (
        clickedpoints[0] +
        " + " +
        clickedpoints[1] +
        " + " +
        clickedpoints[2] +
        " + " +
        clickedpoints[3] +
        " + " +
        clickedpoints[4]
      );
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

function mousePressed() {
  for (var i = 0; i < points.length; i++) {
    points[i].clicked(mouseX, mouseY);
  }
}
var looped = false;
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
      if (
        this.toggled === true &&
        usersRoute.length === 5 &&
        usersRoute[0].label === this.label
      ) {
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

      if (looped) {
        while (clickedpoint.length) {
          clickedpoint.pop();
        }
        //console.log("destroyed the clicked point arraay");
        //console.log(clickedpoint);
      }

      for (var i = 0; i < usersRoute.length; i++) {
        console.log("Clicked on point!!!" + usersRoute[i].label);

        clickedpoint.push(usersRoute[i].label);
      }
      looped = true;
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
  $("#start").click(function () {
    // $(this).prop("disabled",true);
    // $('.progress-bar').animate({
    //     width: "+=600px"
    // });
    if (overshotAnswer === true) {
      $(".progress-bar").animate({
        width: "+=700px",
      });
      $(".progress-bar").css({
        background: "red",
      });
      // $("h4").html("This is a long route!");
    } else {
      $(".progress-bar").animate({
        width: "+=600px",
      });
      $(".progress-bar").css({
        background: "#14bfcc",
      });
    }
  });

  $("#reset").click(function () {
    // $(this).prop("disabled",false);
    $(".progress-bar").css("width", "0");
  });
});

// line(twoPointstoLink[0], twoPointstoLink[1], twoPointstoLink[2], twoPointstoLink[3]);
