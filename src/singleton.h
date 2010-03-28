#ifndef SINGLETON_H_INCLUDED
#define SINGLETON_H_INCLUDED

template <typename C>

class Singleton
{
public:
	static C* instance ()
	{
		if (!_instance)
			_instance = new C ();
		return _instance;
	}

	virtual ~Singleton ()
	{
		_instance = 0;
	}

private:
	static C* _instance;

protected:
	Singleton() {};

};

template <typename C> C* Singleton <C>::_instance = 0;

#endif // SINGLETON_H_INCLUDED

