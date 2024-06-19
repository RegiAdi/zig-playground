const std = @import("std");

fn deferExample() !usize {
    var number: usize = 9;

    std.debug.print("1. number: {d}\n", .{number});

    {
        defer number = 7;
        std.debug.print("2. number: {d}\n", .{number});

        {
            defer number = 2345;
            std.debug.print("3. number: {d}\n", .{number});
        }
        std.debug.print("4. number: {d}\n", .{number});

        number = 10;
        std.debug.print("5. number: {d}\n", .{number});
    }

    std.debug.print("6. number: {d}\n", .{number});

    try std.testing.expect(number == 7);

    number = 5;
    std.debug.print("7. number: {d}\n", .{number});

    return number;
}

test "defer basic" {
    try std.testing.expect((try deferExample()) == 5);
}
