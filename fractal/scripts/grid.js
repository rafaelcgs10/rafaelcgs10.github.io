"use strict";
var Cell = /** @class */ (function () {
    function Cell(initial_x, initial_y) {
        this.initial_x = initial_x;
        this.initial_y = initial_y;
        this.word = '';
        this.fill = false;
    }
    Cell.prototype.get_word = function () {
        return this.word;
    };
    Cell.prototype.insert_number = function (n) {
        this.word = this.word.concat(String(n));
    };
    Cell.prototype.get_initial_x = function () {
        return this.initial_x;
    };
    Cell.prototype.get_initial_y = function () {
        return this.initial_y;
    };
    return Cell;
}());
var Grid = /** @class */ (function () {
    function Grid(divisions, width) {
        this.size = Math.pow(2, divisions);
        this.width = width;
        this.grid = [];
        this.step = width / this.size;
        for (var i = 0; i < this.size; i++) {
            this.grid[i] = [];
            for (var j = 0; j < this.size; j++) {
                this.grid[i][j] = new Cell(i * this.step + (this.step * 0.2), j * this.step + +(this.step * 0.45));
            }
        }
        this.set_grid(0, 0, 1);
    }
    Grid.prototype.get_cell = function (i, j) {
        return this.grid[i][j];
    };
    //Sets the initial word for each cell in the grid
    Grid.prototype.set_grid = function (initial_x, initial_y, cont) {
        var sub_divisions = Math.floor(this.size / (Math.pow(2, cont)));
        for (var i = initial_y; i < initial_y + sub_divisions; i++) {
            for (var j = initial_x; j < initial_x + sub_divisions; j++) {
                this.grid[i][j].insert_number(2);
            }
        }
        for (var i = initial_y; i < initial_y + sub_divisions; i++) {
            for (var j = initial_x + sub_divisions; j < initial_x + 2 * sub_divisions; j++) {
                this.grid[i][j].insert_number(3);
            }
        }
        for (var i = initial_y + sub_divisions; i < initial_y + 2 * sub_divisions; i++) {
            for (var j = initial_x; j < initial_x + sub_divisions; j++) {
                this.grid[i][j].insert_number(1);
            }
        }
        for (var i = initial_y + sub_divisions; i < initial_y + 2 * sub_divisions; i++) {
            for (var j = initial_x + sub_divisions; j < initial_x + 2 * sub_divisions; j++) {
                this.grid[i][j].insert_number(4);
            }
        }
        if (sub_divisions <= 0)
            return;
        cont++;
        this.set_grid(initial_x, initial_y, cont);
        this.set_grid(initial_x + sub_divisions, initial_y, cont);
        this.set_grid(initial_x, initial_y + sub_divisions, cont);
        this.set_grid(initial_x + sub_divisions, initial_y + sub_divisions, cont);
    };
    return Grid;
}());
var GridDraw = /** @class */ (function () {
    function GridDraw(divisions) {
        var canvas = document.getElementById('canvas');
        var context = canvas.getContext("2d");
        context.lineWidth = 2;
        this.canvas = canvas;
        this.context = context;
        this.divisions = divisions;
        this.canvas_width = canvas.width;
        var width = this.canvas_width;
        this.size = Math.pow(2, divisions);
        this.grid = new Grid(divisions, width);
        this.divides_grid(divisions, width / 2, width / 2, width);
        console.log("Divisions: " + String(divisions));
        for (var i = 0; i < this.size; i++) {
            for (var j = 0; j < this.size; j++) {
                this.draw_number(this.grid.get_cell(i, j));
            }
        }
    }
    //Draws the cells numbers
    GridDraw.prototype.draw_number = function (cell) {
        var context = this.context;
        var font_size = String(Math.floor(60 / this.divisions));
        context.font = font_size + "px Arial";
        var initial_x = cell.get_initial_x();
        var initial_y = cell.get_initial_y();
        var word = cell.get_word();
        context.fillText(word, initial_x, initial_y);
        context.stroke();
    };
    //Draws a cross of the given width in the given position
    GridDraw.prototype.draw_cross = function (initial_x, initial_y, width) {
        var context = this.context;
        context.moveTo(initial_x - width / 2, initial_y);
        context.lineTo(initial_x + width / 2, initial_y);
        context.moveTo(initial_x, initial_y - width / 2);
        context.lineTo(initial_x, initial_y + width / 2);
        context.stroke();
    };
    //Divides this grid a number of this starting in a given position
    GridDraw.prototype.divides_grid = function (divisions, initial_x, initial_y, width) {
        if (divisions > 0) {
            this.draw_cross(initial_x, initial_y, width);
        }
        if (divisions > 1) {
            this.divides_grid(divisions - 1, initial_x + width / 4, initial_y + width / 4, width / 2);
            this.divides_grid(divisions - 1, initial_x + width / 4, initial_y - width / 4, width / 2);
            this.divides_grid(divisions - 1, initial_x - width / 4, initial_y - width / 4, width / 2);
            this.divides_grid(divisions - 1, initial_x - width / 4, initial_y + width / 4, width / 2);
        }
    };
    return GridDraw;
}());
new GridDraw(4);
//# sourceMappingURL=grid.js.map