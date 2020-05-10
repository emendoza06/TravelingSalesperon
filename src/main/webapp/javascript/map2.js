var cities = [];
var points = [];
var totalLines = [];

var totalCities = 5;

var order = [];

var totalPermutations;
var count = 0;

var recordDistance;
var bestEver;

var stillLooping = true;

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
    totalLines.push(point);
  }

  var d = calcDistance(cities, order);
  recordDistance = d;
  bestEver = order.slice();

  totalPermutations = factorial(totalCities);
  console.log(totalPermutations);
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
    beginShape();
    for (var i = 0; i < order.length; i++) {
      var n = bestEver[i];
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
    background(0);
    fill(255);
    for (var p = 0; p < points.length; p++) {
      points[p].show();
    }

    linkPoints();
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
      if (!this.toggled) {
        this.toggled = true;
        //change color
        this.brightness = 255;

        //Idea 1
        //If mouse click is within radius of point, then push point to totalLines array
        totalLines.push(this);

        //Idea 2
        //if (x1 = x2 and y1 = y2) then points are equal. Pop.
        //   if (twoPointstoLink[0] === twoPointstoLink[2] && twoPointstoLink[1] === twoPointstoLink[3]) {
        //     console.log("Two points equal");
        //     twoPointstoLink.pop();
        //     twoPointstoLink.pop();
        //
        //   }
        //If (x1, y1, x2, y2) points are not equal then go to linkPoints function
        //   if (twoPointstoLink.length !==4) {
        //     console.log("Length not four");
        //   } else if(twoPointstoLink.length === 4 && twoPointstoLink[0] !== twoPointstoLink[2] && twoPointstoLink[1] !== twoPointstoLink[3]){
        //       linkPoints();
        //   }
        //
        //   console.log("Two points array length is " + twoPointstoLink.length);
        //
      } else {
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

function linkPoints() {
  console.log("In linkPoints function");
  stroke(355);
  strokeWeight(2);
  //These for loops group 2 pairs of points to send to  built-in line function
  for (var p = 0; p < totalLines.length / 2; p++) {
    for (var set = 0; set < 2; set++) {
      line(
        totalLines[set].x,
        totalLines[set].y,
        totalLines[set + 1].x,
        totalLines[set + 1].y,
      );
    }
  }

  // line(twoPointstoLink[0], twoPointstoLink[1], twoPointstoLink[2], twoPointstoLink[3]);
}
