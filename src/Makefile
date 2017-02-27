#-------------------------------------------------------
#-- Se establecen nombre y dependencias del proyecto.
#-------------------------------------------------------
NAME = mcs4
#DEPS_4004 = alu.v timing_io.v counter.v instruction_decode.v instruction_pointer.v scratchpad.v
#DEPS_4001 = rom.list
ROM = rom.list
DEPS = i4001.v i4004.v alu.v timing_io.v counter.v instruction_decode.v instruction_pointer.v scratchpad.v

#-------------------------------------------------------
#-- Objetivo por defecto: hacer simulación.
#-------------------------------------------------------
all: sim

#----------------------------------------------
#-- make sim
#----------------------------------------------
#-- Objetivo para hacer la simulación del
#-- banco de pruebas.
#----------------------------------------------
sim: $(NAME)_tb.vcd

#-----------------------------------------------
#-  make sint
#-----------------------------------------------
#-  Objetivo para realizar la síntetis completa
#- y dejar el diseño listo para su grabación en
#- la FPGA.
#-----------------------------------------------
sint: $(NAME).bin

#-------------------------------
#-- Compilación y simulación.
#-------------------------------
$(NAME)_tb.vcd: $(DEPS) $(NAME)_tb.v

    #-- Compilar.
	iverilog $^ -o $(NAME)_tb.out

    #-- Simular.
	./$(NAME)_tb.out

    #-- Ver visualmente la simulación con gtkwave.
	gtkwave $@ $(NAME)_tb.gtkw &

#----------------------------------------------------------
#-- Se comprueba existencia del fichero ROM para el 4001.
#----------------------------------------------------------
i4001.v: $(ROM)

$(ROM):
	@echo "ERROR: Se necesita el fichero ROM del i4001 (p.j. \"$(ROM)\").\n"

#------------------------------
#-- Síntesis completa.
#------------------------------
$(NAME).bin: $(NAME).pcf $(NAME).v $(DEPS)

	#-- Síntesis.
	yosys -p "synth_ice40 -blif $(NAME).blif" $(NAME).v $(DEPS)

	#-- Place & route.
	arachne-pnr -d 1k -p $(NAME).pcf $(NAME).blif -o $(NAME).txt

	#-- Generar binario final, listo para descargar en fgpa.
	icepack $(NAME).txt $(NAME).bin


#------------------------------
#-- Limpiar todo.
#------------------------------
clean:
	rm -f *.bin *.txt *.blif *.out *.vcd *~

.PHONY: all clean
