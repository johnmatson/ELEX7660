// toneplayer.c - play a tune using hardware tone generator ELEX 7660 201710 Lab 4
// created by Ed. Casas 2017-1-22
// modified by Robert Trost 2020-1-27

#include "unistd.h"		/* for usleep() */

#define N 72
#define QUARTER_NOTE_DURATION 150000 // 150ms per quarter note

int freq [N] = { 330, 392, 440, 494, 523, 494, 440, 370, 294,
    330, 370, 392, 330, 330, 311, 330, 370, 311, 247, 330, 392,
    440, 494, 523, 494, 440, 370, 294, 330, 370, 392, 370, 330,
    311, 277, 294, 330, 330, 587, 587, 554, 494, 440, 370, 294,
    330, 370, 392, 330, 330, 311, 330, 370, 311, 247, 587, 587,
    554, 494, 440, 370, 294, 330, 370, 392, 370, 330, 311, 277,
    294, 330, 330} ;

int duration [N] = { 2, 4, 2, 3, 1, 2, 4, 2, 3, 1, 2, 4, 2, 3, 1, 2,
    4, 2, 4, 2, 4, 2, 3, 1, 2, 4, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2,
    6, 4, 6, 3, 1, 2, 4, 2, 3, 1, 2, 4, 2, 3, 1, 2, 4, 2, 6, 6,
    3, 1, 2, 4, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 6, 4} ;


#include "system.h"		/* peripheral base addresses */
#define SETFREQ(x) (*(int*)TONEGEN_0_BASE) = (x)


int main()
{ 
  int i; // array index for playing tuse

 
  for (i =0; i < N; i++) {
      SETFREQ(freq[i]);
      usleep(duration[i] * QUARTER_NOTE_DURATION);
  }

   SETFREQ(0);
   return 0;
}

