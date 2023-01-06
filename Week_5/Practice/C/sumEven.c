#include<stdio.h>

int sumEven(int n){
    if(n <= 0){
        return 0;
    }
    int sum = 0;
    for(int i = 0;i<=n;i+=2){
        sum += i;
    }
    return sum;
}

void main(){
    int n;
    printf("Enter n:\n");
    scanf("%d",&n);
    int ans = sumEven(n);
    printf("Sum of even numbers till n is\n%d\n",ans);
}
