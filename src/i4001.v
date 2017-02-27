//--------------------------------------------------------------------------------
// Modelado del chip ROM (4001) de la serie msc-4 de Intel.
//
//
//--------------------------------------------------------------------------------
module i4001(
            inout [3:0] data,    // Data bus.
            input clk1,         // Reloj fase 1.
            input clk2,         // Reloj fase 2.
            input sync,         // Sincronización.
            inout [3:0] io,      // Líneas input/output
            input cm,           // Control de memoria ROM (Memory Control Input)
            input cl,           // Clear Input for I/O lines.
            input rst           // Reset.
);

// Nombre del fichero con el contenido de la ROM
parameter ROMFILE = "rom.list";

reg [3:0] a1, a2, a3, q;
reg [2:0] nibble_cnt;
reg read = 1'b0;
reg [11:0] addr;
reg [8:0] rom [0:11];

assign data = (!read) ? q : 4'bzzzz;        // Si no leemos del bus debemos indicar que está en alta impedancia.

// Carga en la memoria el fichero ROMFILE
initial begin
  $readmemh(ROMFILE, rom);
end

always@(posedge sync)
begin
    read = 1'b1;                            // Si el 4004 comienza un nuevo ciclo de instrucción comenzamos a 
    nibble_cnt = 0;                         //  leer la dirección del bus.
end

always@(negedge clk2)                       // Con cada tick de reloj comprobamos si debemos leer los nibbles del bus.
begin
    if (read)
    begin
        case (nibble_cnt)
            0 : begin a1 = data; end
            1 : begin a2 = data; end
            3 : begin
                      a3 = data;
                      addr = 12'b000000000010;
                      ///addr = {a3[6:0],a2,a1};
                      read = 1'b0;
                end
            4 : begin q <= rom[addr][7:4]; end
            5 : begin q <= rom[addr][3:0]; end
            default : read = 1'b0;
        endcase
        nibble_cnt = nibble_cnt + 1;
    end
end



endmodule
