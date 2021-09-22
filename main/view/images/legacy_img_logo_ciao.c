#include "legacy.h"

static uint8_t const bitmap[] = {
0x00,0x00,0x00,0x00,0x3F,0xF0,0x00,0x00,  /*  ..................................%%%%%%%%%%....................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x03,0xFF,0xFF,0x00,0x00,  /*  ..............................%%%%%%%%%%%%%%%%%%................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x3F,0xFF,0xFF,0xF0,0x00,  /*  ..........................%%%%%%%%%%%%%%%%%%%%%%%%%%............  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x01,0xFF,0xFF,0xFF,0xFE,0x00,  /*  .......................%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.........  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x07,0xFF,0xC0,0x0F,0xFF,0x80,  /*  .....................%%%%%%%%%%%%%..........%%%%%%%%%%%%%.......  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x1F,0xFC,0x00,0x00,0xFF,0xE0,  /*  ...................%%%%%%%%%%%..................%%%%%%%%%%%.....  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x7F,0xC0,0x00,0x00,0x0F,0xF8,  /*  .................%%%%%%%%%..........................%%%%%%%%%...  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0xFE,0x00,0x00,0x00,0x01,0xFC,  /*  ................%%%%%%%................................%%%%%%%..  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x01,0xF8,0x00,0x00,0x00,0x00,0x7E,  /*  ...............%%%%%%....................................%%%%%%.  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x03,0xF0,0x00,0x00,0x00,0x00,0x3F,  /*  ..............%%%%%%......................................%%%%%%  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x07,0xC0,0x00,0x00,0x00,0x00,0x0F,  /*  .............%%%%%..........................................%%%%  */
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %...............................................................  */
0x00,0x0F,0x80,0x00,0x00,0x00,0x00,0x07,  /*  ............%%%%%............................................%%%  */
0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%..............................................................  */
0x00,0x1F,0x00,0x00,0x00,0x00,0x00,0x03,  /*  ...........%%%%%..............................................%%  */
0xE0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%%.............................................................  */
0x00,0x1E,0x00,0x00,0x00,0x00,0x00,0x01,  /*  ...........%%%%................................................%  */
0xE0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%%.............................................................  */
0x00,0x3C,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ..........%%%%..................................................  */
0xF0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%%%............................................................  */
0x00,0x78,0x00,0x00,0x00,0x00,0x00,0x00,  /*  .........%%%%...................................................  */
0x78,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  .%%%%...........................................................  */
0x00,0x78,0x00,0xF0,0x00,0x00,0x3C,0x00,  /*  .........%%%%...........%%%%......................%%%%..........  */
0x78,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  .%%%%...........................................................  */
0x00,0xF0,0x03,0xFC,0x00,0x00,0xFF,0x00,  /*  ........%%%%..........%%%%%%%%..................%%%%%%%%........  */
0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%..........................................................  */
0x00,0xF0,0x07,0xFE,0x00,0x01,0xFF,0x80,  /*  ........%%%%.........%%%%%%%%%%................%%%%%%%%%%.......  */
0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%..........................................................  */
0x01,0xE0,0x07,0xFE,0x00,0x01,0xFF,0x80,  /*  .......%%%%..........%%%%%%%%%%................%%%%%%%%%%.......  */
0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...%%%%.........................................................  */
0x01,0xE0,0x03,0xFC,0x00,0x00,0xFF,0x00,  /*  .......%%%%...........%%%%%%%%..................%%%%%%%%........  */
0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...%%%%.........................................................  */
0x01,0xE0,0x00,0xF0,0x00,0x00,0x3C,0x00,  /*  .......%%%%.............%%%%......................%%%%..........  */
0x1E,0x01,0xF8,0xF1,0xF8,0x7E,0x01,0x80,  /*  ...%%%%........%%%%%%...%%%%...%%%%%%....%%%%%%........%%.......  */
0x01,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  .......%%%......................................................  */
0x0E,0x03,0x0C,0x63,0x0C,0xC3,0x03,0xC0,  /*  ....%%%.......%%....%%...%%...%%....%%..%%....%%......%%%%......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x0C,0x63,0x0C,0xC3,0x03,0xC0,  /*  ....%%%%......%%....%%...%%...%%....%%..%%....%%......%%%%......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x0C,0x63,0x0C,0xC3,0x03,0xC0,  /*  ....%%%%......%%....%%...%%...%%....%%..%%....%%......%%%%......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x00,0x63,0x0C,0xC3,0x01,0x80,  /*  ....%%%%......%%.........%%...%%....%%..%%....%%.......%%.......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x00,0x63,0x0C,0xC3,0x01,0x80,  /*  ....%%%%......%%.........%%...%%....%%..%%....%%.......%%.......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x00,0x63,0x0C,0xC3,0x01,0x80,  /*  ....%%%%......%%.........%%...%%....%%..%%....%%.......%%.......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x00,0x63,0xFC,0xC3,0x01,0x80,  /*  ....%%%%......%%.........%%...%%%%%%%%..%%....%%.......%%.......  */
0x03,0xC0,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ......%%%%......................................................  */
0x0F,0x03,0x00,0x63,0x0C,0xC3,0x01,0x80,  /*  ....%%%%......%%.........%%...%%....%%..%%....%%.......%%.......  */
0x03,0xC0,0x06,0x00,0x00,0x00,0x01,0x80,  /*  ......%%%%...........%%................................%%.......  */
0x0F,0x03,0x0C,0x63,0x0C,0xC3,0x00,0x00,  /*  ....%%%%......%%....%%...%%...%%....%%..%%....%%................  */
0x03,0xC0,0x06,0x00,0x00,0x00,0x01,0x80,  /*  ......%%%%...........%%................................%%.......  */
0x0F,0x03,0x0C,0x63,0x0C,0xC3,0x00,0x00,  /*  ....%%%%......%%....%%...%%...%%....%%..%%....%%................  */
0x03,0xC0,0x03,0x00,0x00,0x00,0x03,0x00,  /*  ......%%%%............%%..............................%%........  */
0x0F,0x03,0x0C,0x63,0x0C,0xC3,0x00,0x00,  /*  ....%%%%......%%....%%...%%...%%....%%..%%....%%................  */
0x01,0xC0,0x03,0x00,0x00,0x00,0x03,0x00,  /*  .......%%%............%%..............................%%........  */
0x0E,0x03,0x0C,0x63,0x0C,0xC3,0x01,0x80,  /*  ....%%%.......%%....%%...%%...%%....%%..%%....%%.......%%.......  */
0x01,0xE0,0x01,0x80,0x00,0x00,0x06,0x00,  /*  .......%%%%............%%............................%%.........  */
0x1E,0x01,0xF8,0xF3,0x0C,0x7E,0x01,0x80,  /*  ...%%%%........%%%%%%...%%%%..%%....%%...%%%%%%........%%.......  */
0x01,0xE0,0x01,0xC0,0x00,0x00,0x0E,0x00,  /*  .......%%%%............%%%..........................%%%.........  */
0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...%%%%.........................................................  */
0x01,0xE0,0x00,0xE0,0x00,0x00,0x1C,0x00,  /*  .......%%%%.............%%%........................%%%..........  */
0x1E,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ...%%%%.........................................................  */
0x00,0xF0,0x00,0x70,0x00,0x00,0x38,0x00,  /*  ........%%%%.............%%%......................%%%...........  */
0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%..........................................................  */
0x00,0xF0,0x00,0x3C,0x00,0x00,0xF0,0x00,  /*  ........%%%%..............%%%%..................%%%%............  */
0x3C,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ..%%%%..........................................................  */
0x00,0x78,0x00,0x1F,0x00,0x03,0xE0,0x00,  /*  .........%%%%..............%%%%%..............%%%%%.............  */
0x78,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  .%%%%...........................................................  */
0x00,0x78,0x00,0x07,0xC0,0x0F,0x80,0x00,  /*  .........%%%%................%%%%%..........%%%%%...............  */
0x78,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  .%%%%...........................................................  */
0x00,0x3C,0x00,0x01,0xFF,0xFE,0x00,0x00,  /*  ..........%%%%.................%%%%%%%%%%%%%%%%.................  */
0xF0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%%%............................................................  */
0x00,0x1E,0x00,0x00,0x7F,0xF8,0x00,0x01,  /*  ...........%%%%..................%%%%%%%%%%%%..................%  */
0xE0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%%.............................................................  */
0x00,0x1F,0x00,0x00,0x00,0x00,0x00,0x03,  /*  ...........%%%%%..............................................%%  */
0xE0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%%.............................................................  */
0x00,0x0F,0x80,0x00,0x00,0x00,0x00,0x07,  /*  ............%%%%%............................................%%%  */
0xC0,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %%..............................................................  */
0x00,0x07,0xC0,0x00,0x00,0x00,0x00,0x0F,  /*  .............%%%%%..........................................%%%%  */
0x80,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  %...............................................................  */
0x00,0x03,0xF0,0x00,0x00,0x00,0x00,0x3F,  /*  ..............%%%%%%......................................%%%%%%  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x01,0xF8,0x00,0x00,0x00,0x00,0x7E,  /*  ...............%%%%%%....................................%%%%%%.  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0xFE,0x00,0x00,0x00,0x01,0xFC,  /*  ................%%%%%%%................................%%%%%%%..  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x7F,0xC0,0x00,0x00,0x0F,0xF8,  /*  .................%%%%%%%%%..........................%%%%%%%%%...  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x1F,0xFC,0x00,0x00,0xFF,0xE0,  /*  ...................%%%%%%%%%%%..................%%%%%%%%%%%.....  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x07,0xFF,0xC0,0x0F,0xFF,0x80,  /*  .....................%%%%%%%%%%%%%..........%%%%%%%%%%%%%.......  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x01,0xFF,0xFF,0xFF,0xFE,0x00,  /*  .......................%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%.........  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x3F,0xFF,0xFF,0xF0,0x00,  /*  ..........................%%%%%%%%%%%%%%%%%%%%%%%%%%............  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x03,0xFF,0xFF,0x00,0x00,  /*  ..............................%%%%%%%%%%%%%%%%%%................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
0x00,0x00,0x00,0x00,0x3F,0xF0,0x00,0x00,  /*  ..................................%%%%%%%%%%....................  */
0x00,0x00,0x00,0x00,0x00,0x00,0x00,0x00,  /*  ................................................................  */
};


const GSYMBOL legacy_img_logo_ciao = {
    .sh   = {1, 128, 56},
    .data = (uint8_t *)bitmap,
};