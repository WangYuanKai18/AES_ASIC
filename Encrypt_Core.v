`include "aes_tbox.v"
`include "aes_sbox.v"
`include "aes_tbox_r.v"
module Encrypt_Core (
  input clk,
  input rst_n,
  input t_ready,
  input [127:0]Plain_text,
  input [3:0]Nr,
  input [128:0]Key,
  input op, //op = 1: encrypt; op = 0: decrypt
  output reg [3:0]Addr,
  output reg Core_Full,
  output reg c_ready,
  output reg [127:0]Ciphertext
);
  wire [127:0]add_in;
  wire [127:0]key_in;
  wire [127:0]add_out;

  reg [127:0]ss_in;
  wire [127:0]ss_out;

  reg [127:0]mix_in;
  wire [127:0]mix_out;


  reg [127:0]round_result;
  reg [127:0]round_result_w;
  reg [3:0]rounds;
  reg operation;
  reg final_round;

  assign key_in = Key[127:0];
  always @ (posedge clk or negedge rst_n) begin
    if(~rst_n) begin
      Ciphertext <= 128'h0;
      c_ready <= 0;
    end
    else begin
      if((operation && (Addr == rounds))|(~operation && (Addr == 4'h0))) begin
        Ciphertext <= add_out;
        c_ready <= 1;
      end
      else begin
        Ciphertext <= 128'h0;
        c_ready <= 0;
      end
    end
  end
  //controller
  always @ (posedge clk or negedge rst_n) begin
    if (~rst_n) begin
      rounds <= 4'h0;
      round_result <= 127'h0;
      Core_Full <= 0;
      Addr <= 4'h1;
      operation <= 0;
    end
    else begin
      if (~Core_Full) begin
        if (t_ready) begin
          round_result <= Plain_text;
          Core_Full <= 1;
          operation <= op;
          rounds <= Nr;
          if(op) begin
            Addr <= 4'h0;
          end
          else begin
            Addr <= Nr;
          end
        end
        else begin
          round_result <= round_result;
          Core_Full <= Core_Full;
          rounds <= rounds;
          operation <= operation;
          Addr <= Addr;
        end
      end
      else begin
        operation <= operation;
        rounds <= rounds;
        if (Key[128]) begin
          if((operation && (Addr == rounds))|(~operation && (Addr == 4'h0))) begin
            Core_Full <= 0;
            Addr <= 4'h1;
          end
          else begin
            if(operation) begin
              Addr <= Addr + 1;
            end
            else begin
              Addr <= Addr - 1;
            end
            Core_Full <= Core_Full;
          end
          round_result <= round_result_w;
        end
        else begin
          round_result <= round_result;
          Addr <= Addr;
          Core_Full <= Core_Full;
        end
      end
    end
  end

  always @ ( * ) begin
    if(operation) begin
      if(Addr == rounds - 1) begin
        round_result_w = ss_out;
      end
      else begin
        round_result_w = mix_out;
      end
      mix_in = ss_out;
      ss_in = add_out;
    end
    else begin
      round_result_w = ss_out;
      mix_in = add_out;
      if(Addr == rounds) begin
        ss_in = add_out;
      end
      else begin
        ss_in = mix_out;
      end
    end
  end

  assign add_in = round_result;
  //add round key
  add adder(add_in,key_in,add_out);

  //tbox and shift row
  shift_and_sub ss(ss_in,operation,ss_out);

  //mix column
  mix_col mc(mix_in,operation,mix_out);

endmodule

module shift_and_sub(
  input [127:0]ss_in,
  input op,
  output [127:0]ss_out
  );
  wire [127:0]pre_shift;
  wire [127:0]sbox_out;
  wire [127:0]sbox_out_r;
  assign pre_shift = op ? sbox_out : sbox_out_r;
  generate
    genvar i;
    for (i = 0; i < 16; i = i + 1) begin:gen_tbox
      aes_sbox sboxs(ss_in[8*i+7:8*i],sbox_out[8*i+7:8*i]);
      aes_sbox_r sboxs_r(ss_in[8*i+7:8*i],sbox_out_r[8*i+7:8*i]);
    end
    genvar c,r;
    for (c = 0; c < 4; c = c + 1) begin:select_column
      for (r = 0; r < 4; r = r + 1) begin:select_row
        assign ss_out[32*c+8*r+7:32*c+8*r] = op ?
            pre_shift[((4*c+4*r+r+16)%16)*8+7:((4*c+4*r+r+16)%16)*8] :
            pre_shift[((4*c-4*r+r+16)%16)*8+7:((4*c-4*r+r+16)%16)*8];
      end
    end
  endgenerate
endmodule

module mix_col(
  input [127:0]mix_in,
  input op,
  output [127:0]mix_out
  );
  wire [127:0]mix_in_2;
  wire [127:0]mix_in_4;
  wire [127:0]mix_in_8;
  wire [127:0]mix_in_3;
  wire [127:0]mix_in_9;
  wire [127:0]mix_in_b;
  wire [127:0]mix_in_d;
  wire [127:0]mix_in_e;
  generate
    genvar i,m;
    for (i = 0; i < 16; i = i + 1) begin : generate_mul_2
      mul_by_2 m2(mix_in[8*i+7:8*i],mix_in_2[8*i+7:8*i]);
      mul_by_2 m4(mix_in_2[8*i+7:8*i],mix_in_4[8*i+7:8*i]);
      mul_by_2 m8(mix_in_4[8*i+7:8*i],mix_in_8[8*i+7:8*i]);
    end
    for (m = 0; m < 4; m = m + 1) begin : generate_mix_out
      assign mix_out[m*32+31:m*32] = (op) ?
        { mix_in_3[m*32+7:m*32]^mix_in[m*32+15:m*32+8]^mix_in[m*32+23:m*32+16]^mix_in_2[m*32+31:m*32+24],
          mix_in[m*32+7:m*32]^mix_in[m*32+15:m*32+8]^mix_in_2[m*32+23:m*32+16]^mix_in_3[m*32+31:m*32+24],
          mix_in[m*32+7:m*32]^mix_in_2[m*32+15:m*32+8]^mix_in_3[m*32+23:m*32+16]^mix_in[m*32+31:m*32+24],
          mix_in_2[m*32+7:m*32]^mix_in_3[m*32+15:m*32+8]^mix_in[m*32+23:m*32+16]^mix_in[m*32+31:m*32+24]} :
        { mix_in_b[m*32+7:m*32]^mix_in_d[m*32+15:m*32+8]^mix_in_9[m*32+23:m*32+16]^mix_in_e[m*32+31:m*32+24],
          mix_in_d[m*32+7:m*32]^mix_in_9[m*32+15:m*32+8]^mix_in_e[m*32+23:m*32+16]^mix_in_b[m*32+31:m*32+24],
          mix_in_9[m*32+7:m*32]^mix_in_e[m*32+15:m*32+8]^mix_in_b[m*32+23:m*32+16]^mix_in_d[m*32+31:m*32+24],
          mix_in_e[m*32+7:m*32]^mix_in_b[m*32+15:m*32+8]^mix_in_d[m*32+23:m*32+16]^mix_in_9[m*32+31:m*32+24]};
    end
  endgenerate
  assign mix_in_3 = mix_in_2 ^ mix_in;
  assign mix_in_9 = mix_in_8 ^ mix_in;
  assign mix_in_b = mix_in_8 ^ mix_in_2 ^ mix_in;
  assign mix_in_d = mix_in_8 ^ mix_in_4 ^ mix_in;
  assign mix_in_e = mix_in_8 ^ mix_in_4 ^ mix_in_2;

endmodule

module mul_by_2 (
  input [7:0]mul_in,
  output [7:0]mul_out
  );
  assign mul_out = mul_in[7] ? (mul_in << 1)^8'h1b : mul_in << 1;
endmodule

module add(
  input [127:0] add_1,
  input [127:0] add_2,
  output [127:0] add_res
  );
  assign add_res = add_1 ^ add_2;
endmodule
