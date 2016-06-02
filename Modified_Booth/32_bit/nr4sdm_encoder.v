/* Enkoder NR4SD- */
module nr4sdm_encoder(a, nm, np, sign, one, two);
	
	input 	[31:0] a;	/* liczba wejsciowa */
	output 	[14:0] nm, np;	/* suma ujemna, suma dodatnia */
	output 	sign, one, two;	/* ostatnia para kodowana jest encoderem MB */
	
	wire c_bet1, c_bet2, c_bet3, c_bet4, c_bet5, c_bet6, c_bet7, c_bet8, c_bet9, c_bet10, c_bet11, c_bet12, c_bet13, c_bet14, c_bet15;
	
	count_nrm c_nrm1(a[0], a[1], 1'b0, nm[0], np[0], c_bet1);
	count_nrm c_nrm2(a[2], a[3], c_bet1, nm[1], np[1], c_bet2);
	count_nrm c_nrm3(a[4], a[5], c_bet2, nm[2], np[2], c_bet3);
	count_nrm c_nrm4(a[6], a[7], c_bet3, nm[3], np[3], c_bet4);
	count_nrm c_nrm5(a[8], a[9], c_bet4, nm[4], np[4], c_bet5);
	count_nrm c_nrm6(a[10], a[11], c_bet5, nm[5], np[5], c_bet6);
	count_nrm c_nrm7(a[12], a[13], c_bet6, nm[6], np[6], c_bet7);
	count_nrm c_nrm8(a[14], a[15], c_bet7, nm[7], np[7], c_bet8);
	count_nrm c_nrm9(a[16], a[17], c_bet8, nm[8], np[8], c_bet9);
	count_nrm c_nrm10(a[18], a[19], c_bet9, nm[9], np[9], c_bet10);
	count_nrm c_nrm11(a[20], a[21], c_bet10, nm[10], np[10], c_bet11);
	count_nrm c_nrm12(a[22], a[23], c_bet11, nm[11], np[11], c_bet12);
	count_nrm c_nrm13(a[24], a[25], c_bet12, nm[12], np[12], c_bet13);
	count_nrm c_nrm14(a[26], a[27], c_bet13, nm[13], np[13], c_bet14);
	count_nrm c_nrm15(a[28], a[29], c_bet14, nm[14], np[14], c_bet15);
	count_mb	c_mb(c_bet15, a[30], a[31], sign, one, two);
	
endmodule


module count_nrm(a2j, a2j1, c_in, nm, np, c_out);

	input a2j, a2j1, c_in;
	output nm, np, c_out;
	
	wire c_bet;		/* przeniesienie posrednie */
	
	half_adder ha(a2j, c_in, np, c_bet);
	shalf_adder sha(a2j1, c_bet, nm, c_out);

endmodule