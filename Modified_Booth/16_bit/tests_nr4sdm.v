`include "nr4sdp_encoder.v"
`include "nr4sdm_encoder.v"
`include "half_adders.v"
`include "mb_encoder.v"
`include "extra_circuits.v"
`include "pp_generators.v"
`include "COR.v"

module encoders_tb;

	reg [15:0] a;	/* liczba do przekodowania */
	reg [15:0] b;	/* mnoznik */
	wire [16:0] result1, result2, result3, result4, result5, result6, result7, result8;	/* wyniki */
	wire [31:0] result9;
	wire [6:0] nm, np, one_p, one_m, two_m;
	wire sign, one, two;
	wire [31:0] COR;
	
	initial begin
		a[0] = 0;		b[0] = 1; 		//1
		a[1] = 1;		b[1] = 0;		//2
		a[2] = 1;		b[2] = 0;		//4
		a[3] = 1;		b[3] = 0;		//8
		a[4] = 1;		b[4] = 1;		//16
		a[5] = 0;		b[5] = 0;		//32
		a[6] = 0;		b[6] = 1;		//64
		a[7] = 0;		b[7] = 0;		//128
		a[8] = 1;		b[8] = 0;		//256
		a[9] = 1;		b[9] = 1;		//512
		a[10] = 0;		b[10] = 1;		//1024
		a[11] = 1;		b[11] = 1;		//2048
		a[12] = 0;		b[12] = 1;		//4096
		a[13] = 0;		b[13] = 1;		//8192
		a[14] = 0;		b[14] = 0;		//16384
		a[15] = 0;		b[15] = 0;		//32768
	end
	
	nr4sdm_encoder enc(a, nm, np, sign, one, two);	//kodowanie
	
	ex_circuitNR4SDm exc1(nm[0], np[0], one_p[0], one_m[0], two_m[0]);	//dodatkowe obwody
	ex_circuitNR4SDm exc2(nm[1], np[1], one_p[1], one_m[1], two_m[1]);
	ex_circuitNR4SDm exc3(nm[2], np[2], one_p[2], one_m[2], two_m[2]);
	ex_circuitNR4SDm exc4(nm[3], np[3], one_p[3], one_m[3], two_m[3]);
	ex_circuitNR4SDm exc5(nm[4], np[4], one_p[4], one_m[4], two_m[4]);
	ex_circuitNR4SDm exc6(nm[5], np[5], one_p[5], one_m[5], two_m[5]);
	ex_circuitNR4SDm exc7(nm[6], np[6], one_p[6], one_m[6], two_m[6]);
	
	pp_nr4sdm_generator pp1(b, one_p[0], one_m[0], two_m[0], result1);	//generatory sum czesciowych
	pp_nr4sdm_generator pp2(b, one_p[1], one_m[1], two_m[1], result2);
	pp_nr4sdm_generator pp3(b, one_p[2], one_m[2], two_m[2], result3);
	pp_nr4sdm_generator pp4(b, one_p[3], one_m[3], two_m[3], result4);
	pp_nr4sdm_generator pp5(b, one_p[4], one_m[4], two_m[4], result5);
	pp_nr4sdm_generator pp6(b, one_p[5], one_m[5], two_m[5], result6);
	pp_nr4sdm_generator pp7(b, one_p[6], one_m[6], two_m[6], result7);
	pp_mb_generator pp8(b, one, two, sign, result8);
	
	cor_nr4sdm cr(nm, np, one, two, sign, COR);		//korekcja
	
	assign result9 = result1 + (result2*4) + (result3*16) + (result4*64) + (result5*256) + (result6*1024) + (result7*4096) + (result8*16384) + COR;	//suma
	
	initial begin
		$monitor("mnozna: %b = %d\t\tmnoznik: %b = %d\n\nones_m: %b\tones_p: %b\ttwos_m: %b\nsign: %b\t\tone: %b\t\ttwo: %b\n\nresult1: %b\nresult2: %b\nresult3: %b\nresult4: %b\nresult5: %b\nresult6: %b\nresult7: %b\nresult8: %b\n\nCOR: %b\n\nFinal Result: %b = %d",
		a, a, b, b, one_m, one_p, two_m, sign, one, two, result1, result2, result3, result4, result5, result6, result7, result8, COR, result9, result9);
	end
	
endmodule