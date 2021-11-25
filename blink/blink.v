/* Copyright 2020 Gregory Davill <greg.davill@gmail.com>
   Hacked 2021 by Tommy Thorn
*/
`default_nettype none

/*
 *  Blink an LED on the ButterStick r1.0 using Verilog
 */

module top (
    input clk30,
    output [6:0] led_rgb_multiplex_a,
    output [2:0] led_rgb_multiplex_b
);
    // Create a 32 bit register
    reg [31:0] counter = 0;

    // Every positive edge increment register by 1
    always @(posedge clk30) begin
        counter <= counter + 1;
    end

    // Output inverted values of counter onto LEDs
    assign led_rgb_multiplex_b = counter[26:24];
    assign led_rgb_multiplex_a = counter[31:25];
endmodule
