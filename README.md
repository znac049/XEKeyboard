# Connecting a PS2 keyboard to an Atari 65XE/130XE

## Introduction
While we all love the old Atari 8-bit computers, you won't often hear anyone compliment them on the quality of their keyboards. Add to that the fact that they are now 30+ years old and its getting increasingly difficult to keep those old keyboards working, or to find replacements. This project came about when the keyboard on my Atari 65XE failed and to get it working, I'm going to have to do some fairly major flexible track reconstruction. It occurred to me that it wouldn't be too difficult to interface an old PS2 keyboard to the 65XE with something like an Arduino. This would have a few advantages:

 - PS2 keyboards are still pretty easy and cheap to acquire
 - PS2 keyboards, even the really cheap ones, are of an infintely higher quality to the original Atari keyboard
 - Arduinos are cheap

It was also a requirement that the Atari wouldn't be aware of the change

## Design
When I looked at the schematics for the 65XE, I found a slightly more complicated setup than I'd expected. I'd supposed I'd find a standard key matrix of n rows and n columns; each row would be addressed in turn and the columns sampled to determine which key switches had been pressed. As I say, this is not quite what I found.

### Atari XE keyboard
One of the great things about these old computers is how the designers and developers managed to do so much with so little. The Ataris all have a POKEY chip in it and one of its capabilities is driving a keyboard matrix. A quick look at the schematic showed me the following:

 - an 8 rows by 8 colums switch matrix for the majority of the keys. Handled by the POKEY.
 - a n 8 rows by just one column matrix for some of the more special keys (Break, Shift, Control), also handled by the POKEY.
 - Three switches directly pollable (Start, Select, Option). These switches connect to pins on the GTIA graphics controller and I haven't yet worked out why. I will update this page when I do, but it isn't necessary for this project as we just need to generate the signals.
 - A single switch that triggers the hardware reset timer.
 
I suspect that this design is identical on the earlier 800XL and 400/800 models.

Looking at the POKEY datasheet [here](http://krap.pl/mirrorz/atari/homepage.ntlworld.com/kryten_droid/Atari/800XL/atari_hw/pokey.htm) it is clear that the slightly "odd" keyboard design I found in the schematics comes straight out of the datasheet. The datasheet also confirmed an assumption I'd made, namely that the six bit row/col counter only ever increments. This means my interrupt handling in the Arduino becomes much simpler

### PS2 keyboard
Much has been written about the PS2 keyboard so I won't really revisit that here other than to say it's pretty straightforward to hook one up to an Arduino (other microcontrollers are available!) to read the raw key press and release data. Handling both press and release information is integral to emulating the Atari keyboard. Mapping the data from the PS2 keyboard to the electrical signals going to the Atari is where the Arduino comes in.

_Note. There are two unusual keys on your average PS2 keyboard: PAUSE/BREAK and PRINT SCREEN. The former only ever generates a key press event (no key release) and PRINT SCREEN generates a data stream that is quite different from all the others, making it more complicated to decode._

### Software
The code in the Arduino has three main jobs:

 # Receive data from the PS2 keyboard
 # Process the PS2 keycodes and mapping them to their equivalent Atari key (if they have one)
 # Mimic the Atari keyboard at a hardware level

#### Reading from the PS2 keyboard
Data from the PS2 keyboard consists of a stream of bits, grouped into 11 bit chunks which,
after framing and parity are removed yields a single byte. A key press or release is encoded
as one or more data bytes. In general, key releases use the same byte sequence as the
equivalent press code, but prefixed with the byte 0xE0. As noted above,
there are a couple of exceptions, which I'll ignore for now.

At it's heart, reading PS2 keycodes is pretty straightforward, and the time sensitive code lives inside an interrupt handler. Using the Arduino's pin change interrupt feature, we setup an interrupt to occur on every falling edge of the PS2 CLOCK signal. The interrupt handler samples the PS2 DATA signal and shifts it into the word it is assembling. When assembly of a single keycode is complete, the framing data is removed and the remaining single byte is stored in a small keycode buffer. The interrupt handler also deals with data signal corruption by timing out a keycode read if too much time has elapsed since the first bit arrived.

#### Processing PS2 keycodes

#### Mimic the Atari keyboard hardware
