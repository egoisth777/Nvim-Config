#include <iostream>


int main(){
    std::cout << "Hello World" << std::endl;
    return 10;
}
class Element {
    private: 
        size_t size;
        int* data;
    public:
        Element();
        ~Element();
        Element(const Element& other);
        Element(const Element&& other);
    public:
        Element& operator=(const Element& other);
        Element& operator=(const Element&& other);
    public:
};

