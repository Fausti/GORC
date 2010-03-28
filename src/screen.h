#ifndef SCREEN_H_INCLUDED
#define SCREEN_H_INCLUDED

#include <iostream>

#include <SDL/SDL.h>

#include "singleton.h"

namespace gorc
{
	class Screen : public Singleton<Screen>
	{
		friend class Singleton<Screen>;

	public:
		static Screen* instance()
		{
			return Singleton <Screen>::instance();
		}

		bool init();
		void exit();

	private:
		SDL_Surface *p_display;

		Screen():Singleton<Screen>() {};
	};
};

#endif // SCREEN_H_INCLUDED
