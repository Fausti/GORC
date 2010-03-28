#include "core.h"

namespace gorc
{
	bool Core::init()
	{
		if (SDL_Init(0) < 0)
		{
			std::cout << "Couldn't initialize SDL: " << SDL_GetError() << std::endl;
			return false;
		}

		screen = Screen::instance();
		
		if (!screen->init())
			return false;

		return true;	
	}

	void Core::exit()
	{
		if (screen)
			screen->exit();

		SDL_Quit();
	}

	void Core::loop()
	{
		SDL_Event e;

		while (true)
		{
			while(SDL_PollEvent(&e))
			{
				switch(e.type)
				{
				case SDL_KEYDOWN:
					break;
				case SDL_KEYUP:
					break;
				case SDL_MOUSEBUTTONDOWN:
					break;
				case SDL_MOUSEBUTTONUP:
					break;
				case SDL_MOUSEMOTION:
					break;
				case SDL_QUIT:
					std::cout << "Event: SDL_QUIT" << std::endl;
					this->exit();
					return;
					break;
				default:
					break;
				}
			}
		}
	}
}
