/* Enkoder MB 8bit*/
/* Przeksztalca liczbe w U2 na reprezenstacje w kodzie MB */

module mb_encoder(a, sign, one, two);
	input	[31:0] a;				/* liczba do przekodowania */
	output  [15:0] sign, one, two;	/* wynik przekodowania */
	genvar i;
	
	for(i=0;i<16;i=i+1) begin
		if(i==0) count_mb cmb1(1'b0, a[2*i], a[2*i+1], sign[i], one[i], two[i]);
		else
		count_mb cmb2(a[2*i-1], a[2*i], a[2*i+1], sign[i], one[i], two[i]);
		
	end
endmodule


module count_mb(bjm, bjz, bjp, sign, one, two);
	input 	bjm, bjz, bjp;	/* pojedyncze bity kodowanej liczby */
	output	sign, one, two;	/* wynik kodowania */
	
	assign sign = bjp ^ (bjp & bjz & bjm);		/* znak /redukcja {+0, -0} na {+0} */
	assign one = bjm ^ bjz;	/* jedynka */
	assign two = ~one & (bjp ^ bjz);	/* dwojka */
	
endmodule