// Safe Division: read two integers a and b, print a / b.
#include <stdio.h>

int main(void)
{
    int a, b;

    if (scanf("%d %d", &a, &b) != 2) {
        return 1;
    }

    if (b) printf("%d\n", a / b);
    else printf("Error: division by zero\n");

    return 0;
}
