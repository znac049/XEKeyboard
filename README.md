# Connecting a USB keyboard to an Atari 65XE/130XE

## Introduction
While we all love the old Atari 8-bit computers, you won't often hear anyone
compliment them on the quality of their keyboards. Add to that the fact that
they are now 30+ years old and its getting increasingly difficult to keep
those old keyboards working, or to find replacements. This project came about
when the keyboard on my Atari 65XE failed and to get it working, I'm going
to have to do some fairly major flexible track reconstruction. It occurred
to me that it wouldn't be too difficult to interface a USB keyboard
to the 65XE with something like an Arduino. This would have a few advantages:

 - USB keyboards are cheap and easy to acquire
 - USB keyboards, even the really cheap ones, are of an infintely higher quality to the original Atari keyboard
 - Arduinos are cheap so will be good for prototyping
 - Wireless USB keyboards are cheap and readily available

It was also a requirement that the Atari wouldn't be aware of the change

The ultimate goal is to create a custom PCB that drops into the XE's POKEY socket.

## Design
When I looked at the schematics for the 65XE, I found a slightly more
complicated setup than I'd expected. I'd supposed I'd find a standard key
matrix of n rows and n columns; each row would be addressed in turn and
the columns sampled to determine which key switches had been pressed.
As I say, this is not quite what I found.

### Atari XE keyboard
One of the great things about these old computers is how the designers and
developers managed to do so much with so little. The Ataris all have a
POKEY chip in it and one of its capabilities is driving a keyboard matrix.
A quick look at the schematic showed me the following:

 - an 8 rows by 8 colums switch matrix for the majority of the keys. Handled by the POKEY.
 - a n 8 rows by just one column matrix for some of the more special keys (Break, Shift, Control), also handled by the POKEY.
 - Three switches directly pollable (Start, Select, Option). These switches connect to pins on the GTIA graphics controller and I haven't yet worked out why. I will update this page when I do, but it isn't necessary for this project as we just need to generate the signals.
 - A single switch that triggers the hardware reset timer.
 
I suspect that this design is identical on the earlier 800XL and 400/800 models.

Looking at the POKEY datasheet [here](http://krap.pl/mirrorz/atari/homepage.ntlworld.com/kryten_droid/Atari/800XL/atari_hw/pokey.htm)
it is clear that the slightly "odd" keyboard design I found in the schematics
comes straight out of the datasheet. The datasheet also confirmed an
assumption I'd made, namely that the six bit row/col counter only ever increments.
This means the interrupt handling in the Arduino becomes much simpler as it only
needs to trigger on a change on the LSB of the counter (just a single pin).

### USB keyboard
Much has been written about the PS2 keyboard so I won't really revisit that here
other than to say it's pretty straightforward to hook one up to an Arduino
(other microcontrollers are available!) to read the raw key press and release
data. Handling both press and release information is integral to emulating
the Atari keyboard. Mapping the data from the PS2 keyboard to the electrical
signals going to the Atari is where the Arduino comes in.

_Note. There are two unusual keys on your average PS2 keyboard: PAUSE/BREAK and
PRINT SCREEN. The former only ever generates a key press event (no key release)
and PRINT SCREEN generates a data stream that is quite different from all the
others, making it more complicated to decode._

#### Links

### Prototype Hardware
I used an Arduino UNO for this as I had one and it has enough I/O to do the job. For the USB
interface, I used an Arduino USB host shield based on the MAX3421E USB Host Controller chip.

### Final Hardware
I envisage a custom board based around the ATMEL ATMega-328P microcontroller and the MAX3421E
USB Host Controller. The MAX3421E is a 3.3v device and everything else is 5v, so care will need
to be taken to ensure the right signal levels are used. A couple of 74LVC125 level converters
should do the trick.
 
### Software
The code in the Arduino has three(four) main jobs:

 1. Receive data from the USB keyboard
 1. Process the keycodes and map them to their equivalent Atari key (if they have one)
 1. Mimic the Atari keyboard at a hardware level
 1. If compiled in, pressing Alt-PrtScr will cause a load of state information to be sent to the serial port (57600 baud)

The code relies on pin change interrupts. The
Arduino only has three pin change interrupt vectors, each
vector handling the change events for a particular group of pins (Ports B, C and D).
Only one pin needs to generate pin change interrupts, POKEY K0.

_Note. key presses are active low, so pressing a key pulls a signal down to logic 0._

#### Reading from the PS2 keyboard
Data from the PS2 keyboard consists of a stream of bits, grouped into 11 bit chunks which,
after framing and parity are removed yields a single byte. A key press or release is encoded
as one or more data bytes. In general, key releases use the same byte sequence as the
equivalent press code, but prefixed with the byte 0xE0. As noted above,
there are a couple of exceptions, which I'll ignore for now.

At it's heart, reading PS2 keycodes is pretty straightforward, and the time sensitive code
lives inside an interrupt handler. Using the Arduino's pin change interrupt feature, we
setup an interrupt to occur on every falling edge of the PS2 CLOCK signal. The interrupt
handler samples the PS2 DATA signal and shifts it into the word it is assembling. When
assembly of a single keycode is complete, the framing data is removed and the remaining
single byte is stored in a small keycode buffer. The interrupt handler also deals with
data signal corruption by timing out a keycode read if too much time has elapsed since
the first bit arrived.

#### Processing USB keycodes
Processing keycodes is pretty simple and consists of a polling loop which waits for
key data to arrive in the input buffer. Once sufficient bytes have been read to identify
whether its a key press or release and whether its a stadard or extended keycode, the arduino
updates its internal state map of the Atari's current switch state, i.e. which keys on
the Atari virtual keyboard are currently being pressed.

Updating the virtual keyboard state is essentially one of four actions:
 * Keys map to a point in the 8x8 matrix - kr1Matrix[64]
 * BREAK/CONTROL/SHIFT keys map to the 1x8 matrix - kr2Matrix[8]
 * START/SELECT/OPTION keys update internal state (just for debugging purposes) and directly drive the START, SELECT and OPTION signals on the Atari.
 * PS2 PAUSE/BREAK key. When this key is pressed, the Arduino immediately
asserts the RESET signal on the Atari which causes the Reset timer to fire. This signal
is asserted for 250mS. There is no "key released" keycode for this key. The code
which deasserts RESET is hidden in the getKeyCode() function as this is the only
place where code blocks inside the main loop.


#### Mimic the Atari keyboard hardware
This is the simplest bit of the code so far. All the information we need to emulate
the Atari keyboard signals have already been collected by the main program loop. Now
all that is needed is to monitor the 6 key counter bits from the POKEY (K0-K5) and
whenever the address changes, present the appropriate bits from the kr1Matrix and
kr2Matrix onto the KR1 and KR2 POKEY signals. A pin change interrupt routine hanging
off of the K0 (LSB key address) POKEY signal.

## Future ideas
There are 10 "holes" in the XE keyboard matrix, which means an additional 10 keyswitches
could be added. Obviously, to use them, your own code would have to take care of the
keyboard polling or the OS ROM would need updating.

It wouldn't be hard to use one of the unmapped PS2 keys to turn serial debugging on/off.
At the moment, it is a compile time option.

If there's any interest, I might do a custom PCB that plugs into the POKEY socket
(the POKEY then plugs into the board).
