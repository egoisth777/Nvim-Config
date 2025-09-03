#include <cstdint>
#include <iostream>
#include <vector>

/**
 * This is the Element for Everything
 *
 * I would like to change a bit
 */

class Element {
private:
  size_t size;
  int *data;

public:
  Element();
  ~Element();

  Element(const Element &other);
  Element(const Element &&other);

public:
  Element &operator=(const Element &other);
  Element &operator=(const Element &&other);

public:
};

template <typename T> struct Object {
protected:
  T data{};
  std::vector<T> data_vec{};

public:
  inline const T &GetData() const { this->data; }
  const std::vector<T> &GetArray() const { this->data_vec; }
};

static int Migrating() {}

int main() {
  bool a = true;
  float afloat = 10.0f;
  int b = 10;
  int *c = &b;

  std::string str = "Hello World\n";
  if (a != *c) {
    std::cout << "Hello, you are not here\n";
  } else {
    std::cout << "You are bad guy" << std::endl;
    std::cout << "You are a good guy" << std::endl;
  }

  return 0;
}

class A {
private:
  char *data;
  void Print();
  inline const char *const GetData() const { return this->data; }
};

void A::Print() { std::cout << "The Data is: " << this->data << " \n"; }
