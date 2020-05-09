<canvas></canvas>

<style>

    body {
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    canvas {
        background-color: #222;
    }

    span {
        position: absolute;
        color: blue;
        font: 15vmin Dense;
        padding: 10px 23px;
        border-radius: 10px;
        background-color: pink;
    }
</style>

<script>
    // globals
    var STAR_COUNT = 15;
    var MIN_STAR_SIZE = 5;
    var STAR_SIZE_RANGE = 18;
    var MAX_VELOCITY = 2;
    var MOUSE_DISTANCE = 50;
    var RING_GROW_SPEED = 1;
    var linkStar = null;

    // set up canvas
    var canvas = document.querySelector('canvas');
    canvas.width = innerWidth;
    canvas.height = innerHeight;
    var c = canvas.getContext('2d');

    window.addEventListener('resize', function(e) {
        canvas.width = innerWidth;
        canvas.height = innerHeight;
        init();
    });

    // track mouse
    var mouse = {
        x: undefined,
        y: undefined
    };

    window.addEventListener('mousemove', function(e) {
        mouse.x = e.x;
        mouse.y = e.y;
    });

    // track clicks
    var click = {
        x: undefined,
        y: undefined
    };

    window.addEventListener('mousedown', function(e) {
        click.x = e.x;
        click.y = e.y;
    });

    // set up stars
    var starArray = [];

    function init() {
        starArray = [];
        linksArray = [];

        for (var i = 0; i < STAR_COUNT; i++) {
            var radius = STAR_SIZE_RANGE;
            var x = Math.random() * (innerWidth - radius * 2) + radius;
            var y = Math.random() * (innerHeight - radius * 2) + radius;
            var ring = new Ring(x, y, radius);
            var label = String.fromCharCode(65 + i);
            console.log(label);

            starArray.push(new Star(radius, x, y, ring, label));
        }

        animate();
    }

    // ring class
    function Ring(x, y, radius) {
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.initialRad = radius;
        this.radiusTarget = radius + (radius / 2);
        this.counted = false;

        this.draw = function() {
            c.beginPath();
            c.lineWidth = 1;
            c.shadowBlur = 0;
            c.arc(this.x, this.y, this.radius, Math.PI * 2, false);
            c.strokeStyle = '#ffc';
            c.stroke();
        }

        this.update = function(newX, newY) {
            this.x = newX;
            this.y = newY;
            this.draw();
        }

        this.expand = function() {
            this.radius += RING_GROW_SPEED;
        }

        this.shrink = function() {
            this.radius -= RING_GROW_SPEED;
        }
    }

    // star class
    function Star(radius, x, y, ring, label) {
        this.x = x;
        this.y = y;
        this.radius = radius;
        this.minRadius = radius;
        this.ring = ring;
        this.label = label;
        this.color = '#ffc';

        this.ring.draw();

        this.draw = function() {
            c.beginPath();
            c.arc(this.x, this.y, this.radius, Math.PI * 2, false);
            c.fillStyle = this.color;
            c.shadowColor = this.color;
            c.shadowBlur = 10;
            c.fill();
            c.fillStyle = "black";
            c.font = "bold 18px arial";
            c.textBaseline = "middle";
            c.fillText(label, this.x-radius/4, this.y-radius/4.5);
        }

        this.update = function() {
//     if (this.x + this.radius >= innerWidth || this.x - this.radius <= 0) {
//       this.dx = -this.dx;
//     }

//     if (this.y + this.radius >= innerHeight || this.y - this.radius <= 0) {
//       this.dy = -this.dy;
//     }

//     // this.x += this.dx;
//     // this.y += this.dy;

            // mouse interactivity
            if (mouse.x - this.x < MOUSE_DISTANCE && mouse.x - this.x > -MOUSE_DISTANCE &&
                mouse.y - this.y < MOUSE_DISTANCE && mouse.y - this.y > -MOUSE_DISTANCE &&
                this.ring.radius < this.ring.radiusTarget) {
                this.ring.expand();
            } else if (this.ring.radius > this.ring.initialRad) {
                this.ring.shrink();
            }

            // mouse click
            if (click.x < this.x + radius && click.x > this.x - radius &&
                click.y < this.y + radius && click.y > this.y - radius) {
                if (linkStar) {
                    createLink(this);
                } else {
                    linkStar = this;
                }

                click.x = undefined;
                click.y = undefined;
            }

            this.draw();
            this.ring.update(this.x, this.y);
        }
    }

    function renderActiveLink() {
        c.beginPath();
        c.lineWidth = 5;
        c.shadowBlur = 0;
        c.moveTo(linkStar.x, linkStar.y);
        c.lineTo(mouse.x, mouse.y);
        c.strokeStyle = '#ffc';
        c.stroke();
    }

    var linksArray = [];

    function createLink(target) {
        linksArray.push(new Link(linkStar, target));
        linkStar = null;
    }

    function Link(start, end) {
        this.start = start;
        this.end = end;

        this.draw = function() {
            c.beginPath();
            c.lineWidth = 5;
            c.shadowBlur = 10;
            c.moveTo(this.start.x, this.start.y);
            c.lineTo(this.end.x, this.end.y);
            c.strokeStyle = '#ffc';
            c.stroke();
        }
    }

    // animate stars
    function animate() {
        requestAnimationFrame(animate);
        c.clearRect(0, 0, innerWidth, innerHeight);

        for (var i = 0; i < starArray.length; i++) {
            starArray[i].update();
        }

        for (var i = 0; i < linksArray.length; i++) {
            linksArray[i].draw();
        }

        if (linkStar) {
            renderActiveLink();
        }
    }

    // initialise on load
    init();

    function nextChar(c) {
        return String.fromCharCode(c.charCodeAt(0) + 1);
    }



</script>