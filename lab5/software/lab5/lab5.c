// lab5.c - initialize SSD1331 and fill framebuffer with an image
// Robert Trost - Feb 3, 2020

#include "image.h"		// image to write to display
#include "system.h"		// peripheral base addresses
#include <altera_avalon_spi.h> // function to control altera SPI IP

// rgb display initialization sequence
#define INITDATA_SIZE 38
unsigned char initdata[INITDATA_SIZE] = { 0xAE, 0x81, 0xFF, 0x82, 0xFF, 0x83, 0xFF,
		     0x87, 0x06, 0x8A, 0x64, 0x8B, 0x78, 0x8C,
		     0x64, 0xA0, 0x73, 0xA1, 0x00, 0xA2, 0x00,
		     0xA4, 0xA8, 0x3F, 0xAD, 0x8E, 0xB0, 0x00,
		     0xB1, 0x31, 0xB3, 0xF0, 0xBB, 0x3A, 0xBE,
		     0x3E, 0x2E, 0xAF } ;

// macros to set/clear rgb_dcn pin connected to bit 0 of gpio processor output
#define SET_DCN (*(int*)PIO_BASE) = 1
#define CLEAR_DCN (*(int*)PIO_BASE) = 0

int main()
{
	int x, y ; // array indices used to access pixel data in image array
	unsigned char data;  // temporary storage of byte to be sent to display

	// send controller initialization sequence
   CLEAR_DCN;
   alt_avalon_spi_command(SPI_0_BASE, 0, INITDATA_SIZE, initdata, 0, NULL, 0) ;

  // fill framebuffer - note array starts from top left going across rows,
  // but must fill buffer from top left, going down columns.
  SET_DCN;
  for ( x=0 ; x < IMAGE_WIDTH ; x++ ) {
      for ( y=0 ; y < IMAGE_HEIGHT ; y++ ) {
    	  // send 16 bits representing the pixel colour: RRRRRGGG_GGGBBBBB
    	  alt_avalon_spi_command(SPI_0_BASE, 0, 1, &image[(y*IMAGE_WIDTH+x)*BYTES_PER_PIXEL], 0, NULL, 0) ;
    	  alt_avalon_spi_command(SPI_0_BASE, 0, 1, &image[(y*IMAGE_WIDTH+x)*BYTES_PER_PIXEL+1], 0, NULL, 0) ;
       }
	}
   return 0;
}
