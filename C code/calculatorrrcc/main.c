#include <stdio.h>
#include <stdlib.h>

int main()
{
    //-----------power --------------
    int a, b;
    printf("Enter the first value:");
    scanf("%d", &a);

    printf("Enter the second value:");
    scanf("%d", &b);

    int c = 1;
    int d = 1;

    for(c ; c <= b ; c++)
    {
        d = d*a;
    }


    printf("%d", d);
    return 0;





//division subtractio addition
case '+':
            result = number1 + number2;
            break;

        case '-':
            result = number1 - number2;
            break;

case '/':
            result = number1 / number2;
            break;

case '%':
            result = number1 % number2;
            break;


 //---------------max of list---------------
   int i, size, maximum;
  double array[100];

  printf("Input number of elements in array\n");
  scanf("%d", &size);

  printf("Enter %d elements\n", size);

  for (i = 0; i < size; i++)
    scanf("%lf", &array[i]);

  maximum = find_maximum(array, size);

  printf("Maximum element = %lf.\n", maximum);

  return 0;



//-------fatorization------------
    factorization();
    return 0;

}




//-----------factorization------------
void factorization(){
     int i, num, isPrime;

    // Input a number from user
    printf("Enter any number to print Prime factors: ");
    scanf("%d", &num);

    printf("All Prime Factors of %d are: \n", num);

    i =2;

    while(i <= num)
    {
        // Check 'i' for factor of num
        if(num%i==0)
        {
            num = num/i;
            printf("%d, ", i);

        }else{
            i++;
        }

    }
}






//--------max of list---------
double find_maximum(double a[], int n) {
  int i;
  double max= a[0];

  for (i = 1; i< n; i++)
    if (a[i] > max)
      max = a[i];

  return max;
}
