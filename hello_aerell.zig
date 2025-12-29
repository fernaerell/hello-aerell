// Example to print "Hello Aerell!" in Zig.

// Import standard library
const std = @import("std");

// Create entry point function
pub fn main() !void {
    
    // Call print function from std.debug with argument "Hello Aerell!"
    std.debug.print("Hello Aerell!", .{});
}
