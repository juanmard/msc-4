//----------------------------------------------------
// Test bench para el 4004.
//
//module i4004(
//    input  wire       sysclk,
//    input  wire       clk1_pad,
//    input  wire       clk2_pad,
//    input  wire       poc_pad,
//    input  wire       test_pad,
//    inout  wire [3:0] data_pad,
//    output wire       cmrom_pad,
//    output wire       cmram0_pad,
//    output wire       cmram1_pad,
//    output wire       cmram2_pad,
//    output wire       cmram3_pad,
//    output wire       sync_pad
//    );
//-----------------------------------------------------
module i4004_tb();

  i4004 DUT (
    .sysclk (sysclk_p),
    .clk1_pad (clk1),
    .clk2_pad (clk2),
    .poc_pad (poc),
    .test_pad (test),
    .data_pad (data),
    .cmrom_pad (cmrom),
    .cmram0_pad (cmram0),
    .cmram1_pad (cmram1),
    .cmram2_pad (cmram2),
    .cmram3_pad (cmram3),
    .sync_pad (sync)
  );

  reg [3:0] a1, a2, a3, m1, m2, x1, x2, x3, ciclo=4'b0;
  wire [3:0] data;
  reg clk1=0;
  reg clk2=0;
  wire sync;
  reg poc = 1, test =0;
  wire cmrom;
  wire cmram0;
  wire cmram1;
  wire cmram2;
  wire cmram3;
  reg sysclk_p=0;


//  assign data  = sync ? salida : 4'bzzzz;

//  always #1.35us begin clk1 = ~clk1; clk2 = #0.675us clk1; end
  always #1 begin clk1 = ~clk1; clk2 = #0.5 clk1; end
  always #0.5 sysclk_p = ~sysclk_p; //50Mhz=~20ns

  always @(posedge clk1) begin
  end

  assign data = (ciclo == 3) ? m1 : 4'bzzzz;
  assign data = (ciclo == 4) ? m2 : 4'bzzzz;

  always @(negedge clk2)
  begin
        case (a1)
           0 : begin m1 = 4'b0000; m2 = 4'b0000; end
           1 : begin m1 = 4'b1101; m2 = 4'b0001; end
           2 : begin m1 = 4'b1000; m2 = 4'b0001; end
           3 : begin m1 = 4'b0011; m2 = 4'b0011; end
           default : begin m1 = 4'b1101; m2 = 4'b1010; end
        endcase
  end

  always @(negedge sync) begin
      ciclo = 0;
  end

  always @(negedge clk2) begin
        if (!sync)
        begin
           //$display("Inicio del ciclo de CPU");
           if (ciclo == 0) a1 = data;
           if (ciclo == 1) a2 = data;
           if (ciclo == 2) a3 = data;
//           if (ciclo == 3) m1 = data;
//           if (ciclo == 4) m2 = data;
           if (ciclo == 5) x1 = data;
           if (ciclo == 6) x2 = data;
           if (ciclo == 7) x3 = data;
           ciclo = ciclo + 1;
        end;
  end

  initial begin
    $dumpfile ("i4004_tb.vcd");
    $dumpvars (0,i4004_tb);

    #2 $display ("Iniciamos el test bench");
    #70 poc = 1'b0;
    #249 $display ("Fin del test bench");
    #250 $finish;
  end

//initial  begin
//     $display("\t\ttime,\tclk1,\tclk2,\tsync"); 
//     $monitor("%d,\t%b,\t%b,\t%b",$time, clk1,clk2,sync); 
//end 

endmodule