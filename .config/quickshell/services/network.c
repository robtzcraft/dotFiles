
#include <stdio.h>
#include <unistd.h>

int main() {
    
    int test = 1;
    printf("%i", test);
    for(;;) {
        printf("Hello %i \n", test);
        sleep(1);
        test += 1;
    }

    return 0;
}
