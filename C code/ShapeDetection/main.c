#include <stdio.h>
#include <stdlib.h>

int main()
{
   shapeDetection();

    return 0;
}


int shapeDetection(){

 int x,y,z;
    printf("Enter length of side(s): ");
    scanf("%d", &x);

    if(x == 0)
    {
        printf("Error:: cannot first side be zero! ");
    }
    else
    {
        printf("Enter second side or zero if you finished: ");
        scanf("%d", &y);

        if(y == 0){

            printf("the shape is square");
            return 0;
        }
        else
        {

            printf("Enter third side or zero if you finished: ");

            scanf("%d", &z);
            if(z == 0){
                if(x==y){
                    printf("the shape is square");

                }else{
                    printf("the shape is rectangle");

                }
                 return 0;
            }
            else{
                if(x+y <= z ||z+y <= x ||x+z <= y){
                    printf("the shape is not correct");
                }else{
                    printf("the shape is triangle");
                }
            }
        }
    }
}
