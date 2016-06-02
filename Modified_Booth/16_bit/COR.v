// Korekcja dla poszczeglnych multiplikatorow

module cor_mb(ones, twos, signs, COR);
	input [7:0] ones, twos, signs;
	output [31:0] COR;
	
	assign COR = ( (ones[0] | twos[0]) & signs[0]) * 1 + 
				( (ones[1] | twos[1]) & signs[1]) * 4 + 
				( (ones[2] | twos[2]) & signs[2]) * 16 + 
				( (ones[3] | twos[3]) & signs[3]) * 64 + 
				( (ones[4] | twos[4]) & signs[4]) * 256 + 
				( (ones[5] | twos[5]) & signs[5]) * 1024 + 
				( (ones[6] | twos[6]) & signs[6]) * 4096 + 
				( (ones[7] | twos[7]) & signs[7]) * 16384 + 
				(65536*(1 + 2 + 8 + 32 + 128 + 512 + 2048 + 8192 + 32768));
	
endmodule


module cor_nr4sdm(nm, np, one, two, sign, COR);
	input one, two, sign;
	input [6:0] nm, np;
	output [31:0] COR;
	
	wire [6:0] onem, onep, twom;
	
	ex_circuitNR4SDm exc1(nm[0], np[0], onep[0], onem[0], twom[0]);
	ex_circuitNR4SDm exc2(nm[1], np[1], onep[1], onem[1], twom[1]);
	ex_circuitNR4SDm exc3(nm[2], np[2], onep[2], onem[2], twom[2]);
	ex_circuitNR4SDm exc4(nm[3], np[3], onep[3], onem[3], twom[3]);
	ex_circuitNR4SDm exc5(nm[4], np[4], onep[4], onem[4], twom[4]);
	ex_circuitNR4SDm exc6(nm[5], np[5], onep[5], onem[5], twom[5]);
	ex_circuitNR4SDm exc7(nm[6], np[6], onep[6], onem[6], twom[6]);
	
	assign COR = (onem[0] | twom[0]) * 1 + 
				(onem[1] | twom[1]) * 4 + 
				(onem[2] | twom[2]) * 16 +
				(onem[3] | twom[3]) * 64 +
				(onem[4] | twom[4]) * 256 +
				(onem[5] | twom[5]) * 1024 +
				(onem[6] | twom[6]) * 4096 +				
				( (one | two) & sign) * 16384 + 
				(65536*(1 + 2 + 8 + 32 + 128 + 512 + 2048 + 8192 + 32768));

endmodule

module cor_nr4sdp(nm, np, one, two, sign, COR);
	input one, two, sign;
	input [6:0] nm, np;
	output [31:0] COR;
	
	wire [6:0] onem, onep, twop;
	
	ex_circuitNR4SDp exc1(nm[0], np[0], onep[0], onem[0], twop[0]);
	ex_circuitNR4SDp exc2(nm[1], np[1], onep[1], onem[1], twop[1]);
	ex_circuitNR4SDp exc3(nm[2], np[2], onep[2], onem[2], twop[2]);
	ex_circuitNR4SDp exc4(nm[3], np[3], onep[3], onem[3], twop[3]);
	ex_circuitNR4SDp exc5(nm[4], np[4], onep[4], onem[4], twop[4]);
	ex_circuitNR4SDp exc6(nm[5], np[5], onep[5], onem[5], twop[5]);
	ex_circuitNR4SDp exc7(nm[6], np[6], onep[6], onem[6], twop[6]);
	
	assign COR = onem[0] * 1 + 
				onem[1] * 4 + 
				onem[2] * 16 + 
				onem[3] * 64 +
				onem[4] * 256 +
				onem[5] * 1024 +
				onem[6] * 4096 +
				( (one | two) & sign) * 16384 + 
				(65536*(1 + 2 + 8 + 32 + 128 + 512 + 2048 + 8192 + 32768));

endmodule