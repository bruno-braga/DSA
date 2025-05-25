const std = @import("std");

var queue = [5]?i32{null,null,null,null,null};

fn add(arr: *[5]?i32, n: i32) void {
    for (arr, 0..) |value, i| {
        if (value == null) {
            arr[i] = n;
            break;
        }
    }
}

fn pop(arr: *[5]?i32) i32 {
    arr[0] = null;

    for (arr, 0..) |value, i| {
        if (value == null and i+1 < arr.len) {
            arr[i] = arr[i + 1];
            arr[i+1] = null;
        }
    }

    return 1;
}


pub fn main() void {
    _ = add(&queue, 1);
    _ = add(&queue, 2);
    _ = add(&queue, 3);
    _ = pop(&queue);
    _ = add(&queue, 4);
    _ = add(&queue, 5);
    _ = pop(&queue);
    std.debug.print("Array: {any}\n", .{queue});
}
