module Tradutor(
	input [0:15]num1,
	input flag1,
	input flag,
	output reg [0:6] saida1,
	output reg [0:6] saida2
	);
	
	reg [0:6] aux;
	integer aux2;
	integer aux3;
	
	always@(flag == 0 | flag1 == 0)begin //sempre que mudar a entrada
		
		if((flag1 & flag) == 1)
		begin
		aux = 7'b11111111;
		saida1 = aux;
		saida2 = aux;
		end
		else begin

			aux3 = num1;
			aux2 = aux3/10;
			aux3 = aux3%10;
			case(aux2)
				0:aux = 7'b0000001; // 0
				1:aux = 7'b1001111; // 1
				2:aux = 7'b0010010; // 2
				3:aux = 7'b0000110; // 3
				4:aux = 7'b1001100; // 4
				5:aux = 7'b0100100; // 5
				6:aux = 7'b0100000; // 6
				7:aux = 7'b0001111; // 7
				8:aux = 7'b0000000; // 8
				9:aux = 7'b0001100; // 9
				default: aux = 7'b11111111;
			endcase
			saida2 = aux[0:6];
			
			aux2 = aux3;
			case(aux2)
				0:aux = 7'b0000001; // 0
				1:aux = 7'b1001111; // 1
				2:aux = 7'b0010010; // 2
				3:aux = 7'b0000110; // 3
				4:aux = 7'b1001100; // 4
				5:aux = 7'b0100100; // 5
				6:aux = 7'b0100000; // 6
				7:aux = 7'b0001111; // 7
				8:aux = 7'b0000000; // 8
				9:aux = 7'b0001100; // 9
				default: aux = 7'b11111111;
			endcase
			saida1 = aux[0:6];
			end
	end
    
	
endmodule

module Tradutor2(
	input [0:15]num1,
	input flag,
	output reg [0:6] saida1,
	output reg [0:6] saida2,
	output reg [0:6] saida3,
	output reg [0:6] saida4
	);
	
	reg [0:6] aux;
	integer aux2;
	integer aux3;
	
	always@(flag == 0)begin //sempre que mudar a entrada
		
		if(flag)
		begin
		aux = 7'b11111111;
		saida1 = aux;
		saida2 = aux;
		saida3 = aux;
		saida4 = aux;
		end
		else begin
		
		aux3 = num1;
		aux2 = aux3/1000;
		aux3 = aux3%1000;
		
		case(aux2)
			0:aux = 7'b0000001; // 0
			1:aux = 7'b1001111; // 1
			2:aux = 7'b0010010; // 2
			3:aux = 7'b0000110; // 3
			4:aux = 7'b1001100; // 4
			5:aux = 7'b0100100; // 5
			6:aux = 7'b0100000; // 6
			7:aux = 7'b0001111; // 7
			8:aux = 7'b0000000; // 8
			9:aux = 7'b0001100; // 9
			default: aux = 7'b0000000;
		endcase
		saida4 = aux[0:6];
		
		aux2 = aux3/100;
		aux3 = aux3%100;
		case(aux2)
			0:aux = 7'b0000001; // 0
			1:aux = 7'b1001111; // 1
			2:aux = 7'b0010010; // 2
			3:aux = 7'b0000110; // 3
			4:aux = 7'b1001100; // 4
			5:aux = 7'b0100100; // 5
			6:aux = 7'b0100000; // 6
			7:aux = 7'b0001111; // 7
			8:aux = 7'b0000000; // 8
			9:aux = 7'b0001100; // 9
			default: aux = 7'b0000000;
		endcase
		saida3 = aux[0:6];
		
		aux2 = aux3/10;
		aux3 = aux3%10;
		case(aux2)
			0:aux = 7'b0000001; // 0
			1:aux = 7'b1001111; // 1
			2:aux = 7'b0010010; // 2
			3:aux = 7'b0000110; // 3
			4:aux = 7'b1001100; // 4
			5:aux = 7'b0100100; // 5
			6:aux = 7'b0100000; // 6
			7:aux = 7'b0001111; // 7
			8:aux = 7'b0000000; // 8
			9:aux = 7'b0001100; // 9
			default: aux = 7'b0000000;
		endcase
		saida2 = aux[0:6];
		
		aux2 = aux3;
		case(aux2)
			0:aux = 7'b0000001; // 0
			1:aux = 7'b1001111; // 1
			2:aux = 7'b0010010; // 2
			3:aux = 7'b0000110; // 3
			4:aux = 7'b1001100; // 4
			5:aux = 7'b0100100; // 5
			6:aux = 7'b0100000; // 6
			7:aux = 7'b0001111; // 7
			8:aux = 7'b0000000; // 8
			9:aux = 7'b0001100; // 9
			default: aux = 7'b0000000;
		endcase
		saida1 = aux[0:6];
		end
	end
    
	
endmodule

