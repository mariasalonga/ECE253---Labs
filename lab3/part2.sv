module fulladder(input logic a,b,cin, output logic cout, s);
	logic o1;
	assign o1 = a^b;
	assign s = o1^cin;
	assign cout = (~o1&b)|(o1&cin);
	
endmodule

module case0(input logic [3:0] a, b, input logic cin, output logic [7:0] s);
	logic c1, c2, c3;
	logic out;

	fulladder FA0(.a(a[0]), .b(b[0]), .cin(cin), .cout(c1), .s(s[0]));
	fulladder FA1(.a(a[1]), .b(b[1]), .cin(c1), .cout(c2), .s(s[1]));
	fulladder FA2(.a(a[2]), .b(b[2]), .cin(c2), .cout(c3), .s(s[2]));

	fulladder FA3(.a(a[3]), .b(b[3]), .cin(c3), .cout(out), .s(s[3]));

	assign s[4] = out;
	assign s[5] = 0;
	assign s[6] = 0;
	assign s[7] = 0;

endmodule


module part2(input logic [1:0] func, input logic [3:0] a, b, output logic [7:0] ALUout);

logic [7:0] temp;
case0 adder(a,b,0,temp);

always_comb
begin
    case (func)
        2'b00 : ALUout = temp;
        2'b01 : ALUout = {7'b0000000,((|a)|(|b))};
        2'b10 : ALUout = {7'b0000000,((&a)&(&b))};
        2'b11 : ALUout = {a, b};

        default : ALUout = 8'b0; // Default case, set Out to 0
    endcase
end

endmodule