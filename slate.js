// Create Operations
const pushRight = slate.operation("push", {
    "direction" : "right",
    "style" : "bar-resize:screenSizeX/3"
});

const pushLeft = slate.operation("push", {
    "direction" : "left",
    "style" : "bar-resize:screenSizeX/3"
});

const pushTop = slate.operation("push", {
    "direction" : "top",
    "style" : "bar-resize:screenSizeY/2"
});

const fullscreen = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX",
    "height" : "screenSizeY"
});

const halfScreenLeft = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY"
});

const halfScreenRight = slate.operation("move", {
    "x" : "screenSizeX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/2",
    "height" : "screenSizeY"
});

const leftOneThird = slate.operation("move", {
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX - (2*screenSizeX)/3",
    "height" : "screenSizeY"
});

const rightTwoThird = slate.operation("move", {
    "x" : "screenOriginX + screenSizeX/3",
    "y" : "screenOriginY",
    "width" : "screenSizeX - screenSizeX/3",
    "height" : "screenSizeY"
});


// fullscrenn
slate.bind("up:ctrl;cmd;alt", function(win) {
    win.doOperation(fullscreen);
    // here win is a reference to the currently focused window
});
// half right side
slate.bind("left:ctrl;cmd", function(win) {
    // here win is a reference to the currently focused window
    win.doOperation(halfScreenLeft);
});

// right two third
slate.bind("down:ctrl;cmd;alt", function(win) {
    // here win is a reference to the currently focused window
    win.doOperation(rightTwoThird);
});

// left one third
slate.bind("left:ctrl;cmd;alt", function(win) {
    // here win is a reference to the currently focused window
    win.doOperation(leftOneThird);
});

slate.bind("right:ctrl;cmd;alt", function(win) {
    // here win is a reference to the currently focused window
    win.doOperation(pushRight);
});

