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

// structs can have methods
// Struct methods are not special, they are only namespaced
// functions that you can call with dot syntax.
const Vec3 = struct {
    x: f32,
    y: f32,
    z: f32,

    pub fn init(x: f32, y: f32, z: f32) Vec3 {
        return Vec3{
            .x = x,
            .y = y,
            .z = z,
        };
    }

    pub fn dot(self: Vec3, other: Vec3) f32 {
        return self.x * other.x + self.y * other.y + self.z * other.z;
    }
};

test "dot product" {
    const v1 = Vec3.init(1.0, 0.0, 0.0);
    const v2 = Vec3.init(0.0, 1.0, 0.0);

    std.debug.print("v1.dot(v2): {d}\n", .{v1.dot(v2)});

    try std.testing.expect(v1.dot(v2) == 0.0);

    // Other than being available to call with dot syntax, struct
    // methods are not special. You can reference them as any other
    // declaration inside the struct
    try std.testing.expect(Vec3.dot(v1, v2) == 0.0);

    std.debug.print("Vec3.dot(v1, v2): {d}\n", .{Vec3.dot(v1, v2)});
}
