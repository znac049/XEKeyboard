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
One of the great things about these old computers is how the designers and developers managed to do so much with so little. The Ataris all have a POKEY chip in it and one of its capabilities is to drive a keyboard matrix. A quick look at the schematic showed me the following:

 - an 8 rows by 8 colums switch matrix for the majority of the keys.
 - a n 8 rows by just one column matrix for some of the more special keys (Break, Shift, Control).
 - Three switches directly pollable (Start, Select, Option)
 - A single switch that triggers the hardware reset timer.
 
I suspect that this design is identical on the earlier 800XL and 400/800 models.