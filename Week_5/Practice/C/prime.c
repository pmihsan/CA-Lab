#include<stdio.h>

int prime(int n){
    if(n <= 1){
        return 0;
    }
    int c = 2;
    while(c*c <= n){
        if(n % c == 0){
            return 0;
        }
        c++;
    }
    return 1;
}

void main(){
    int n;
    printf("Enter n:\n");
    scanf("%d",&n);
    int ans = prime(n);
    if(ans == 1){
        printf("%d - Prime Number\n",n);
    }
    else{
        printf("%d - Not a Prime Number\n",n);
    }
}
