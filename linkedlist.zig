const std = @import("std");

const Node = struct {
    data: ?i32= null,
    next: ?*Node = null,
};

pub fn createList(n: ?i32) Node {
    var node = Node{};
    node.data = n;
    node.next = null;

    return node;
}

pub fn main() void {
    var list = createList(1);
    
    var next_node = Node{};
    list.next = &next_node;

    list.next.?.data = 2;

    std.debug.print("List: {any}\n", .{list});
}