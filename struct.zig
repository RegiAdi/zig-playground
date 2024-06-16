const std = @import("std");

// declare a struct
const Point = struct {
    x: f32,
    y: f32,
};

test "declaring a struct" {
    try std.testing.expect(@sizeOf(Point) == @sizeOf(f64));
}

test "declare an instance of a struct" {
    // declare an instance of a struct
    const p = Point{
        .x = 0.12,
        .y = undefined,
    };

    try std.testing.expect(p.x == 0.12);
}
