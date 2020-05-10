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

            <script class="w3-border w3-padding-large w3-padding-64 w3-center">
                // game parameters
                const DELAY_END = 2; // seconds until a new game starts
                const FPS = 30; // frames per second
                const GRID_SIZE = 5; // number of rows (and columns)
                const HEIGHT = 550; // pixels

                // derived dimensions
                const WIDTH = HEIGHT * 0.9;
                const CELL = WIDTH / (GRID_SIZE + 2); // size of cells (as well as left and right margin)
                const STROKE = CELL / 12; // stroke width
                const DOT = STROKE; // dot radius
                const MARGIN = HEIGHT - (GRID_SIZE + 1) * CELL; // top margin for score, names, etc.

                // colours
                const COLOR_BOARD = "cornsilk";
                const COLOR_BORDER = "wheat";
                const COLOR_COMP = "crimson";
                const COLOR_COMP_LIT = "lightpink";
                const COLOR_DOT = "sienna";
                const COLOR_PLAY = "royalblue";
                const COLOR_PLAY_LIT = "lightsteelblue";
                const COLOR_TIE = "black";

                // text
                const TEXT_COMP = "Computer";
                const TEXT_COMP_SML = "Comp";
                const TEXT_PLAY = "Player";
                const TEXT_PLAY_SML = "Play";
                const TEXT_SIZE_CELL = CELL / 3;
                const TEXT_SIZE_TOP = MARGIN / 6;
                const TEXT_TIE = "DRAW!";
                const TEXT_WIN = "WINS!";

                // definitions
                const Side = {
                    BOT: 0,
                    LEFT: 1,
                    RIGHT: 2,
                    TOP: 3
                }

                // set up the game canvas
                var canv = document.createElement("canvas");
                canv.height = HEIGHT;
                canv.width = WIDTH;
                document.body.appendChild(canv);
                var canvRect = canv.getBoundingClientRect();

                // set up the context
                var ctx = canv.getContext("2d");
                ctx.lineWidth = STROKE;
                ctx.textAlign = "center";
                ctx.textBaseline = "middle";

                // game variables
                var currentCells, playersTurn, squares;
                var scoreComp, scorePlay;
                var timeEnd;

                // start a new game
                newGame();

                // event handlers
                canv.addEventListener("mousemove", highlightGrid);
                canv.addEventListener("click", click);

                // set up the game loop
                setInterval(loop, 1000 / FPS);

                function loop() {
                    drawBoard();
                    drawSquares();
                    drawGrid();
                    drawScores();
                }

                function click(/** @type {MouseEvent} */ ev) {
                    if (/*TODO !playersTurn ||*/ timeEnd > 0) {
                        return;
                    }
                    selectSide();
                }

                function drawBoard() {
                    ctx.fillStyle = COLOR_BOARD;
                    ctx.strokeStyle = COLOR_BORDER;
                    ctx.fillRect(0, 0, WIDTH, HEIGHT);
                    ctx.strokeRect(STROKE / 2, STROKE / 2, WIDTH - STROKE, HEIGHT - STROKE);
                }

                function drawDot(x, y) {
                    ctx.fillStyle = COLOR_DOT;
                    ctx.beginPath();
                    ctx.arc(x, y, DOT, 0, Math.PI * 2);
                    ctx.fill();
                }

                function drawGrid() {
                    for (let i = 0; i < GRID_SIZE + 1; i++) {
                        for (let j = 0; j < GRID_SIZE + 1; j++) {
                            drawDot(getGridX(j), getGridY(i));
                        }
                    }
                }

                function drawLine(x0, y0, x1, y1, color) {
                    ctx.strokeStyle = color;
                    ctx.beginPath();
                    ctx.moveTo(x0, y0);
                    ctx.lineTo(x1, y1);
                    ctx.stroke();
                }

                function drawScores() {
                    let colComp = playersTurn ? COLOR_COMP_LIT : COLOR_COMP;
                    let colPlay = playersTurn ? COLOR_PLAY : COLOR_PLAY_LIT;
                    drawText(TEXT_PLAY, WIDTH * 0.25, MARGIN * 0.25, colPlay, TEXT_SIZE_TOP);
                    drawText(scorePlay, WIDTH * 0.25, MARGIN * 0.6, colPlay, TEXT_SIZE_TOP * 2);
                    drawText(TEXT_COMP, WIDTH * 0.75, MARGIN * 0.25, colComp, TEXT_SIZE_TOP);
                    drawText(scoreComp, WIDTH * 0.75, MARGIN * 0.6, colComp, TEXT_SIZE_TOP * 2);

                    // game over text
                    if (timeEnd > 0) {
                        timeEnd--;

                        // handle a tie
                        if (scoreComp == scorePlay) {
                            drawText(TEXT_TIE, WIDTH * 0.5, MARGIN * 0.6, COLOR_TIE, TEXT_SIZE_TOP);
                        } else {
                            let playerWins = scorePlay > scoreComp;
                            let color = playerWins ? COLOR_PLAY : COLOR_COMP;
                            let text = playerWins ? TEXT_PLAY : TEXT_COMP;
                            drawText(text, WIDTH * 0.5, MARGIN * 0.5, color, TEXT_SIZE_TOP);
                            drawText(TEXT_WIN, WIDTH * 0.5, MARGIN * 0.7, color, TEXT_SIZE_TOP);
                        }

                        // new game
                        if (timeEnd == 0) {
                            newGame();
                        }
                    }
                }

                function drawSquares() {
                    for (let row of squares) {
                        for (let square of row) {
                            square.drawSides();
                            square.drawFill();
                        }
                    }
                }

                function drawText(text, x, y, color, size) {
                    ctx.fillStyle = color;
                    ctx.font = size + "px dejavu sans mono";
                    ctx.fillText(text, x, y);
                }

                function getColor(player, light) {
                    if (player) {
                        return light ? COLOR_PLAY_LIT : COLOR_PLAY;
                    } else {
                        return light ? COLOR_COMP_LIT : COLOR_COMP;
                    }
                }

                function getText(player, small) {
                    if (player) {
                        return small ? TEXT_PLAY_SML : TEXT_PLAY;
                    } else {
                        return small ? TEXT_COMP_SML : TEXT_COMP;
                    }
                }

                function getGridX(col) {
                    return CELL * (col + 1);
                }

                function getGridY(row) {
                    return MARGIN + CELL * row;
                }

                function highlightGrid(/** @type {MouseEvent} */ ev) {
                    if (/*TODO !playersTurn ||*/ timeEnd > 0) {
                        return;
                    }

                    // get mouse position relative to the canvas
                    let x = ev.clientX - canvRect.left;
                    let y = ev.clientY - canvRect.top;

                    // highlight the square's side
                    highlightSide(x, y);
                }

                function highlightSide(x, y) {

                    // clear previous highlighting
                    for (let row of squares) {
                        for (let square of row) {
                            square.highlight = null;
                        }
                    }

                    // check each cell
                    let rows = squares.length;
                    let cols = squares[0].length;
                    currentCells = [];
                    OUTER: for (let i = 0; i < rows; i++) {
                        for (let j = 0; j < cols; j++) {
                            if (squares[i][j].contains(x, y)) {

                                // highlight current
                                let side = squares[i][j].highlightSide(x, y);
                                if (side != null) {
                                    currentCells.push({row: i, col: j});
                                }

                                // determine neighbour
                                let row = i, col = j, highlight, neighbour = true;
                                if (side == Side.LEFT && j > 0) {
                                    col = j - 1;
                                    highlight = Side.RIGHT;
                                } else if (side == Side.RIGHT && j < cols - 1) {
                                    col = j + 1;
                                    highlight = Side.LEFT;
                                } else if (side == Side.TOP && i > 0) {
                                    row = i - 1;
                                    highlight = Side.BOT;
                                } else if (side == Side.BOT && i < rows - 1) {
                                    row = i + 1;
                                    highlight = Side.TOP;
                                } else {
                                    neighbour = false;
                                }

                                // highlight neighbour
                                if (neighbour) {
                                    squares[row][col].highlight = highlight;
                                    currentCells.push({row: row, col: col});
                                }

                                // no need to continue
                                break OUTER;
                            }
                        }
                    }
                }

                function newGame() {
                    currentCells = [];
                    playersTurn = Math.random() >= 0.5;
                    scoreComp = 0;
                    scorePlay = 0;
                    timeEnd = 0;

                    // set up the squares
                    squares = [];
                    for (let i = 0; i < GRID_SIZE; i++) {
                        squares[i] = [];
                        for (let j = 0; j < GRID_SIZE; j++) {
                            squares[i][j] = new Square(getGridX(j), getGridY(i), CELL, CELL);
                        }
                    }
                }

                function selectSide() {
                    if (currentCells == null || currentCells.length == 0) {
                        return;
                    }

                    // select the side(s)
                    let filledSquare = false;
                    for (let cell of currentCells) {
                        if (squares[cell.row][cell.col].selectSide()) {
                            filledSquare = true;
                        }
                    }
                    currentCells = [];

                    // check for winner
                    if (filledSquare) {
                        if (scorePlay + scoreComp == GRID_SIZE * GRID_SIZE) {
                            // game over
                            timeEnd = Math.ceil(DELAY_END * FPS);
                        }
                    } else {
                        // next player's turn
                        playersTurn = !playersTurn;
                    }
                }

                // create the Square object constructor
                function Square(x, y, w, h) {
                    this.w = w;
                    this.h = h;
                    this.bot = y + h;
                    this.left = x;
                    this.right = x + w;
                    this.top = y;
                    this.highlight = null;
                    this.numSelected = 0;
                    this.owner = null;
                    this.sideBot = {owner: null, selected: false};
                    this.sideLeft = {owner: null, selected: false};
                    this.sideRight = {owner: null, selected: false};
                    this.sideTop = {owner: null, selected: false};

                    this.contains = function(x, y) {
                        return x >= this.left && x < this.right && y >= this.top && y < this.bot;
                    }

                    this.drawFill = function() {
                        if (this.owner == null) {
                            return;
                        }

                        // light background
                        ctx.fillStyle = getColor(this.owner, true);
                        ctx.fillRect(
                            this.left + STROKE, this.top + STROKE,
                            this.w - STROKE * 2, this.h - STROKE * 2
                        );

                        // owner text
                        drawText(
                            getText(this.owner, true),
                            this.left + this.w / 2,
                            this.top + this.h / 2,
                            getColor(this.owner, false),
                            TEXT_SIZE_CELL
                        );
                    }

                    this.drawSide = function(side, color) {
                        switch(side) {
                            case Side.BOT:
                                drawLine(this.left, this.bot, this.right, this.bot, color);
                                break;
                            case Side.LEFT:
                                drawLine(this.left, this.top, this.left, this.bot, color);
                                break;
                            case Side.RIGHT:
                                drawLine(this.right, this.top, this.right, this.bot, color);
                                break;
                            case Side.TOP:
                                drawLine(this.left, this.top, this.right, this.top, color);
                                break;
                        }
                    }

                    this.drawSides = function() {

                        // highlighting
                        if (this.highlight != null) {
                            this.drawSide(this.highlight, getColor(playersTurn, true));
                        }

                        // selected sides
                        if (this.sideBot.selected) {
                            this.drawSide(Side.BOT, getColor(this.sideBot.owner, false));
                        }
                        if (this.sideLeft.selected) {
                            this.drawSide(Side.LEFT, getColor(this.sideLeft.owner, false));
                        }
                        if (this.sideRight.selected) {
                            this.drawSide(Side.RIGHT, getColor(this.sideRight.owner, false));
                        }
                        if (this.sideTop.selected) {
                            this.drawSide(Side.TOP, getColor(this.sideTop.owner, false));
                        }
                    }

                    this.highlightSide = function(x, y) {

                        // calculate the distances to each side
                        let dBot = this.bot - y;
                        let dLeft = x - this.left;
                        let dRight = this.right - x;
                        let dTop = y - this.top;

                        // determine closest value
                        let dClosest = Math.min(dBot, dLeft, dRight, dTop);

                        // highlight the closest if not already selected
                        if (dClosest == dBot && !this.sideBot.selected) {
                            this.highlight = Side.BOT;
                        } else if (dClosest == dLeft && !this.sideLeft.selected) {
                            this.highlight = Side.LEFT;
                        } else if (dClosest == dRight && !this.sideRight.selected) {
                            this.highlight = Side.RIGHT;
                        } else if (dClosest == dTop && !this.sideTop.selected) {
                            this.highlight = Side.TOP;
                        }

                        // return the highlighted side
                        return this.highlight;
                    }

                    this.selectSide = function() {
                        if (this.highlight == null) {
                            return;
                        }

                        // select the highlighted side
                        switch (this.highlight) {
                            case Side.BOT:
                                this.sideBot.owner = playersTurn;
                                this.sideBot.selected = true;
                                break;
                            case Side.LEFT:
                                this.sideLeft.owner = playersTurn;
                                this.sideLeft.selected = true;
                                break;
                            case Side.RIGHT:
                                this.sideRight.owner = playersTurn;
                                this.sideRight.selected = true;
                                break;
                            case Side.TOP:
                                this.sideTop.owner = playersTurn;
                                this.sideTop.selected = true;
                                break;
                        }
                        this.highlight = null;

                        // increase the number of selected
                        this.numSelected++;
                        if (this.numSelected == 4) {
                            this.owner = playersTurn;

                            // increment score
                            if (playersTurn) {
                                scorePlay++;
                            } else {
                                scoreComp++;
                            }

                            // filled
                            return true;
                        }

                        // not filled
                        return false;
                    }
                }
            </script>
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

