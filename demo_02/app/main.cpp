#include <iostream>
#include "../a_dir/a.h"
#include "../b_dir/b.h"

using namespace std;

int main(){
    a_init();
    b_init();
    cout << "main ..." << endl;
}
