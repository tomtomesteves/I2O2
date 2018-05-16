module RegBank
  (input clk,
   input write,
	input read,
   input [3:0] wrAddr,
   input [15:0] wrData,
   input [3:0] rdAddrA,
   output [15:0] rdDataA,
   input [3:0] rdAddrB,
   output [15:0] rdDataB);

   reg [15:0] regfile [0:15];
	
	
	assign rdDataA = regfile[rdAddrA];
	assign rdDataB = regfile[rdAddrB];
   
	
   always @(posedge clk) begin
      if (write) 
			regfile[wrAddr] <= wrData; 
	end 
endmodule