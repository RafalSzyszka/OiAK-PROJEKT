// Dodatkowe układy cyfrowe potrzebne do zakonczenie kodowania NR4SD-/+

module ex_circuitNR4SDm(nm, np, onep, onem, twom);
	input nm, np;
	output onep, onem, twom;
	
	assign onep = ~nm & np;
	assign onem = nm & np;
	assign twom = ~np & nm;
	
endmodule


module ex_circuitNR4SDp(nm, np, onep, onem, twop);
	input nm, np;
	output onep, onem, twop;
	
	assign onep = np & nm;
	assign onem = nm & ~np;
	assign twop = ~nm & np;

endmodule