#include <iostream>
int func(int);

int main()
{
    std::cout << "value: " << func(10) << std::endl;
    std::cout << "hello world!" << std::endl;
}

int func(int a)
{
    return ++a;
}
