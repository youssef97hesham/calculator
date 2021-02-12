#include <stdio.h>
#include <stdlib.h>

int main()
{
    int sw = 1;


    while(sw != 0){
        printf("\nEnter 1: for subtraction \n, 2: for division \n, 3: for addition \n, 4: for power \n, 5: max of list \n, 6: factorization. \n");
        scanf("%d", &sw);

       switch(sw){
        case 1:
            substraction();
            break;
        case 2:
            division();
            break;
        case 3:
            addition();
            break;
        case 4:
            power();
            break;
        case 5:
            maxofList();
            break;
        case 6:
            factorization();
            break;
        default:
            printf("the number you choose is wrong \n Please Choose another number or 0 to exit\n");

        }
    }
return 0;

}

void substraction()
{
    // Defining Subtraction result variable that contains the result
    float subresult,no1s ,no2s;
    printf("Enter first number: ");
    scanf("%f", &no1s);
    printf("Enter Second number: ");
    scanf("%f", &no2s);

    // Subtraction equation of Adding No1 - No2
    subresult = no1s - no2s;

    // Returning addition result
    printf("%f", subresult);

}

void division()
{
    float no1d, no2d,divresult;
   printf("Enter first number: ");
    scanf("%f", &no1d);
    printf("Enter Second number: ");
    scanf("%f", &no2d);

    // Divsion equation of Dividing No1 / No2
    divresult = no1d / no2d;

    // Returning addition result
    printf("%f", divresult);
}

void addition()
{
    // Defining Addition result variable that contains the result
    float addresult,no1a,no2a;
    printf("Enter first number: ");
    scanf("%f", &no1a);
    printf("Enter Second number: ");
    scanf("%f", &no2a);

    // Addition equation of Adding No1 + No2
    addresult = no1a + no2a;

    // Returning addition result
    printf("%f", addresult);
}




void power()
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


}


double find_maximum(double a[], int n) {
  int i;
  double max= a[0];

  for (i = 1; i< n; i++)
    if (a[i] > max)
      max = a[i];

  return max;
}


void maxofList()
{
  int i, size;
  double maximum;
  double array[100];

  printf("Input number of elements in array\n");
  scanf("%d", &size);

  printf("Enter %d elements\n", size);

  for (i = 0; i < size; i++)
    scanf("%lf", &array[i]);

  maximum = find_maximum(array, size);

  printf("Maximum element = %lf.\n", maximum);


}




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





