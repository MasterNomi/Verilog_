`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:57:27 07/29/2021
// Design Name:   bomb_check
// Module Name:   D:/tutorial/bomb_check_tb.v
// Project Name:  tutorial
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bomb_check
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bomb_check_tb;

	// Inputs
	reg [7:0] ascii;
	reg clk;
	reg rst;

	// Outputs
	wire alert;

	// Instantiate the Unit Under Test (UUT)
	bomb_check uut (
		.ascii(ascii), 
		.clk(clk), 
		.rst(rst), 
		.alert(alert)
	);
	initial begin
		rst = 0;
		clk = 0;
		#100
		clk = 1;
		forever #25 clk = ~clk;
	end

	initial begin
		// Initialize Inputs
		ascii = 0;
		#100
		// Wait 100 ns for global reset to finish
		
		// Add stimulus here
		ascii = "B";
		#50
		ascii = "M";
		#50
		ascii = "B";
		#50
		ascii = "O";
		#50
		ascii = "M";
		#50
		ascii = "B";
		#50
		ascii = "O";
		#50 
		ascii = "M";
		#50
		ascii = "B";
		#50
		ascii = "B";
		#50
		ascii = "M";
		#50
		ascii = "A";
		#50;

	end
      
endmodule

