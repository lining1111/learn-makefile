#include <iostream>
#include "a.h"
#include "b.h"
#include "c.h"

using namespace std;

int main(){
    a_init();
    b_init();
    c_init();
    cout << "main ..." << endl;
}
