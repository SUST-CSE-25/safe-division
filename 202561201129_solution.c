// Safe Division, fixed by Ansari, 202561201129.
#include <stdio.h>

int main(void)
{
    int a, b;

    if (scanf("%d %d", &a, &b) != 2) {
        return 1;
    }

    if (b == 0) {
        printf("Error: division by zero\n");
        return 1;
    }

    printf("%d\n", a / b);

    return 0;
}
