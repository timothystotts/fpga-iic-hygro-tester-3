# fpga-iic-hygro-tester-3

FPGA IIC HYGRO Tester Version 3

by Timothy Stotts

This project version replaces
[fpga-iic-hygro-tester-1](https://github.com/timothystotts/fpga-iic-hygro-tester-1)
and
[fpga-iic-hygro-tester-2](https://github.com/timothystotts/fpga-iic-hygro-tester-2)
.

Now with support for:

- Digilent Inc. Arty S7-25 FPGA development board containing a small Xilinx Spartan-7 FPGA
- Digilent Inc. Arty A7-100 FPGA development board containing a large Xilinx Artix-7 FPGA
- Digilent Inc. Zybo Z7-20 APSoC development board containing a moderate Xilinx Zynq-7000 SoC.

Note that this project is kept as a beginner-level design that students, hobbyists, and
FPGA enthusiasts may find interesting. Note that the design technique used with the Verilog-HDL
example is intended as a FPGA design example and not an ASCI design example.

Notes:
- The MicroBlaze example followed this tutorial as a starting point:
- [https://digilent.com/reference/learn/programmable-logic/tutorials/arty-getting-started-with-microblaze-servers/start](https://digilent.com/reference/learn/programmable-logic/tutorials/arty-getting-started-with-microblaze-servers/start)
- Note that the MicroBlaze example requires Xilinx Vivado 2021.2. The DDR MIG is driven by two MMCM clocks in a way that is possibily incompatible with newer versions of Vivado. Newer versions of Vivado may require a revised block design to achieve a functional design.

## Description
A small FPGA and APSoC project of different implementations for testing Temperature and Relative Humidity
readings of a I2C sensor. Readings are displayed in abbreviated text on a 16x2 character LCD,,
with color-mixing two or four RGB LEDs.

The Xilinx MicroBlaze designs can now target either of two FPGA development boards produced by Digilent Inc; one being
lower cost. Also, the HDL design can target either of the same two FPGA development boards.
- Digilent Inc. Arty S7-25 FPGA development board containing a small Xilinx Spartan-7 FPGA
- Digilent Inc. Arty A7-100 FPGA development board containing a large Xilinx Artix-7 FPGA

Two peripherals are used: Digilent Inc. Pmod SF3, Digilent Inc. Pmod CLS.

Additionally, the Xilinx Zynq design targets the
- Digilent Inc. Zybo Z7-20 FPGA development board containing a Xilinx Zynq-7000 APSoC.

Two peripherals are used: Digilent Inc. Pmod SF3, Digilent Inc. Pmod CLS.

The design is broken into four groupings.
The first group targets the Digilent Inc. Arty A7-100 development board.
The second group targets the Digilent Inc. Arty S7-25 development board.
The third group target either the
Digilent Inc. Arty A7-100 development board or
the Digilent Inc. Arty S7-25 development board.
The last group targets the Digilent Inc. Zybo Z7-20 development board.
The projects are likely portable to the smaller Arty A7-35 and Zybo Z7-10,
respectively, noting that the Arty A7 example will require modification to fit
within the smaller equivalent device.

The folder HYGRO-Tester-Design-MB-A7 contains a Xilinx Vivado IP Integrator plus
Xilinx Vitis design. A MicroBlaze soft CPU is instantiated to talk with board components,
a temperature and relative humidity sensor,
a 16x2 character LCD peripheral,
and a two-digit Seven Segment Display.
Source to be incorporated into a Xilinx Vitis project contain
a very small Standalone program in C; drivers
for the peripherals, a main loop to operate and poll the sensor,
poll the switches and buttons,
update LCD, update 7SD, and color-mix RGB LEDs.

The folder HYGRO-Tester-Design-MB-S7 contains a Xilinx Vivado IP Integrator plus
Xilinx Vitis design. The design is essentially the same as the HYGRO-Tester-Design-MB-A7 mentioned
above, but instead targets the Arty S7-25 development board, including the differences in available
board components, such as count of RGB LEDs, and use of GPIO instead of PWM to operate the LEDs.

The folder HYGRO-Tester-Design-Verilog contains a Xilinx Vivado project with sources
containing only Verilog-HDL 2001 modules. Plain HDL without a soft CPU or C code is authored to
talk with board components,
a temperature and relative humidity sensor peripheral,
a 16x2 character LCD peripheral,
and a 2-digit 7-segment display.
The design is essentially equivalent function as the HYGRO-Tester-Design-MB-A7/S7 \
projects, but also provides readout on the USB UART at 115200 baud.
This design targets either of the Arty A7-100 or the Arty S7-25
development boards, and adjusts for the difference in available board components, such as
count of RGB LEDs.

The folder HYGRO-Tester-Design-Zynq contains a Xilinx Vivado IP Integrator plus Xilinx Vitis
design. The Zynq hard ARM CPU #0 is configured to talk with board components,
and the same temperature/humidity sensor, 16x2 character LCD display, and seven segment display.
Its functionality is mostly equivalent function to that of the HYGRO-Tester-Design-MB-A7 design,
but differs in the count of RGB LEDs.

These four groupings of design provide equivalent functionality, excepting that the HDL design provides
additional animation effect of the board's three-emitter RGB LEDs.

### Naming conventions notice
The Pmod CLS peripheral used in this project connects via a standard bus technology design called SPI.
The use of MOSI/MISO terminology is considered obsolete. COPI/CIPO is now used. The MOSI signal on a
controller can be replaced with the title 'COPI'. Master and Slave terms are now Controller and Peripheral.
Additional information can be found [here](https://www.oshwa.org/a-resolution-to-redefine-spi-signal-names).
The choice to use COPI and CIPO instead of SDO and SDI for single-direction bus signals is simple.
On a single peripheral bus with two data lines of fixed direction, the usage of the signal name
"SDO" is dependent on whether the Controller or the Peripheral is the chip being discussed;
whereas COPI gives the exact direction regardless of which chip is being discussed. The author
of this website agrees with the open source community that the removal of offensive language from
standard terminology in engineering is a priority. (Traditional engineering wording is still used
in design components and sources where the IP vendor chose the name.)

### Project information document:
```
./HYGRO Sensor Readings Tester - Refreshed.pdf
```

[HYGRO Sensor Readings Tester info](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO%20Sensor%20Readings%20Tester%20-%20Refreshed.pdf)

### Diagrams design document:
```
./HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams.pdf
```

[HYGRO Tester Design Diagrams info](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams.pdf)

#### Target device execution: Arty A7-100 with Pmod HYGRO on test header, Pmod CLS on extension cable, Pmod 7SD on extension cable
![Target device assembly executing](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/img_iic-hygro-tester-artya7-executing-b-20230430.jpg)

#### Target device execution: Arty S7-25 with Pmod HYGRO on test header, Pmod CLS on extension cable, Pmod 7SD on extension cable
![Target device assembly executing](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/img_iic-hygro-tester-artys7-executing-b-20230430.jpg)

#### Target device execution: Zybo Z7-20 with Pmod HYGRO on test header, Pmod CLS on extension cable, Pmod 7SD on extension cable
![Target device assembly executing](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/img_iic-hygro-tester-zyboz7-executing-b-20230430.jpg)

#### Block diagram architecture of the HDL designs:
![HYGRO Tester Architecture Diagram](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-Architecture%201.svg)

#### Top Port diagram architecture of the HDL designs:
![HYGRO Tester Top Ports Diagram](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-Top-Ports.svg)

#### LCD FSM diagram of the HDL designs:
![LCD FSM Diagram](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-LCD-FSM.svg)

#### UART Feed FSM diagram of the HDL designs:
![UART Feed FSM Diagram](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-UARTfeed.svg)

#### UART TX ONLY FSM diagram of the HDL designs:
![UART Feed FSM Diagram](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-UART-Tx-FSM.svg)

#### 4-input Multi-Debouncer for 4 exclusve inputs, such as switches or buttons, of the HDL designs:
![4-bit Multi-Debouncer](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-multi-debounce.svg)

#### HYGRO Custom Driver Ports diagram of the HDL designs:
![HYGRO Solo Driver Ports](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-HYGRO-Ports.svg)

#### Pmod HYGRO IIC custom driver FSM for operating as a single setup and then poll once per second:
![HYGRO Custom Driver readings driver FSM](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-HYGRO%20FSM.svg)

#### CLS Custom Driver Ports diagram of the HDL designs:
![CLS Custom Driver Ports](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-CLS-ports.svg)

#### Generic Standard SPI Single Chip protocol bus driver, used by the ACL2 driver and the CLS driver
![Generic Standard SPI Single Chip bus driver](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-SPI-generic-FSM.svg)

#### Pmod CLS Standard SPI custom driver FSM for operating the standard SPI driver to send text line refreshes to the ATmega48 micro-controller chip of the Pmod CLS:
![CLS Custom Driver readings driver FSM](https://github.com/timothystotts/fpga-iic-hygro-tester-3/blob/main/HYGRO-Tester-Design-Documents/HYGRO-Tester-Design-Diagrams-CLS-driver-FSM.svg)
