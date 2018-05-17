module ULA
	(input clk,
	input [15:0]ir, 		// instrucao
	input KEY0, 			// HEX7 6 5 4
	input KEY1,				// Para executar a instrucao
	input KEY3, 			// INSTRUCAO
	output [0:6] HEX7,	// SW8 a SW11 (r1)
	output [0:6] HEX6,	// SW8 a SW11 (r1)
	output [0:6] HEX5,	// SW4 a SW7  (r2)
	output [0:6] HEX4, 	// SW4 a SW7  (r2)
	output [0:6] HEX3,	// SOMA
	output [0:6] HEX2,	// SOMA
	output [0:6] HEX1,	// SOMA
	output [0:6] HEX0		// SOMA
	);
	
	reg [31:0] clock;
	reg [0:3] opcode;		//OPCODE 		15 - 12
	wire [0:3] r1;  		//Valor R1 		11 - 8	
	wire [0:3] r2;			//Valor R2		7 - 4
	wire [0:3] r3;			//Valor r3		3 - 0
	reg [0:3] Er1;			//enderco r1
	reg [0:3] Er2;			//enderco r2
	reg [0:3] Er3;			//enderco r3
	reg [0:15] result;	//Valor resultado operacao
	reg [0:3] imediato;	//valor imediato
	reg IMM;					//flag imediato
	reg rd;					//flag read
	reg wr;					//flag write
	reg up;
	reg low;
	integer FSM;
	integer PC;
	integer numr2;
	integer numr3;
	reg print;
	
	Tradutor displayr2(.num1(numr2),.flag1(KEY0),.flag(KEY3),.saida1(HEX6),.saida2(HEX7));
	
	Tradutor displayr3(.num1(numr3),.flag1(KEY0),.flag(KEY3),.saida1(HEX4),.saida2(HEX5));
	
	Tradutor2 displaysoma(.num1(result),.flag(KEY3),.saida1(HEX0),.saida2(HEX1),.saida3(HEX2),.saida4(HEX3));
	

	RegBank 	brancoRegistrador(.clk(clk),
										.write(wr),
										.read(rd),
										.wrAddr(Er1),
										.wrData(result),
										.rdAddrA(Er2),
										.rdDataA(r2),
										.rdAddrB(Er3),
										.rdDataB(r3));
										

	always@(posedge clk)
	begin
	clock = clock + 1;
	end

always@(posedge clock[22])
	begin
		FSM = 1;
		PC = 0;
		//fetch
		FSM = FSM + 1;
		PC = PC + 1;
	end

always@(posedge clk)
if(KEY3)
begin
end
else begin
  rd = 0;
  wr = 0;
  opcode = ir[15:12];
  case (opcode)                // Retorna 1 se tiver imediato.
    4'b0000 : IMM = 0;         // Add $s4, $s3, $s2
    4'b0001 : IMM = 0;         // Sub $s4, $s3, $s2
    4'b0011 : IMM = 1;         // Slti $s4, Imm, $s2
    4'b0010 : IMM = 0;         // And $s4, $s3, $s2
    4'b0100 : IMM = 0;         // Or $s4, $s3, $s2
    4'b0101 : IMM = 0;         // Xor $s4, $s3, $s2
    4'b0110 : IMM = 1;         // Andi $s4, Imm, $s2
    4'b0111 : IMM = 1;         // Ori $s4, Imm, $s2
    4'b1000 : IMM = 1;         // Xori $s4, Imm, $s2
    4'b1001 : IMM = 1;         // Addi $s4, Imm, $s2
    4'b1010 : IMM = 1;         // Subi $s4, Imm, $s2
    default : IMM = 0;
  endcase
  Er1 = ir[11:8];
  if (IMM)
	begin
    imediato = ir[7:4];
	end 
  else
	begin
    Er2 = ir[7:4];
	end
  Er3 = ir[3:0];
  
  //Buscar valores dos registradores no regBank
  rd = 1;
  if (IMM)
	begin
    numr2 = imediato;
	end 
  else
	begin
    numr2 = r2;
	end
  
  numr3 = r3;
  case(opcode)                 // Retorna 1 se tiver imediato.
    4'b0000 : result = r2 + r3;         // Add $s4, $s3, $s2
    4'b0001 : result = r2 - r3;         // Sub $s4, $s3, $s2
    4'b0010 : result = r2 & r3;         // And $s4, $s3, $s2
    4'b0100 : result = r2 | r3;         // Or $s4, $s3, $s2
    4'b0101 : result = r2 ^ r3;         // Xor $s4, $s3, $s2
    4'b0110 : result = r3 & imediato;   // Andi $s4, Imm, $s2
    4'b0111 : result = r3 | imediato;   // Ori $s4, Imm, $s2
    4'b1000 : result = r3 ^ imediato;   // Xori $s4, Imm, $s2
    4'b1001 : result = r3 + imediato;   // Addi $s4, Imm, $s2
    4'b1010 : result = r3 - imediato;   // Subi $s4, Imm, $s2
    default : result = 16'b0000000000000000 ;
  endcase
		if(opcode == 4'b0011) begin		 // Slti $s4, Imm, $s2
			if(r3 > imediato)
			begin
				result = 1;
			end
			else begin
				result = 0;
			end
		end
   // Store o dado result em Er1
  rd = 0;
  wr = 1;
  end
  end
endmodule
	