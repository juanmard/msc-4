# Proyecto msc-4

Esto proyecto surge con la idea de aprender a utilizar las herramientas libres que permiten sintetizar
una FPGA y realizar el ciclo completo, desde el diseño a la síntesis.

![](https://github.com/juanmard/msc-4/raw/master/doc/images/1024px-Intel_C4004.jpg)

Está inspirado en el trabajo realizado por Obijuan con el [Simplez-F](https://github.com/Obijuan/simplez-fpga/wiki/Procesador-SIMPLEZ-F).
Buscaba la posibilidad de rediseñar un microprocesador real y que fuera lo más simple posible para que las dificultades no
fueran muchas... Recordé el 4004 el primer microprocesador de Intel.

Buscando información se encontró en openCores una [implementación](https://opencores.org/project,mcs-4) en Verilog del 4004 y nos basaremos en ella para realizar nuestra aportación.

# Documentación

Toda la documentación se está escribiendo en la wiki de github de este repo:

[Acceso a la wiki del proyecto](https://github.com/juanmard/msc-4/wiki/msc-4)

# Author
[Juan Manuel Rico](http://juanmard.github.io/) (juanmard)

# Créditos

* [Reece Pollack](https://insanity4004.blogspot.com/), creador del código en Verilog para el 4004.
* [Juan González Gómez](http://obijuan.github.io/) (Obijuan), autor del Simplez-F.
* Integrantes del grupo [FPGA Wars](https://groups.google.com/forum/#!forum/fpga-wars-explorando-el-lado-libre), ayudas y comentarios.

* Creadores de las herramientas libres usadas para sintetizar el conjunto mcs-4:
  * [Proyecto icestorm](http://www.clifford.at/icestorm/), por Clifford Wolf and Mathias Lasser
  * [Arachne-pnr](https://github.com/cseed/arachne-pnr), por Cotton Seed

* Herramientas para la simulación de mcs-4:
  * **Simulador de Verilog**: [ícarus Verilog](http://iverilog.icarus.com/)
  * **Visualizador de señales**: [Gtkwave](http://gtkwave.sourceforge.net/)
  
# Licencia
<img src="https://github.com/juanmard/msc-4/raw/master/doc/images/ridotech-logo.png" width="114" height="85">

Licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](http://creativecommons.org/licenses/by-sa/4.0/)
