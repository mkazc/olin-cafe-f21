module adder_n(a, b, c_in, sum, c_out);

parameter N = 1;

input  wire [N-1:0] a, b;
input wire c_in;
output logic [N-1:0] sum;
output logic c_out;


wire [N:0] carries;
always_comb c_out = carries[N];
always_comb carries[0] = c_in;
generate
  genvar i;
  for(i = 0; i < N; i++) begin : ripple_carry
    adder_1 ADDER (
      .a(a[i]),
      .b(b[i]),
      .c_in(carries[i]),
      .sum(sum[i]),
      .c_out(carries[i+1])
    );
  end
endgenerate

endmodule
// to instantiate
// adder_n #(.N(32)) adder_32bit_a ( port list );
