#include <stdio.h>
#include <unistd.h>

int main() {
    int n = 0;
    while(n < 1000) {
        scanf("%d", &n);
        printf("%d\n", n + 1);
    }
    sleep(1);
    printf("end\n");
    return 0;
}
