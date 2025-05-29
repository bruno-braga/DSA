const std = @import("std");
const heap = std.heap;
const print = std.debug.print;
const AllocatorType = std.mem.Allocator;

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

fn traverse(list: *Node) void {
    var temp: ?*Node = list;

    while(temp != null) {
        std.debug.print("{any}\n", .{temp.?.data});
        temp = temp.?.next;
    }
}

fn addAtEnd(list: *Node, allocator: AllocatorType, n: ?i32) !Node {
    var temp: ?*Node = list;
    while(temp.?.next != null) {
        temp = temp.?.next;
    }

    const node_ptr = try allocator.create(Node);
    errdefer allocator.destroy(node_ptr); // avoid memory leak in case of a fail

    node_ptr.* = Node{
        .data = n,
        .next = null,
    };

    temp.?.next = node_ptr;

    return node_ptr.*;
}

pub fn main() void {
    var gpa = heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    const allocator = gpa.allocator();

    var list = createList(1);

    _ = addAtEnd(&list, allocator, 2) catch @panic("Failed to add node");
    _ = addAtEnd(&list, allocator, 3) catch @panic("Failed to add node");

    traverse(&list);

    print("List: {any}\n", .{list});

    var current: ?*Node = list.next;
    while (current != null) {
        const next = current.?.next;
        allocator.destroy(current.?);
        current = next;
    }
}