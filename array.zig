const std = @import("std");

// explicit initialization
// Provide a list of elements within curly braces {}
const explicit_array: [5]i32 = [5]i32{1, 2, 3, 4, 5};

// inferred size
// Use [_]T to let the compiler infer the size based on the 
// number of elements provided in the initializer list
const inferred_array = [_]i32{1, 2, 3, 4, 5}; // size is inferred as 5

test "declaring explicit and inferred array" {
    try std.testing.expect(std.mem.eql(i32, &explicit_array, &inferred_array));
}

test "get the size of explicit array" {
    try std.testing.expect(explicit_array.len == 5);
}

test "get the size of inferred array" {
    try std.testing.expect(inferred_array.len == 5);
}

// A string literal is a single-item pointer to an array.
const username_string = "radaagooon";
const username_array = [_]u8{'r', 'a', 'd', 'a', 'a', 'g', 'o', 'o', 'o', 'n'};

test "string literal length is equal with array" {
    try std.testing.expect(std.mem.eql(u8, username_string, &username_array));
}

test "iterate over an array" {
    // The size of usize is not fixed but is determined by the architecture. 
    // On a 64-bit system, usize is typically 64 bits (like a u64), 
    // and on a 32-bit system, it's typically 32 bits (like a u32).
    var sum: usize = 0;

    for (username_array) |byte| {
       sum += byte; 
    }

    try std.testing.expect(sum == 'r' + 'a' + 'd' + 'a' * 2 + 'g' + 'o' * 3 + 'n');
}
