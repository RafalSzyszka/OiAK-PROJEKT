module half_adder(a, c_in, np, c_out);

	input a, c_in;	/* bit liczby i przeniesienie wejsciowe */
	output np, c_out;	/* suma dodatnia i przeniesienie posrednie */
	
	assign np = a ^ c_in;
	assign c_out = a & c_in;

endmodule


module shalf_adder(a, c_in, nm, c_out);

	input a, c_in;		/* bit liczby i przeniesienie posrednie */
	output nm, c_out;	/* suma ujemna i przeniesienie */

	assign nm = a ^ c_in;
	assign c_out = a | c_in;
	
endmodule