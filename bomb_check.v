`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:19:09 07/29/2021 
// Design Name: 
// Module Name:    bomb_check 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module bomb_check(
    input [7:0] ascii,
    input clk,
    input rst,
    output alert
    );

parameter s0 = 2'b00;
parameter s1 = 2'b01;
parameter s2 = 2'b10;
parameter s3 = 2'b11;

reg [1:0] state = 2'b0, next_state = 2'b0;
reg alert0;

always @(*)
begin
	if(~rst)
	begin
		alert0 <= 0;
		case (state)
			0:begin
				if (ascii == "B")
					next_state <= s1;
				else
					next_state <= s0;
					$monitor ($time," \t 0here \t state = %d",state);
			end			
			1:begin
				if (ascii == "O")
					next_state <= s2;
				else if (ascii == "B")
					next_state <= s1;
				else
					next_state <= s0;
					$monitor ($time," \t 1here \t state = %d",state);
			end
			2:begin
				
				if (ascii == "M")
					next_state <= s3; 
				else if (ascii == "B")
					next_state <= s1;	
				else
					next_state <= s0;
					$monitor ($time," \t 2here \t state = %d",state);
			end
			3:begin  
				
				if (ascii == "B") begin
					next_state <= s1;
					alert0 <= 1;
				end else 
					next_state <= s0;
					$monitor ($time," \t 3here \t state = %d",state);
			end
			default: begin 
				next_state <= s3;
				$monitor ($time," \t hdere \t state = %d",state);
			end
		endcase
	end
end

always @(negedge clk or posedge rst)
if (~rst)
	state <= next_state;
else
	state <= s0;
	
assign alert = alert0;


endmodule
