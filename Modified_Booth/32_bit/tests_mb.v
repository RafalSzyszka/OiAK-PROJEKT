`include "nr4sdp_encoder.v"
`include "nr4sdm_encoder.v"
`include "half_adders.v"
`include "mb_encoder.v"
`include "extra_circuits.v"
`include "pp_generators.v"
`include "COR.v"

module encoders_tb;

	reg [31:0] a;	/* liczba do przekodowania */
	reg [31:0] b;	/* mnoznik */
	wire [32:0] result1, result2, result3, result4, result5, result6, result7, result8, result9, result10, result11, result12, result13, result14, result15, result16;	/* wyniki */
	wire [63:0] result17;
	wire [15:0] ones, twos, signs;
	wire [63:0] COR;
	
	initial begin
		a = 'he5482fc;
		b = 'h2fc68201;
		//2aca0b08bc07afc
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
	pp_mb_generator pp8(b, ones[8], twos[8], signs[8], result9);
	pp_mb_generator pp9(b, ones[9], twos[9], signs[9], result10);
	pp_mb_generator pp10(b, ones[10], twos[10], signs[10], result11);
	pp_mb_generator pp11(b, ones[11], twos[11], signs[11], result12);
	pp_mb_generator pp12(b, ones[12], twos[12], signs[12], result13);
	pp_mb_generator pp13(b, ones[13], twos[13], signs[13], result14);
	pp_mb_generator pp14(b, ones[14], twos[14], signs[14], result15);
	pp_mb_generator pp15(b, ones[15], twos[15], signs[15], result16);
	
	cor_mb cr(ones, twos, signs, COR);		//korekcja
	
	assign result17 = result1 + (result2*4) + (result3*16) + (result4*64) + (result5*256) + (result6*1024) + (result7*4096) + (result8*16384) + 
			(result9*65536) + (result10*262144) + (result11*1048576) + (result12*4194304) + (result13*16777216) + (result14*67108864) + (result15*268435456) + (result16*1073741824) + COR;	//suma
	
	initial begin
		$monitor("mnozna: %b = %d\t\tmnoznik: %b = %d\n\nones: %b\ttwos: %b\tsigns: %b\n\nCOR: %b\n\nFinal Result: %b = %d",
		a, a, b, b, ones, twos, signs, COR, result17, result17);
	end
	
endmodule