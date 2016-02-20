/*  mandel.c
 *  
 *  gcc -o mand mandel.c
 * 
 */

#include <stdio.h>
#include <math.h>
#include <stdlib.h>
void color();

main()
{
	double x,xx,y,cx,cy;
	int iteration,hx,hy;
	int itermax = 3000;		/* iterations */
	double magnify=1.0;		
	int hxres = 15000;		/* horizonal resolution	*/
	int hyres = 15000;		/* vertical resolution */

	/* header for PPM output */
	printf("%d %d\n255\n",hxres,hyres);

	for (hy=1;hy<=hyres;hy++)  {
		for (hx=1;hx<=hxres;hx++)  {
			cx = (((float)hx)/((float)hxres)-0.5)/magnify*3.0-0.7;
			cy = (((float)hy)/((float)hyres)-0.5)/magnify*3.0;
			x = 0.0; y = 0.0;
			for (iteration=1;iteration<itermax;iteration++)  {
				xx = x*x-y*y+cx;
				y = 2.0*x*y+cy;
				x = xx;
				if (x*x+y*y>100.0)  iteration = 999999;
			}
			if (iteration<99999)  color(0,255,255);
			else color(180,0,0);
		}
	}
}

void color(int red, int green, int blue)  {
	fputc((char)red,stdout);
	fputc((char)green,stdout);
	fputc((char)blue,stdout);
}
