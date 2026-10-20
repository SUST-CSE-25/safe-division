//safe division
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
        printf("Error: division by zero\n");
        return 0;
    }
    else 
    {
        printf("%d\n",a/b);
    }
    return 0;
}