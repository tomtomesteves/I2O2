module Tradutor(
	input [0:4] num1,
	input flag,
	output reg [0:6] saida
	);
	
	always@(~flag)begin //sempre que mudar a entrada
		case(num1[0:4])
		4'b0000:saida = 7'b0000001; // 0
		4'b0001:saida = 7'b1001111; // 1
		4'b0010:saida = 7'b0010010; // 2
		4'b0011:saida = 7'b0000110; // 3
		4'b0100:saida = 7'b1001100; // 4
		4'b0101:saida = 7'b0100100; // 5
		4'b0110:saida = 7'b0100000; // 6
		4'b0111:saida = 7'b0001111; // 7
		4'b1000:saida = 7'b0000000; // 8
		4'b1001:saida = 7'b0001100; // 9
		default: saida = 7'b0000000;
		endcase
	end
    
	
endmodule