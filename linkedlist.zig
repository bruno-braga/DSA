const std = @import("std");

const Node = struct {
    data: ?i32= null,
    next: ?*Node = null,
};

fn createList(n: ?i32) Node {
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

    var temp: ?*Node = &list;
    while(temp != null) {
        std.debug.print("{any}\n", .{temp.?.data});
        temp = temp.?.next;
    }

    std.debug.print("List: {any}\n", .{list});
}