#include<stdio.h>
int main()
{
    int a,b;
    if(scanf("%d %d",&a,&b)!=2)
    {
        return 1;
    }
    if(b==0)
    {
        printf("Error: Division by zero\n");
        return 1;
    }
    else 
    {
        printf("%d\n",a/b);
    }
    return 0;
}