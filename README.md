# Dual Port RAM with dual clock
This Repository presents the design of a Random Access Memory which is used to store data. The RAM has two ports, both have read and write functionality. Both ports have their own clock signals, which makes this design asynchronous in nature. The RAM can be shared among two separate processors both of which can read(write) data from(to) it simultaneously. This type of RAM is used for high speed(frequency) and low size data transfers between two asynchronous systems. Hence, applications which require varying level of complexity, and utilize two processors are heavily sped up by the use of dual port memories.

## Functionality
The memory design is accomplished using Behavioural modelling in Verilog HDL. There are two always blocks in the design one for each port. A memory contains of a data structure containing a two dimensional array of bits. The depth and width parameters can be modified by altering the parameters declared at the beginning of the design. Address pointers are used to select the memory location. Each port has its own address pointer. The write-enable pin tells the memory whether to read or write to itself. Each port has one write-enable pin. Clock of each port can be designed according to the corresponding device. Two data buses are used to stream data in and out of the memory array.

## RTL Synthesis
<img src="https://github.com/D4WN-9/Dual-Port-RAM-with-dual-clock/blob/main/figs/fig_1_RTL.png" width="600">

The RTL synthesis is done using [DigitalJS](https://github.com/Vanthez/digitaljs-vsc) extension for VSCode, which utilises the [Yosys](https://github.com/YosysHQ/yosys) framework. The address pins are unidirectional, and data pins are bidirectional i.e. data can flow into and out of the memory as per requirement. These ensure that both ports remain sensitive to their clock signals in case of simultaneous accessing of memory by both devices. The read operation is automatically assumed if write enable is low, the data out bus receives the contents of the memory location that has been accessed. During write operation the contents of data in bus are stored at the memory address location provided in address bus and data out bus also receives the contents of memory. Hence, all write operations automatically also carry forward the data to output bus.

## Waveforms
<img src="https://github.com/D4WN-9/Dual-Port-RAM-with-dual-clock/blob/main/figs/fig_2_WAVE.png" width="600">

As shown the waveforms of all the signals that were generated using a testbench file. It clearly shows the clock signals, address pointers, write-enables, data in and out buses. At 100 units of time the address bus is activated, and the memory is loaded with data. The data is read at the next positive clock edges of both ports. Here, note that the B port is only able to read data after port A. This is due to the fact that port B waits for the data to be stored in the port A before actually reading the memory address.
