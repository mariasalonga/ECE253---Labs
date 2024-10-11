module fulladder(input logic a,b,cin, output logic cout, s);
	logic o1;
	assign o1 = a^b;
	assign s = o1^cin;
	assign cout = (~o1&b)|(o1&cin);
	
endmodule

module part1(input logic [3:0] a, b, input logic cin, output logic [3:0] s, output logic cout);
	logic c1, c2, c3;
	fulladder FA0(.a(a[0]), .b(b[0]), .cin(cin), .cout(c1), .s(s[0]));
	fulladder FA1(.a(a[1]), .b(b[1]), .cin(c1), .cout(c2), .s(s[1]));
	fulladder FA2(.a(a[2]), .b(b[2]), .cin(c2), .cout(c3), .s(s[2]));
	fulladder FA3(.a(a[3]), .b(b[3]), .cin(c3), .cout(cout), .s(s[3]));
endmodule