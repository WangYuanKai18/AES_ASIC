module aes_tbox_r(a,d);
input	[7:0]	a;
output reg [31:0] d;

always @(a)
	case(a)
		8'h00: d= 32'b01010001010100001010011111110100;
		8'h01: d= 32'b01111110010100110110010101000001;
		8'h02: d= 32'b00011010110000111010010000010111;
		8'h03: d= 32'b00111010100101100101111000100111;
		8'h04: d= 32'b00111011110010110110101110101011;
		8'h05: d= 32'b00011111111100010100010110011101;
		8'h06: d= 32'b10101100101010110101100011111010;
		8'h07: d= 32'b01001011100100110000001111100011;
		8'h08: d= 32'b00100000010101011111101000110000;
		8'h09: d= 32'b10101101111101100110110101110110;
		8'h0a: d= 32'b10001000100100010111011011001100;
		8'h0b: d= 32'b11110101001001010100110000000010;
		8'h0c: d= 32'b01001111111111001101011111100101;
		8'h0d: d= 32'b11000101110101111100101100101010;
		8'h0e: d= 32'b00100110100000000100010000110101;
		8'h0f: d= 32'b10110101100011111010001101100010;
		8'h10: d= 32'b11011110010010010101101010110001;
		8'h11: d= 32'b00100101011001110001101110111010;
		8'h12: d= 32'b01000101100110000000111011101010;
		8'h13: d= 32'b01011101111000011100000011111110;
		8'h14: d= 32'b11000011000000100111010100101111;
		8'h15: d= 32'b10000001000100101111000001001100;
		8'h16: d= 32'b10001101101000111001011101000110;
		8'h17: d= 32'b01101011110001101111100111010011;
		8'h18: d= 32'b00000011111001110101111110001111;
		8'h19: d= 32'b00010101100101011001110010010010;
		8'h1a: d= 32'b10111111111010110111101001101101;
		8'h1b: d= 32'b10010101110110100101100101010010;
		8'h1c: d= 32'b11010100001011011000001110111110;
		8'h1d: d= 32'b01011000110100110010000101110100;
		8'h1e: d= 32'b01001001001010010110100111100000;
		8'h1f: d= 32'b10001110010001001100100011001001;
		8'h20: d= 32'b01110101011010101000100111000010;
		8'h21: d= 32'b11110100011110000111100110001110;
		8'h22: d= 32'b10011001011010110011111001011000;
		8'h23: d= 32'b00100111110111010111000110111001;
		8'h24: d= 32'b10111110101101100100111111100001;
		8'h25: d= 32'b11110000000101111010110110001000;
		8'h26: d= 32'b11001001011001101010110000100000;
		8'h27: d= 32'b01111101101101000011101011001110;
		8'h28: d= 32'b01100011000110000100101011011111;
		8'h29: d= 32'b11100101100000100011000100011010;
		8'h2a: d= 32'b10010111011000000011001101010001;
		8'h2b: d= 32'b01100010010001010111111101010011;
		8'h2c: d= 32'b10110001111000000111011101100100;
		8'h2d: d= 32'b10111011100001001010111001101011;
		8'h2e: d= 32'b11111110000111001010000010000001;
		8'h2f: d= 32'b11111001100101000010101100001000;
		8'h30: d= 32'b01110000010110000110100001001000;
		8'h31: d= 32'b10001111000110011111110101000101;
		8'h32: d= 32'b10010100100001110110110011011110;
		8'h33: d= 32'b01010010101101111111100001111011;
		8'h34: d= 32'b10101011001000111101001101110011;
		8'h35: d= 32'b01110010111000100000001001001011;
		8'h36: d= 32'b11100011010101111000111100011111;
		8'h37: d= 32'b01100110001010101010101101010101;
		8'h38: d= 32'b10110010000001110010100011101011;
		8'h39: d= 32'b00101111000000111100001010110101;
		8'h3a: d= 32'b10000110100110100111101111000101;
		8'h3b: d= 32'b11010011101001010000100000110111;
		8'h3c: d= 32'b00110000111100101000011100101000;
		8'h3d: d= 32'b00100011101100101010010110111111;
		8'h3e: d= 32'b00000010101110100110101000000011;
		8'h3f: d= 32'b11101101010111001000001000010110;
		8'h40: d= 32'b10001010001010110001110011001111;
		8'h41: d= 32'b10100111100100101011010001111001;
		8'h42: d= 32'b11110011111100001111001000000111;
		8'h43: d= 32'b01001110101000011110001001101001;
		8'h44: d= 32'b01100101110011011111010011011010;
		8'h45: d= 32'b00000110110101011011111000000101;
		8'h46: d= 32'b11010001000111110110001000110100;
		8'h47: d= 32'b11000100100010101111111010100110;
		8'h48: d= 32'b00110100100111010101001100101110;
		8'h49: d= 32'b10100010101000000101010111110011;
		8'h4a: d= 32'b00000101001100101110000110001010;
		8'h4b: d= 32'b10100100011101011110101111110110;
		8'h4c: d= 32'b00001011001110011110110010000011;
		8'h4d: d= 32'b01000000101010101110111101100000;
		8'h4e: d= 32'b01011110000001101001111101110001;
		8'h4f: d= 32'b10111101010100010001000001101110;
		8'h50: d= 32'b00111110111110011000101000100001;
		8'h51: d= 32'b10010110001111010000011011011101;
		8'h52: d= 32'b11011101101011100000010100111110;
		8'h53: d= 32'b01001101010001101011110111100110;
		8'h54: d= 32'b10010001101101011000110101010100;
		8'h55: d= 32'b01110001000001010101110111000100;
		8'h56: d= 32'b00000100011011111101010000000110;
		8'h57: d= 32'b01100000111111110001010101010000;
		8'h58: d= 32'b00011001001001001111101110011000;
		8'h59: d= 32'b11010110100101111110100110111101;
		8'h5a: d= 32'b10001001110011000100001101000000;
		8'h5b: d= 32'b01100111011101111001111011011001;
		8'h5c: d= 32'b10110000101111010100001011101000;
		8'h5d: d= 32'b00000111100010001000101110001001;
		8'h5e: d= 32'b11100111001110000101101100011001;
		8'h5f: d= 32'b01111001110110111110111011001000;
		8'h60: d= 32'b10100001010001110000101001111100;
		8'h61: d= 32'b01111100111010010000111101000010;
		8'h62: d= 32'b11111000110010010001111010000100;
		8'h63: d= 32'b00000000000000000000000000000000;
		8'h64: d= 32'b00001001100000111000011010000000;
		8'h65: d= 32'b00110010010010001110110100101011;
		8'h66: d= 32'b00011110101011000111000000010001;
		8'h67: d= 32'b01101100010011100111001001011010;
		8'h68: d= 32'b11111101111110111111111100001110;
		8'h69: d= 32'b00001111010101100011100010000101;
		8'h6a: d= 32'b00111101000111101101010110101110;
		8'h6b: d= 32'b00110110001001110011100100101101;
		8'h6c: d= 32'b00001010011001001101100100001111;
		8'h6d: d= 32'b01101000001000011010011001011100;
		8'h6e: d= 32'b10011011110100010101010001011011;
		8'h6f: d= 32'b00100100001110100010111000110110;
		8'h70: d= 32'b00001100101100010110011100001010;
		8'h71: d= 32'b10010011000011111110011101010111;
		8'h72: d= 32'b10110100110100101001011011101110;
		8'h73: d= 32'b00011011100111101001000110011011;
		8'h74: d= 32'b10000000010011111100010111000000;
		8'h75: d= 32'b01100001101000100010000011011100;
		8'h76: d= 32'b01011010011010010100101101110111;
		8'h77: d= 32'b00011100000101100001101000010010;
		8'h78: d= 32'b11100010000010101011101010010011;
		8'h79: d= 32'b11000000111001010010101010100000;
		8'h7a: d= 32'b00111100010000111110000000100010;
		8'h7b: d= 32'b00010010000111010001011100011011;
		8'h7c: d= 32'b00001110000010110000110100001001;
		8'h7d: d= 32'b11110010101011011100011110001011;
		8'h7e: d= 32'b00101101101110011010100010110110;
		8'h7f: d= 32'b00010100110010001010100100011110;
		8'h80: d= 32'b01010111100001010001100111110001;
		8'h81: d= 32'b10101111010011000000011101110101;
		8'h82: d= 32'b11101110101110111101110110011001;
		8'h83: d= 32'b10100011111111010110000001111111;
		8'h84: d= 32'b11110111100111110010011000000001;
		8'h85: d= 32'b01011100101111001111010101110010;
		8'h86: d= 32'b01000100110001010011101101100110;
		8'h87: d= 32'b01011011001101000111111011111011;
		8'h88: d= 32'b10001011011101100010100101000011;
		8'h89: d= 32'b11001011110111001100011000100011;
		8'h8a: d= 32'b10110110011010001111110011101101;
		8'h8b: d= 32'b10111000011000111111000111100100;
		8'h8c: d= 32'b11010111110010101101110000110001;
		8'h8d: d= 32'b01000010000100001000010101100011;
		8'h8e: d= 32'b00010011010000000010001010010111;
		8'h8f: d= 32'b10000100001000000001000111000110;
		8'h90: d= 32'b10000101011111010010010001001010;
		8'h91: d= 32'b11010010111110000011110110111011;
		8'h92: d= 32'b10101110000100010011001011111001;
		8'h93: d= 32'b11000111011011011010000100101001;
		8'h94: d= 32'b00011101010010110010111110011110;
		8'h95: d= 32'b11011100111100110011000010110010;
		8'h96: d= 32'b00001101111011000101001010000110;
		8'h97: d= 32'b01110111110100001110001111000001;
		8'h98: d= 32'b00101011011011000001011010110011;
		8'h99: d= 32'b10101001100110011011100101110000;
		8'h9a: d= 32'b00010001111110100100100010010100;
		8'h9b: d= 32'b01000111001000100110010011101001;
		8'h9c: d= 32'b10101000110001001000110011111100;
		8'h9d: d= 32'b10100000000110100011111111110000;
		8'h9e: d= 32'b01010110110110000010110001111101;
		8'h9f: d= 32'b00100010111011111001000000110011;
		8'ha0: d= 32'b10000111110001110100111001001001;
		8'ha1: d= 32'b11011001110000011101000100111000;
		8'ha2: d= 32'b10001100111111101010001011001010;
		8'ha3: d= 32'b10011000001101100000101111010100;
		8'ha4: d= 32'b10100110110011111000000111110101;
		8'ha5: d= 32'b10100101001010001101111001111010;
		8'ha6: d= 32'b11011010001001101000111010110111;
		8'ha7: d= 32'b00111111101001001011111110101101;
		8'ha8: d= 32'b00101100111001001001110100111010;
		8'ha9: d= 32'b01010000000011011001001001111000;
		8'haa: d= 32'b01101010100110111100110001011111;
		8'hab: d= 32'b01010100011000100100011001111110;
		8'hac: d= 32'b11110110110000100001001110001101;
		8'had: d= 32'b10010000111010001011100011011000;
		8'hae: d= 32'b00101110010111101111011100111001;
		8'haf: d= 32'b10000010111101011010111111000011;
		8'hb0: d= 32'b10011111101111101000000001011101;
		8'hb1: d= 32'b01101001011111001001001111010000;
		8'hb2: d= 32'b01101111101010010010110111010101;
		8'hb3: d= 32'b11001111101100110001001000100101;
		8'hb4: d= 32'b11001000001110111001100110101100;
		8'hb5: d= 32'b00010000101001110111110100011000;
		8'hb6: d= 32'b11101000011011100110001110011100;
		8'hb7: d= 32'b11011011011110111011101100111011;
		8'hb8: d= 32'b11001101000010010111100000100110;
		8'hb9: d= 32'b01101110111101000001100001011001;
		8'hba: d= 32'b11101100000000011011011110011010;
		8'hbb: d= 32'b10000011101010001001101001001111;
		8'hbc: d= 32'b11100110011001010110111010010101;
		8'hbd: d= 32'b10101010011111101110011011111111;
		8'hbe: d= 32'b00100001000010001100111110111100;
		8'hbf: d= 32'b11101111111001101110100000010101;
		8'hc0: d= 32'b10111010110110011001101111100111;
		8'hc1: d= 32'b01001010110011100011011001101111;
		8'hc2: d= 32'b11101010110101000000100110011111;
		8'hc3: d= 32'b00101001110101100111110010110000;
		8'hc4: d= 32'b00110001101011111011001010100100;
		8'hc5: d= 32'b00101010001100010010001100111111;
		8'hc6: d= 32'b11000110001100001001010010100101;
		8'hc7: d= 32'b00110101110000000110011010100010;
		8'hc8: d= 32'b01110100001101111011110001001110;
		8'hc9: d= 32'b11111100101001101100101010000010;
		8'hca: d= 32'b11100000101100001101000010010000;
		8'hcb: d= 32'b00110011000101011101100010100111;
		8'hcc: d= 32'b11110001010010101001100000000100;
		8'hcd: d= 32'b01000001111101111101101011101100;
		8'hce: d= 32'b01111111000011100101000011001101;
		8'hcf: d= 32'b00010111001011111111011010010001;
		8'hd0: d= 32'b01110110100011011101011001001101;
		8'hd1: d= 32'b01000011010011011011000011101111;
		8'hd2: d= 32'b11001100010101000100110110101010;
		8'hd3: d= 32'b11100100110111110000010010010110;
		8'hd4: d= 32'b10011110111000111011010111010001;
		8'hd5: d= 32'b01001100000110111000100001101010;
		8'hd6: d= 32'b11000001101110000001111100101100;
		8'hd7: d= 32'b01000110011111110101000101100101;
		8'hd8: d= 32'b10011101000001001110101001011110;
		8'hd9: d= 32'b00000001010111010011010110001100;
		8'hda: d= 32'b11111010011100110111010010000111;
		8'hdb: d= 32'b11111011001011100100000100001011;
		8'hdc: d= 32'b10110011010110100001110101100111;
		8'hdd: d= 32'b10010010010100101101001011011011;
		8'hde: d= 32'b11101001001100110101011000010000;
		8'hdf: d= 32'b01101101000100110100011111010110;
		8'he0: d= 32'b10011010100011000110000111010111;
		8'he1: d= 32'b00110111011110100000110010100001;
		8'he2: d= 32'b01011001100011100001010011111000;
		8'he3: d= 32'b11101011100010010011110000010011;
		8'he4: d= 32'b11001110111011100010011110101001;
		8'he5: d= 32'b10110111001101011100100101100001;
		8'he6: d= 32'b11100001111011011110010100011100;
		8'he7: d= 32'b01111010001111001011000101000111;
		8'he8: d= 32'b10011100010110011101111111010010;
		8'he9: d= 32'b01010101001111110111001111110010;
		8'hea: d= 32'b00011000011110011100111000010100;
		8'heb: d= 32'b01110011101111110011011111000111;
		8'hec: d= 32'b01010011111010101100110111110111;
		8'hed: d= 32'b01011111010110111010101011111101;
		8'hee: d= 32'b11011111000101000110111100111101;
		8'hef: d= 32'b01111000100001101101101101000100;
		8'hf0: d= 32'b11001010100000011111001110101111;
		8'hf1: d= 32'b10111001001111101100010001101000;
		8'hf2: d= 32'b00111000001011000011010000100100;
		8'hf3: d= 32'b11000010010111110100000010100011;
		8'hf4: d= 32'b00010110011100101100001100011101;
		8'hf5: d= 32'b10111100000011000010010111100010;
		8'hf6: d= 32'b00101000100010110100100100111100;
		8'hf7: d= 32'b11111111010000011001010100001101;
		8'hf8: d= 32'b00111001011100010000000110101000;
		8'hf9: d= 32'b00001000110111101011001100001100;
		8'hfa: d= 32'b11011000100111001110010010110100;
		8'hfb: d= 32'b01100100100100001100000101010110;
		8'hfc: d= 32'b01111011011000011000010011001011;
		8'hfd: d= 32'b11010101011100001011011000110010;
		8'hfe: d= 32'b01001000011101000101110001101100;
		8'hff: d= 32'b11010000010000100101011110111000;
	endcase

endmodule
