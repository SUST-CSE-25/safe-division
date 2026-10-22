// Safe Division, read two integers a and b, print a / b. fixed by Partho(Icarus0064)- 202561201064

#include <stdio.h>

int main(void)
{
    int a, b;

    if (scanf("%d %d", &a, &b) != 2) {
        return 1;
    }

    if (b == 0) {
        printf("Error: division by zero\n");
        return 0;
    }

    printf("%d\n", a / b);

    return 0;
}