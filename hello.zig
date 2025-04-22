const std = @import("std");

pub fn main() void {
    std.debug.print("Hello, World!\n", .{});
    std.log.info("Zig here!\n", .{});
}
