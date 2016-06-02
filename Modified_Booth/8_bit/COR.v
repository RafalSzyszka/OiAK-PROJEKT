// Korekcja dla poszczeglnych multiplikatorow

module cor_mb(ones, twos, signs, COR);
	input [3:0] ones, twos, signs;
	output [15:0] COR;
	
	assign COR = ( (ones[0] | twos[0]) & signs[0]) * 1 + 
				( (ones[1] | twos[1]) & signs[1]) * 4 + 
				( (ones[2] | twos[2]) & signs[2]) * 16 + 
				( (ones[3] | twos[3]) & signs[3]) * 64 + 
				(256*(1 + 2 + 8 + 32 + 128));
	
endmodule


module cor_nr4sdm(nm, np, one, two, sign, COR);
	input one, two, sign;
	input [2:0] nm, np;
	output [15:0] COR;
	
	wire [2:0] onem, onep, twom;
	
	ex_circuitNR4SDm exc1(nm[0], np[0], onep[0], onem[0], twom[0]);
	ex_circuitNR4SDm exc2(nm[1], np[1], onep[1], onem[1], twom[1]);
	ex_circuitNR4SDm exc3(nm[2], np[2], onep[2], onem[2], twom[2]);
	
	assign COR = (onem[0] | twom[0]) * 1 + 
				(onem[1] | twom[1]) * 4 + 
				(onem[2] | twom[2]) * 16 + 
				( (one | two) & sign) * 64 + 
				(256*(1 + 2 + 8 + 32 + 128));

endmodule

module cor_nr4sdp(nm, np, one, two, sign, COR);
	input one, two, sign;
	input [2:0] nm, np;
	output [15:0] COR;
	
	wire [2:0] onem, onep, twop;
	
	ex_circuitNR4SDp exc1(nm[0], np[0], onep[0], onem[0], twop[0]);
	ex_circuitNR4SDp exc2(nm[1], np[1], onep[1], onem[1], twop[1]);
	ex_circuitNR4SDp exc3(nm[2], np[2], onep[2], onem[2], twop[2]);
	
	assign COR = onem[0] * 1 + 
				onem[1] * 4 + 
				onem[2] * 16 + 
				( (one | two) & sign) * 64 + 
				(256*(1 + 2 + 8 + 32 + 128));

endmodule