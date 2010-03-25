#include <stdio.h>
#include <stdlib.h>

#include <SDL/SDL.h>

int main(int argc, char *argv[])
{
	if (SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		printf("Unable to init SDL: %s\n", SDL_GetError());
		exit(1);
	}

	atexit(SDL_Quit);

	SDL_Surface *screen;
	screen = SDL_SetVideoMode(640, 480, 32, SDL_HWSURFACE | SDL_DOUBLEBUF);

	return 0;
}

