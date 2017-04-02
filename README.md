# CJMCU-KZQ
Documentation for the CJMCU-KZQ board 

I bought some CJMCU-KZQ boards from banggood - and found no documentation.
So in my small free time I make a schematic, compile an optiboot bootloader,
write a boards.txt and make a custom hardware directory for this board.
Now this board is usable with the Arduino IDE.

The board is like an Pro mini board, you need an 
USB to serial adapter.
Please be careful with the cheap FTDI adapters.
a lot of them has fake chips which doesn't work correct.
I tested some adapters with the Silabs CP2102,
they are working fine for me.

There are ISP pins for use with an AVRISP mkII programmer or
similar on the board, but you need to build a special adapter for this.

NEWS 02.04.2017:
JSON Package and zip File for easy installing with Arduino Boardmanager.
Based on 1.6.18
Add the following link to Preferences/Boardmanager-URL's:
https://github.com/dieter-l-git/CJMCU-KZQ-Documentation/raw/master/package_CJMCU-KZQ_index.json

You can use the files in this repo like you want with no warranty.
I will be happy if you send me a postcard.
In this case ask for my postal address 
via dieter-l-git(at)gmx.de.

Have fun.
 

