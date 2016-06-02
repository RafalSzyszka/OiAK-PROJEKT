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
	wire [7:0] ones, twos, signs;
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
	
	mb_encoder enc(a, signs, ones, twos);		//kodowanie
	
	pp_mb_generator pp0(b, ones[0], twos[0], signs[0], result1);		//iloczyny czesciowe
	pp_mb_generator pp1(b, ones[1], twos[1], signs[1], result2);
	pp_mb_generator pp2(b, ones[2], twos[2], signs[2], result3);
	pp_mb_generator pp3(b, ones[3], twos[3], signs[3], result4);
	pp_mb_generator pp4(b, ones[4], twos[4], signs[4], result5);
	pp_mb_generator pp5(b, ones[5], twos[5], signs[5], result6);
	pp_mb_generator pp6(b, ones[6], twos[6], signs[6], result7);
	pp_mb_generator pp7(b, ones[7], twos[7], signs[7], result8);
	
	cor_mb cr(ones, twos, signs, COR);		//korekcja
	
	assign result9 = result1 + (result2*4) + (result3*16) + (result4*64) + (result5*256) + (result6*1024) + (result7*4096) + (result8*16384) + COR;	//suma
	
	initial begin
		$monitor("mnozna: %b = %d\t\tmnoznik: %b = %d\n\nones: %b\ttwos: %b\tsigns: %b\n\nresult1: %b\nresult2: %b\nresult3: %b\nresult4: %b\nresult5: %b\nresult6: %b\nresult7: %b\nresult8: %b\n\nCOR: %b\n\nFinal Result: %b = %d",
		a, a, b, b, ones, twos, signs, result1, result2, result3, result4, result5, result6, result7, result8, COR, result9, result9);
	end
	
endmodule