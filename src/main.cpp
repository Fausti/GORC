#include "core.h"

using namespace gorc;

int main(int argc, char** argv)
{
	Core *core = Core::instance();

	core->init();
	core->loop();
	core->exit();

	delete(core);
	
	return 0;
}

