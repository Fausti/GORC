#define VERSION "0.0.1"

#ifdef WIN32
	#include <SDL.h>
	#include <SDL_image.h>
	#include <SDL_mixer.h>
	#include <SDL_ttf.h>
#else
	#include <SDL/SDL.h>
	#include <SDL/SDL_image.h>
	#include <SDL/SDL_mixer.h>
	#include <SDL/SDL_ttf.h>
#endif

#define TRUE 1
#define FALSE 0

void *game_mode;

int cycle_delay;
int cycle_count;
int cycle_limit;
int cycle_next;

void cleanup();

