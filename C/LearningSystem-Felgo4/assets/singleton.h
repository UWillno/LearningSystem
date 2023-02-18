#ifndef SINGLETON_H
#define SINGLETON_H

template < typename T >
class Singleton final
{
  public:
    static T& GetInstance()
    {
        static T instance;
        return instance;
    }

private:
    Singleton() = default;
    ~Singleton() = default;

    Singleton(const Singleton&) = delete;
    Singleton& operator=(const Singleton&) = delete;
    Singleton(Singleton&&) = delete;
    Singleton& operator=(Singleton&&) = delete;
};

#endif // SINGLETON_H
