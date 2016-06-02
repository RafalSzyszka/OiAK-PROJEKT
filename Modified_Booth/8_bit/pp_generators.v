// Generatory produktow czesciowych (cale bloki i pojedyncze kolumny)

// -- Modul generatora produktu czesciowego mnozenia dla MB -- //
module pp_mb_generator(a, one_j, two_j, sign_j, results);
	input [7:0] a; 
	input one_j, two_j, sign_j;
	output [8:0] results;

	genvar i;
	for(i=0;i<9;i=i+1) begin
		if(i == 0) begin 
			ppij_mb ppij1(a[i], 1'b0, one_j, two_j, sign_j, results[i]);
		end
		else if( i < 8 )begin 
			ppij_mb ppij2(a[i], a[i-1], one_j, two_j, sign_j, results[i]);
		end else if( i == 8) begin
			not_ppij_mb nppjn(a[i-1], a[i-1], one_j, two_j, sign_j, results[i]);
		end
	end

endmodule


module ppij_mb(a_i, a_im, one_j, two_j, sign_j, p_ij);
	input a_i, a_im, one_j, two_j, sign_j;
	output p_ij;
	
	assign p_ij = ((a_i & one_j) | (a_im & two_j)) ^ sign_j;
	
endmodule

module not_ppij_mb(a_i, a_im, one_j, two_j, sign_j, p_ij);
	input a_i, a_im, one_j, two_j, sign_j;
	output p_ij;
	
	assign p_ij = ~(((a_i & one_j) | (a_im & two_j)) ^ sign_j);
	
endmodule

// -- Modul generatora produktu czesciowego mnozenia dla NR4SD- -- //

module pp_nr4sdm_generator(a, one_jp, one_jm, two_jm, results);
	input [7:0] a;
	input one_jp, one_jm, two_jm;
	output [8:0] results;
	
	genvar i;
	for(i=0;i<9;i=i+1) begin
		if(i == 0) begin
			ppij_nr4sdm ppij1(a[i], 1'b0, one_jp, one_jm, two_jm, results[i]);
		end
		else if(i < 8) begin
			ppij_nr4sdm ppij2(a[i], a[i-1], one_jp, one_jm, two_jm, results[i]);
		end else if( i == 8) begin
			not_ppij_nr4sdm nppin(a[i-1], a[i-1], one_jp, one_jm, two_jm, results[i]);
		end
	end
	
endmodule	


module ppij_nr4sdm(a_i, a_im, one_jp, one_jm, two_jm, p_ij);
	input a_i, a_im, one_jp, one_jm, two_jm;
	output p_ij;
	
	assign p_ij = (a_i & one_jp) ^ (~a_im & two_jm) ^ (~a_i & one_jm);
	
endmodule

module not_ppij_nr4sdm(a_i, a_im, one_jp, one_jm, two_jm, p_ij);
	input a_i, a_im, one_jp, one_jm, two_jm;
	output p_ij;
	
	assign p_ij = ~((a_i & one_jp) ^ (~a_im & two_jm) ^ (~a_i & one_jm));
	
endmodule

// -- Modul generatora produktu czesciowego mnozenia dla NR4SD+ -- //

module pp_nr4sdp_generator(a, one_jp, one_jm, two_jp, results);
	input [7:0] a;
	input one_jp, one_jm, two_jp;
	output [8:0] results;
	
	genvar i;
	for(i=0;i<9;i=i+1) begin
		if(i == 0) begin
			ppij_nr4sdp ppij1(a[i], 1'b0, one_jp, one_jm, two_jp, results[i]);
		end
		else if(i < 8) begin
			ppij_nr4sdp ppij2(a[i], a[i-1], one_jp, one_jm, two_jp, results[i]);
		end 
		else if(i == 8) begin
			not_ppij_nr4sdp ppin(a[i-1], a[i-1], one_jp, one_jm, two_jp, results[i]);
		end
	end
	
endmodule	


module ppij_nr4sdp(a_i, a_im, one_jp, one_jm, two_jp, p_ij);
	input a_i, a_im, one_jp, one_jm, two_jp;
	output p_ij;
	
	assign p_ij = (a_i & one_jp) ^ (a_im & two_jp) ^ (~a_i & one_jm);
	
endmodule

module not_ppij_nr4sdp(a_i, a_im, one_jp, one_jm, two_jp, p_ij);
	input a_i, a_im, one_jp, one_jm, two_jp;
	output p_ij;
	
	assign p_ij = ~((a_i & one_jp) ^ (a_im & two_jp) ^ (~a_i & one_jm));
	
endmodule