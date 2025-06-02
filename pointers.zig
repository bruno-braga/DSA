const std = @import("std");
const print = std.debug.print;

fn doubleit(n: *i32) void {
    n.* = n.* * 2;
}

pub fn main() void {
    var x: i32 = 5;

    print("{any}\n", .{x});
    print("{any}\n", .{&x});

    doubleit(&x);
}