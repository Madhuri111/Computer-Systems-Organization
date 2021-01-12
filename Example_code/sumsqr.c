#include <stdio.h>

int sum =0;
int main()
{
 int i;
 for(i=0; i<=10; ++i)
   sum+= i*i;

 printf(" &sum  = %p, sum = %d &i = %p \n", &sum, sum, &i);
}
