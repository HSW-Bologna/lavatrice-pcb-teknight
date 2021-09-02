#include "legacy.h"

static uint8_t const bitmap[] = {

0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x03,0xF0,0xF0,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%%%....%%%%............................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x0F,0xF1,0xF8,0x00,0x00,0x00,0x00,0x00,  /*  ....%%%%%%%%...%%%%%%...........................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x1F,0xF3,0xFC,0x00,0x00,0x00,0x00,0x00,  /*  ...%%%%%%%%%..%%%%%%%%..........................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x3F,0xF3,0xFC,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%%%%%%%..%%%%%%%%..........................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x3F,0xF7,0xFE,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%%%%%%%.%%%%%%%%%%.........................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x3E,0xF7,0xBE,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%%.%%%%.%%%%.%%%%%.........................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x3F,0x77,0x7E,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%%%.%%%.%%%.%%%%%%.........................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x1F,0xB6,0xFE,0x7F,0xFC,0x03,0xE0,0xFF,  /*  ...%%%%%%.%%.%%.%%%%%%%..%%%%%%%%%%%%%........%%%%%.....%%%%%%%%  */
0xFC,0x1F,0x07,0xF9,0xFE,0xFF,0xC3,0xFC,  /*  %%%%%%.....%%%%%.....%%%%%%%%..%%%%%%%%.%%%%%%%%%%....%%%%%%%%..  */
0x0F,0xD5,0xFE,0x7F,0xFF,0x0F,0xF8,0xFF,  /*  ....%%%%%%.%.%.%%%%%%%%..%%%%%%%%%%%%%%%....%%%%%%%%%...%%%%%%%%  */
0xFC,0x7F,0xC7,0xF9,0xFE,0xFF,0xE3,0xFC,  /*  %%%%%%...%%%%%%%%%...%%%%%%%%..%%%%%%%%.%%%%%%%%%%%...%%%%%%%%..  */
0x03,0xE3,0xFE,0x1E,0x0F,0x9F,0xFC,0xE7,  /*  ......%%%%%...%%%%%%%%%....%%%%.....%%%%%..%%%%%%%%%%%..%%%..%%%  */
0x9C,0xFF,0xE1,0xFC,0x78,0x3C,0xF0,0xF0,  /*  %..%%%..%%%%%%%%%%%....%%%%%%%...%%%%.....%%%%..%%%%....%%%%....  */
0x00,0x00,0x00,0x1E,0x07,0x9E,0x3C,0xE7,  /*  ...........................%%%%......%%%%..%%%%...%%%%..%%%..%%%  */
0x9C,0xF1,0xE1,0xFC,0x78,0x3C,0x70,0xF0,  /*  %..%%%..%%%%...%%%%....%%%%%%%...%%%%.....%%%%...%%%....%%%%....  */
0x3F,0xE3,0xE0,0x1E,0x0F,0xBC,0x1E,0xE7,  /*  ..%%%%%%%%%...%%%%%........%%%%.....%%%%%.%%%%.....%%%%.%%%..%%%  */
0x9D,0xE0,0xF1,0xFE,0x78,0x3C,0x78,0xF0,  /*  %..%%%.%%%%.....%%%%...%%%%%%%%..%%%%.....%%%%...%%%%...%%%%....  */
0x3F,0xD5,0xF8,0x1F,0xFF,0x3C,0x1E,0xE7,  /*  ..%%%%%%%%.%.%.%%%%%%......%%%%%%%%%%%%%..%%%%.....%%%%.%%%..%%%  */
0x9D,0xE0,0xF1,0xEE,0x78,0x3C,0x78,0xF0,  /*  %..%%%.%%%%.....%%%%...%%%%.%%%..%%%%.....%%%%...%%%%...%%%%....  */
0x3F,0xB6,0xFC,0x1F,0xF8,0x3C,0x1E,0x07,  /*  ..%%%%%%%.%%.%%.%%%%%%.....%%%%%%%%%%.....%%%%.....%%%%......%%%  */
0x81,0xE0,0xF1,0xE7,0x78,0x3C,0x78,0xF0,  /*  %......%%%%.....%%%%...%%%%..%%%.%%%%.....%%%%...%%%%...%%%%....  */
0x3F,0x77,0x7E,0x1E,0x3C,0x3C,0x1E,0x07,  /*  ..%%%%%%.%%%.%%%.%%%%%%....%%%%...%%%%....%%%%.....%%%%......%%%  */
0x81,0xE0,0xF1,0xE7,0x78,0x3C,0x78,0xF0,  /*  %......%%%%.....%%%%...%%%%..%%%.%%%%.....%%%%...%%%%...%%%%....  */
0x3E,0xF7,0xBE,0x1E,0x1E,0x3C,0x1E,0x07,  /*  ..%%%%%.%%%%.%%%%.%%%%%....%%%%....%%%%...%%%%.....%%%%......%%%  */
0x81,0xE0,0xF1,0xE3,0xF8,0x3C,0x78,0xF0,  /*  %......%%%%.....%%%%...%%%%...%%%%%%%.....%%%%...%%%%...%%%%....  */
0x3F,0xF7,0xFE,0x1E,0x0E,0x1E,0x3C,0x07,  /*  ..%%%%%%%%%%.%%%%%%%%%%....%%%%.....%%%....%%%%...%%%%.......%%%  */
0x80,0xF1,0xE1,0xE3,0xF8,0x3C,0x70,0xF0,  /*  %.......%%%%...%%%%....%%%%...%%%%%%%.....%%%%...%%%....%%%%....  */
0x1F,0xF7,0xFE,0x1E,0x0F,0x1F,0xFC,0x07,  /*  ...%%%%%%%%%.%%%%%%%%%%....%%%%.....%%%%...%%%%%%%%%%%.......%%%  */
0x80,0xFF,0xE1,0xE1,0xF8,0x3C,0xF0,0xF0,  /*  %.......%%%%%%%%%%%....%%%%....%%%%%%.....%%%%..%%%%....%%%%....  */
0x1F,0xFF,0xFC,0x7F,0x8F,0xCF,0xF8,0x3F,  /*  ...%%%%%%%%%%%%%%%%%%%...%%%%%%%%...%%%%%%..%%%%%%%%%.....%%%%%%  */
0xF0,0x7F,0xC7,0xF9,0xF8,0xFF,0xE3,0xFC,  /*  %%%%.....%%%%%%%%%...%%%%%%%%..%%%%%%...%%%%%%%%%%%...%%%%%%%%..  */
0x0F,0xDF,0xF8,0x7F,0x87,0xC3,0xE0,0x3F,  /*  ....%%%%%%.%%%%%%%%%%....%%%%%%%%....%%%%%....%%%%%.......%%%%%%  */
0xF0,0x1F,0x07,0xF8,0xF8,0xFF,0xC3,0xFC,  /*  %%%%.......%%%%%.....%%%%%%%%...%%%%%...%%%%%%%%%%....%%%%%%%%..  */
0x07,0x9F,0xE0,0x00,0x00,0x00,0x00,0x00,  /*  .....%%%%..%%%%%%%%.............................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x1C,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%..................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x1C,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%..................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x1C,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%..................................................  */
0x00,0x1F,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%%%................................................  */
0x00,0x1C,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%..................................................  */
0x00,0x60,0xC0,0x00,0x00,0x00,0x00,0x00,  /*  .........%%.....%%..............................................  */
0x00,0x1C,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%..................................................  */
0x00,0x80,0x20,0x00,0x00,0x00,0x00,0x00,  /*  ........%.........%.............................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0xBF,0x20,0x00,0x00,0x00,0x00,0x00,  /*  ........%.%%%%%%..%.............................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x01,0x31,0x90,0x00,0x00,0x00,0x00,0x00,  /*  .......%..%%...%%..%............................................  */
0x00,0x00,0x00,0x3F,0x6E,0x7C,0xC6,0xFC,  /*  ..........................%%%%%%.%%.%%%..%%%%%..%%...%%.%%%%%%..  */
0x01,0x31,0x90,0x00,0x00,0x00,0x00,0x00,  /*  .......%..%%...%%..%............................................  */
0x00,0x00,0x00,0x63,0x78,0xC6,0xC6,0xC6,  /*  .........................%%...%%.%%%%...%%...%%.%%...%%.%%...%%.  */
0x01,0x3F,0x10,0x00,0x00,0x00,0x00,0x00,  /*  .......%..%%%%%%...%............................................  */
0x00,0x00,0x00,0x63,0x60,0xC6,0xC6,0xC6,  /*  .........................%%...%%.%%.....%%...%%.%%...%%.%%...%%.  */
0x01,0x33,0x10,0x00,0x00,0x00,0x00,0x00,  /*  .......%..%%..%%...%............................................  */
0x00,0x00,0x00,0x3F,0x60,0xC6,0xC6,0xFC,  /*  ..........................%%%%%%.%%.....%%...%%.%%...%%.%%%%%%..  */
0x01,0x31,0x90,0x00,0x00,0x00,0x00,0x00,  /*  .......%..%%...%%..%............................................  */
0x00,0x00,0x00,0x03,0x60,0x7C,0x7C,0xC0,  /*  ..............................%%.%%......%%%%%...%%%%%..%%......  */
0x00,0xB1,0xA0,0x00,0x00,0x00,0x00,0x00,  /*  ........%.%%...%%.%.............................................  */
0x00,0x00,0x00,0x7E,0x00,0x00,0x00,0xC0,  /*  .........................%%%%%%.........................%%......  */
0x00,0x80,0x20,0x00,0x00,0x00,0x00,0x00,  /*  ........%.........%.............................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x60,0xC0,0x00,0x00,0x00,0x00,0x00,  /*  .........%%.....%%..............................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x1F,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...........%%%%%................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x03,0x19,0x98,0x0F,0x8C,0x63,0xE0,  /*  ..............%%...%%..%%..%%.......%%%%%...%%...%%...%%%%%.....  */
0x00,0x0C,0xFF,0x1F,0x18,0x30,0xC0,0x00,  /*  ............%%..%%%%%%%%...%%%%%...%%.....%%....%%..............  */
0x00,0x03,0x19,0x98,0x18,0xCC,0x66,0x30,  /*  ..............%%...%%..%%..%%......%%...%%..%%...%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x30,0xC0,0x00,  /*  ............%%.....%%.....%%...%%..%%.....%%....%%..............  */
0x00,0x03,0xB9,0x98,0x18,0xCC,0x66,0x30,  /*  ..............%%%.%%%..%%..%%......%%...%%..%%...%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x30,0xC0,0x00,  /*  ............%%.....%%.....%%...%%..%%.....%%....%%..............  */
0x00,0x03,0xF9,0x98,0x18,0xCE,0x66,0x30,  /*  ..............%%%%%%%..%%..%%......%%...%%..%%%..%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x19,0x80,0x00,  /*  ............%%.....%%.....%%...%%..%%......%%..%%...............  */
0x00,0x03,0x59,0x98,0x18,0xCF,0x66,0x30,  /*  ..............%%.%.%%..%%..%%......%%...%%..%%%%.%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x0F,0x00,0x00,  /*  ............%%.....%%.....%%...%%..%%.......%%%%................  */
0x00,0x03,0x59,0x98,0x18,0xCD,0xE6,0x30,  /*  ..............%%.%.%%..%%..%%......%%...%%..%%.%%%%..%%...%%....  */
0xFF,0x0C,0x18,0x31,0x98,0x06,0x00,0x00,  /*  %%%%%%%%....%%.....%%.....%%...%%..%%........%%.................  */
0x00,0x03,0x19,0x98,0x1F,0xCC,0xE6,0x30,  /*  ..............%%...%%..%%..%%......%%%%%%%..%%..%%%..%%...%%....  */
0x00,0x0C,0x18,0x3F,0x98,0x06,0x00,0x00,  /*  ............%%.....%%.....%%%%%%%..%%........%%.................  */
0x00,0x03,0x19,0x98,0x18,0xCC,0x66,0x30,  /*  ..............%%...%%..%%..%%......%%...%%..%%...%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x06,0x00,0x00,  /*  ............%%.....%%.....%%...%%..%%........%%.................  */
0x00,0x03,0x19,0x98,0x18,0xCC,0x66,0x30,  /*  ..............%%...%%..%%..%%......%%...%%..%%...%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x06,0x00,0x00,  /*  ............%%.....%%.....%%...%%..%%........%%.................  */
0x00,0x03,0x19,0x98,0x18,0xCC,0x66,0x30,  /*  ..............%%...%%..%%..%%......%%...%%..%%...%%..%%...%%....  */
0x00,0x0C,0x18,0x31,0x98,0x06,0x00,0x00,  /*  ............%%.....%%.....%%...%%..%%........%%.................  */
0x00,0x03,0x19,0x9F,0x98,0xCC,0x63,0xE0,  /*  ..............%%...%%..%%..%%%%%%..%%...%%..%%...%%...%%%%%.....  */
0x00,0x0C,0x18,0x31,0x9F,0x86,0x00,0x00,  /*  ............%%.....%%.....%%...%%..%%%%%%....%%.................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00   /*  ................................................................  */
};


const GSYMBOL legacy_img_logo_rotondi = {
    .sh   = {1, 128, 64},
    .data = (uint8_t *)bitmap,
};