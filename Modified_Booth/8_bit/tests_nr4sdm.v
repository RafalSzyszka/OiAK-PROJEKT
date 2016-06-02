`include "nr4sdp_encoder.v"
`include "nr4sdm_encoder.v"
`include "half_adders.v"
`include "mb_encoder.v"
`include "extra_circuits.v"
`include "pp_generators.v"
`include "COR.v"

module encoders_tb;

	reg [7:0] a;	/* liczba do przekodowania */
	reg [7:0] b;	/* mnoznik */
	wire [8:0] result1, result2, result3, result4;	/* wyniki */
	wire [15:0] result5;
	wire [2:0] nm, np, one_p, one_m, two_m;
	wire sign, one, two;
	wire [15:0] COR;
	
	initial begin
		a[0] = 0;		b[0] = 1; 		//1
		a[1] = 1;		b[1] = 0;		//2
		a[2] = 1;		b[2] = 1;		//4
		a[3] = 1;		b[3] = 1;		//8
		a[4] = 0;		b[4] = 0;		//16
		a[5] = 1;		b[5] = 1;		//32
		a[6] = 1;		b[6] = 0;		//64
		a[7] = 0;		b[7] = 0;		//128
	end
	
	nr4sdm_encoder enc(a, nm, np, sign, one, two);	//kodowanie
	
	ex_circuitNR4SDm exc1(nm[0], np[0], one_p[0], one_m[0], two_m[0]);	//dodatkowe obwody
	ex_circuitNR4SDm exc2(nm[1], np[1], one_p[1], one_m[1], two_m[1]);
	ex_circuitNR4SDm exc3(nm[2], np[2], one_p[2], one_m[2], two_m[2]);
	
	pp_nr4sdm_generator pp1(b, one_p[0], one_m[0], two_m[0], result1);	//generatory sum czesciowych
	pp_nr4sdm_generator pp2(b, one_p[1], one_m[1], two_m[1], result2);
	pp_nr4sdm_generator pp3(b, one_p[2], one_m[2], two_m[2], result3);
	pp_mb_generator pp4(b, one, two, sign, result4);
	
	cor_nr4sdm cr(nm, np, one, two, sign, COR);		//korekcja
	
	assign result5 = result1 + (result2*4) + (result3*16) + (result4*64) + COR;	//suma
	
	initial begin
		$monitor("mnozna: %b = %d\t\tmnoznik: %b = %d\n\nones_m: %b\tones_p: %b\ttwos_m: %b\nsign: %b\t\tone: %b\t\ttwo: %b\n\nresult1: %b\nresult2: %b\nresult3: %b\nresult4: %b\n\nCOR: %b\n\nFinal Result: %b = %d",
		a, a, b, b, one_m, one_p, two_m, sign, one, two, result1, result2, result3, result4, COR, result5, result5);
	end
	
endmodule