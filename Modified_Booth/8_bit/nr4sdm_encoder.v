/* Enkoder NR4SD- */
module nr4sdm_encoder(a, nm, np, sign, one, two);
	
	input 	[7:0] a;	/* liczba wejsciowa */
	output 	[2:0] nm, np;	/* suma ujemna, suma dodatnia */
	output 	sign, one, two;	/* ostatnia para kodowana jest encoderem MB */
	
	wire c_bet1, c_bet2, c_bet3;
	
	count_nrm c_nrm1(a[0], a[1], 1'b0, nm[0], np[0], c_bet1);
	count_nrm c_nrm2(a[2], a[3], c_bet1, nm[1], np[1], c_bet2);
	count_nrm c_nrm3(a[4], a[5], c_bet2, nm[2], np[2], c_bet3);
	count_mb	c_mb(c_bet3, a[6], a[7], sign, one, two);
	
endmodule


module count_nrm(a2j, a2j1, c_in, nm, np, c_out);

	input a2j, a2j1, c_in;
	output nm, np, c_out;
	
	wire c_bet;		/* przeniesienie posrednie */
	
	half_adder ha(a2j, c_in, np, c_bet);
	shalf_adder sha(a2j1, c_bet, nm, c_out);

endmodule