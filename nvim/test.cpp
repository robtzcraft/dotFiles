
#include "iostream"
using namespace std;

string test() {
  int a = 0;
  for(int i = 0; i < 10; i++){
    cout << a + i << endl;
  }
  return "This is a test";
}

int main() {
  string result = test();
  cout << "result: " << result << endl;
  return 0;
}
