module RegBank
  (input clk,
   input write,
	input read,
   input [0:3] wrAddr,
   input [0:15] wrData,
   input [0:3] rdAddrA,
   output [0:15] rdDataA,
   input [0:3] rdAddrB,
   output [0:15] rdDataB);

   reg [0:15] regfile [0:15];
	
	
	assign rdDataA = regfile[rdAddrA];
	assign rdDataB = regfile[rdAddrB];
   
	
   always @(posedge clk) begin
      if (write) 
			regfile[wrAddr] <= wrData; 
	end 
endmodule