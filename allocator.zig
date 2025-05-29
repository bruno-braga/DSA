const std = @import("std");
const heap = std.heap;
const print = std.debug.print;

pub fn main() !void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    const ptr = try allocator.create(i32);
    errdefer allocator.destroy(ptr);

    ptr.* = 300;

    print("{any}\n", .{ptr});

}