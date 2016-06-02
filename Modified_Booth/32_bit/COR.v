// Korekcja dla poszczeglnych multiplikatorow

module cor_mb(ones, twos, signs, COR);
	input [15:0] ones, twos, signs;
	output [63:0] COR;
	
	assign COR = ( (ones[0] | twos[0]) & signs[0]) * 1 + 
				( (ones[1] | twos[1]) & signs[1]) * 4 + 
				( (ones[2] | twos[2]) & signs[2]) * 16 + 
				( (ones[3] | twos[3]) & signs[3]) * 64 + 
				( (ones[4] | twos[4]) & signs[4]) * 256 + 
				( (ones[5] | twos[5]) & signs[5]) * 1024 + 
				( (ones[6] | twos[6]) & signs[6]) * 4096 + 
				( (ones[7] | twos[7]) & signs[7]) * 16384 + 
				( (ones[8] | twos[8]) & signs[8]) * 65536 + 
				( (ones[9] | twos[9]) & signs[9]) * 262144 + 
				( (ones[10] | twos[10]) & signs[10]) * 1048576 + 
				( (ones[11] | twos[11]) & signs[11]) * 4194304 + 
				( (ones[12] | twos[12]) & signs[12]) * 16777216 + 
				( (ones[13] | twos[13]) & signs[13]) * 67108864 + 
				( (ones[14] | twos[14]) & signs[14]) * 268435456 + 
				( (ones[15] | twos[15]) & signs[15]) * 1073741824 + 
				('h100000000*('h1 + 'h2 + 'h8 + 'h20 + 'h80 + 'h200 + 'h800 + 'h2000 + 'h8000 + 'h20000 + 'h80000
					+ 'h200000 + 'h800000 + 'h2000000 + 'h8000000 + 'h20000000 + 'h80000000));
	
endmodule


module cor_nr4sdm(nm, np, one, two, sign, COR);
	input one, two, sign;
	input [14:0] nm, np;
	output [63:0] COR;
	
	wire [14:0] onem, onep, twom;
	
	ex_circuitNR4SDm exc1(nm[0], np[0], onep[0], onem[0], twom[0]);
	ex_circuitNR4SDm exc2(nm[1], np[1], onep[1], onem[1], twom[1]);
	ex_circuitNR4SDm exc3(nm[2], np[2], onep[2], onem[2], twom[2]);
	ex_circuitNR4SDm exc4(nm[3], np[3], onep[3], onem[3], twom[3]);
	ex_circuitNR4SDm exc5(nm[4], np[4], onep[4], onem[4], twom[4]);
	ex_circuitNR4SDm exc6(nm[5], np[5], onep[5], onem[5], twom[5]);
	ex_circuitNR4SDm exc7(nm[6], np[6], onep[6], onem[6], twom[6]);
	ex_circuitNR4SDm exc8(nm[7], np[7], onep[7], onem[7], twom[7]);
	ex_circuitNR4SDm exc9(nm[8], np[8], onep[8], onem[8], twom[8]);
	ex_circuitNR4SDm exc10(nm[9], np[9], onep[9], onem[9], twom[9]);
	ex_circuitNR4SDm exc11(nm[10], np[10], onep[10], onem[10], twom[10]);
	ex_circuitNR4SDm exc12(nm[11], np[11], onep[11], onem[11], twom[11]);
	ex_circuitNR4SDm exc13(nm[12], np[12], onep[12], onem[12], twom[12]);
	ex_circuitNR4SDm exc14(nm[13], np[13], onep[13], onem[13], twom[13]);
	ex_circuitNR4SDm exc15(nm[14], np[14], onep[14], onem[14], twom[14]);
	
	assign COR = (onem[0] | twom[0]) * 1 + 
				(onem[1] | twom[1]) * 4 + 
				(onem[2] | twom[2]) * 16 +
				(onem[3] | twom[3]) * 64 +
				(onem[4] | twom[4]) * 256 +
				(onem[5] | twom[5]) * 1024 +
				(onem[6] | twom[6]) * 4096 +
				(onem[7] | twom[7]) * 16384 +
				(onem[8] | twom[8]) * 65536 + 
				(onem[9] | twom[9]) * 262144 + 
				(onem[10] | twom[10]) * 1048576 + 
				(onem[11] | twom[11]) * 4194304 + 
				(onem[12] | twom[12]) * 16777216 + 
				(onem[13] | twom[13]) * 67108864 + 
				(onem[14] | twom[14]) * 268435456 + 
				( (one | two) & sign) * 1073741824 + 
				('h100000000*('h1 + 'h2 + 'h8 + 'h20 + 'h80 + 'h200 + 'h800 + 'h2000 + 'h8000 + 'h20000 + 'h80000
					+ 'h200000 + 'h800000 + 'h2000000 + 'h8000000 + 'h20000000 + 'h80000000));

endmodule

module cor_nr4sdp(nm, np, one, two, sign, COR);
	input one, two, sign;
	input [14:0] nm, np;
	output [63:0] COR;
	
	wire [14:0] onem, onep, twop;
	
	ex_circuitNR4SDp exc1(nm[0], np[0], onep[0], onem[0], twop[0]);
	ex_circuitNR4SDp exc2(nm[1], np[1], onep[1], onem[1], twop[1]);
	ex_circuitNR4SDp exc3(nm[2], np[2], onep[2], onem[2], twop[2]);
	ex_circuitNR4SDp exc4(nm[3], np[3], onep[3], onem[3], twop[3]);
	ex_circuitNR4SDp exc5(nm[4], np[4], onep[4], onem[4], twop[4]);
	ex_circuitNR4SDp exc6(nm[5], np[5], onep[5], onem[5], twop[5]);
	ex_circuitNR4SDp exc7(nm[6], np[6], onep[6], onem[6], twop[6]);
	ex_circuitNR4SDp exc8(nm[7], np[7], onep[7], onem[7], twop[7]);
	ex_circuitNR4SDp exc9(nm[8], np[8], onep[8], onem[8], twop[8]);
	ex_circuitNR4SDp exc10(nm[9], np[9], onep[9], onem[9], twop[9]);
	ex_circuitNR4SDp exc11(nm[10], np[10], onep[10], onem[10], twop[10]);
	ex_circuitNR4SDp exc12(nm[11], np[11], onep[11], onem[11], twop[11]);
	ex_circuitNR4SDp exc13(nm[12], np[12], onep[12], onem[12], twop[12]);
	ex_circuitNR4SDp exc14(nm[13], np[13], onep[13], onem[13], twop[13]);
	ex_circuitNR4SDp exc15(nm[14], np[14], onep[14], onem[14], twop[14]);
	
	assign COR = onem[0] * 1 + 
				onem[1] * 4 + 
				onem[2] * 16 + 
				onem[3] * 64 +
				onem[4] * 256 +
				onem[5] * 1024 +
				onem[6] * 4096 +
				onem[7] * 16384 +
				onem[8] * 65536 + 
				onem[9] * 262144 + 
				onem[10] * 1048576 + 
				onem[11] * 4194304 + 
				onem[12] * 16777216 + 
				onem[13] * 67108864 + 
				onem[14] * 268435456 + 
				( (one | two) & sign) * 1073741824 + 
				('h100000000*('h1 + 'h2 + 'h8 + 'h20 + 'h80 + 'h200 + 'h800 + 'h2000 + 'h8000 + 'h20000 + 'h80000
					+ 'h200000 + 'h800000 + 'h2000000 + 'h8000000 + 'h20000000 + 'h80000000));

endmodule