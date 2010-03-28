#include "screen.h"

namespace gorc
{
	bool Screen::init()
	{
		if (SDL_InitSubSystem(SDL_INIT_VIDEO) < 0)
		{
			std::cout << "Couldn't initialize Video Subsystem: " << SDL_GetError() << std::endl;
		}

		p_display = SDL_SetVideoMode(640, 480, 32, SDL_HWSURFACE | SDL_DOUBLEBUF);

		if (!p_display)
		{
			std::cout << "Couldn't initialize Window: " << SDL_GetError() << std::endl;
			return false;	
		}

		return true;
	}

	void Screen::exit()
	{
		if (p_display)
			SDL_FreeSurface(p_display);

		SDL_QuitSubSystem(SDL_INIT_VIDEO);
	}
};

