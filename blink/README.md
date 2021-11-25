# Blink

## Overview

`blink` is the hello world of any development board: Make the LED
blink!  A singular Verilog file describes a module that increments a
32-bit counter.  That counter increments on every positive clock
edge. It uses the top 10 bits to drive the 3 color selectors and the 7
LED enablers.  You'll see <something>.

## Usage

Be sure the bootloader is active (indicated by a alternating blue and
green wave on the 7 LEDs which spread from the middle out).  If it
isn't, then unplug the board, hold down button 0 *while* replugging
the board, then release buttom 0.

At this point

```
$ make dfu
```

should compile and program the blinky design resulting in a counter
pattern being display, cycling though black, red, blue, red, green,
green, and cyan before advancing the counter.  (Note, this is a
simplistic example and the current limiting is on the common anode of
the LED, so lower Vforward of RED will dominate the current.  This is
better addressed by multiplexing the colors.)


If this doesn't, check

 * (Linux only) that `/etc/udev/rules.d/10-butterstick-dfu.rules` exist and contains
   `ATTRS{idVendor}=="1209", ATTRS{idProduct}=="5af1", MODE="0666", GROUP="plugdev", TAG+="uaccess"`

 * That the USB cable is actually perfect (I had a marginal cable that almost worked ...)

 * That the ButterStick is connected to the machine that runs the DFU command.

## Files

- `blink.v` — The `top` (e.g. 'main') module, that describes the
  counter, and the hooking of the counter's bits to the RGB LEDs.

- `Makefile` — The make build script that will produce the bitstream
  from the HDL. It makes uses of the open source tools `yosys`,
  `nextpnr`, `ecppack`, and `dfu-util` to go from hardware description
  to bitstream to running on the FPGA.

## Concepts Introduced

- Simple toolchain flow via Makefile
- Introduction to Verilog HDL.
- Registers and assignment, always blocks, sequential logic.
- Wire assignment (combinitorial logic)

### Further Reading

- [fpga4fun: Counters 1 - Binary
  counters](https://www.fpga4fun.com/Counters1.html) — A more in detph
  look at how the counting is done like in this example.

- [fpga4fun: HDL
  Tutorials](https://www.fpga4fun.com/HDLtutorials.html) — Take a look
  at the Verilog section, as all of these examples use Verilog. VHDL,
  is another hardware description language that isn't used in these
  examples.
