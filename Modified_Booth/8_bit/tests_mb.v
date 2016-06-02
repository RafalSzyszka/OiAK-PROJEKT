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
	wire [3:0] ones, twos, signs;
	wire [15:0] COR;
	
	initial begin
		a[0] = 0;		b[0] = 1; 		//1
		a[1] = 1;		b[1] = 1;		//2
		a[2] = 1;		b[2] = 0;		//4
		a[3] = 1;		b[3] = 1;		//8
		a[4] = 1;		b[4] = 1;		//16
		a[5] = 1;		b[5] = 1;		//32
		a[6] = 1;		b[6] = 0;		//64
		a[7] = 0;		b[7] = 1;		//128
	end
	
	mb_encoder enc(a, signs, ones, twos);		//kodowanie
	
	pp_mb_generator pp0(b, ones[0], twos[0], signs[0], result1);		//iloczyny czesciowe
	pp_mb_generator pp1(b, ones[1], twos[1], signs[1], result2);
	pp_mb_generator pp2(b, ones[2], twos[2], signs[2], result3);
	pp_mb_generator pp3(b, ones[3], twos[3], signs[3], result4);
	
	cor_mb cr(ones, twos, signs, COR);		//korekcja
	
	assign result5 = result1 + (result2*4) + (result3*16) + (result4*64) + COR;	//suma
	
	initial begin
		$monitor("mnozna: %b = %d\t\tmnoznik: %b = %d\n\nones: %b\ttwos: %b\tsigns: %b\n\nresult1: %b\nresult2: %b\nresult3: %b\nresult4: %b\n\nCOR: %b\n\nFinal Result: %b = %d",
		a, a, b, b, ones, twos, signs, result1, result2, result3, result4, COR, result5, result5);
	end
	
endmodule