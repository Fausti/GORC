#include <stdio.h>
#include <stdlib.h>

#include <lua.h>
#include <lauxlib.h>
#include <lualib.h>

#include <SDL/SDL.h>

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

int main(int argc, char *argv[])
{
	lua_State *L = lua_open();
	
	luaL_openlibs(L);

	lua_pushcfunction(L, l_ink);
	lua_setglobal(L, "ink");

	luaL_dofile(L, "scripts/script.lua");

	lua_close(L);
	
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

