module part3 #(parameter N = 4) (input logic[(N-1):0] A, B, input logic[1:0] Function, output logic[((2*N)-1):0] ALUout);

always_comb
begin
    case (Function)
        0: ALUout = A+B;
	1: ALUout = (|{A,B});
	2: ALUout = (&{A,B});
	3: ALUout = {A[N:0], B[N:0]};
        default : ALU0ut = 1'b0; // Default case, set Out to 0
    endcase
end

endmodule