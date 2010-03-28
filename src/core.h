#ifndef CORE_H_INCLUDED
#define CORE_H_INCLUDED

#include <cstdlib>
#include <iostream>

#include "singleton.h"
#include "screen.h"

namespace gorc
{
	class Core : public Singleton<Core>
	{
	friend class Singleton<Core>;

	private:
		Core() : Singleton<Core>() {}

	public:
		static Core* instance()
		{
			return Singleton<Core>::instance();	
		}

		Screen *screen;

		bool init();
		void loop();
		void exit();
	};
};

#endif // CORE_H_INCLUDED

