#include <stdio.h>
#include <stdlib.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#include <SDL/SDL.h>
#include <SDL/SDL_ttf.h>

#include "game.h"

SDL_Surface *screen;
SDL_Surface *icon;
TTF_Font    *font;

/*
int l_ink(lua_State *L)
{
	int x;

	if (lua_gettop(L) >= 0)
	{
		x = (int) lua_tonumber(L, -1);
		lua_pushnumber(L, x + 1);
	}

	return 1;
}
*/

int main(int argc, char *argv[])
{
	screen 	= NULL;
	icon 	= NULL;
	font 	= NULL;

/*
	lua_State *L = lua_open();
	
	luaL_openlibs(L);

	lua_pushcfunction(L, l_ink);
	lua_setglobal(L, "ink");

	luaL_dofile(L, "scripts/script.lua");

	lua_close(L);
*/

	if (SDL_Init(SDL_INIT_EVERYTHING) < 0)
	{
		printf("Unable to init SDL: %s\n", SDL_GetError());
		exit(1);
	}

	atexit(cleanup);

	screen = SDL_SetVideoMode(640, 480, 32, SDL_HWSURFACE | SDL_DOUBLEBUF);
	
	// Icon?
	SDL_WM_SetCaption("GORC", "gorc");

	if (TTF_Init() < 0)
	{
		printf("Unable to init SDL_ttf: %s\n", TTF_GetError());
		exit(1);
	}

	font = TTF_OpenFont("data/nokiafc22.ttf", 12);

	if (!font)
	{
		printf("Couldn't load font: %s\n", TTF_GetError());
		exit(1);
	}

	SDL_Color color = {255, 0, 0};
	SDL_Surface *text_surface = TTF_RenderText_Solid(font, "Hello World!", color);
	SDL_BlitSurface(text_surface, NULL, screen, NULL);
	SDL_Flip(screen);

	int running = 1;

	while (running == 1)
	{
		SDL_Event event;
		SDL_WaitEvent(&event);

		switch(event.type)
		{
			case SDL_KEYDOWN:
				running = 0;
			case SDL_QUIT:
				running = 0;
		}
	}

	return 0;
}

void cleanup()
{
	if (font) TTF_CloseFont(font);

	TTF_Quit();
	SDL_Quit();
}

