const std = @import("std");

var stack = [5]?i32{null,null,null,null,null};

fn add(arr: *[5]?i32, n: i32) void {
    for (arr, 0..) |value, i| {
        if (value == null) {
            arr[i] = n;
            break;
        }
    }
}

fn pop(arr: *[5]?i32) i32 {
    var last_index = arr.len - 1;
    
    while(last_index >= 0 and arr[last_index] == null) {
        last_index -= 1;
    }

    if (last_index < 0) {
        return 0;
    }

    const value = arr[last_index].?;
    arr[last_index] = null;

    return value;
}

pub fn main() void {
    _ = add(&stack, 1);
    _ = add(&stack, 2);
    _ = pop(&stack);

    std.debug.print("Array: {any}\n", .{stack});
}
