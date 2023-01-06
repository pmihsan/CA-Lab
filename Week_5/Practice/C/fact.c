#include<stdio.h>

int fact(int n){
    if(n <= 1){
        return 1;
    }
    int ans = 1;
    for(int i = 2;i<=n;i++){
        ans = ans * i;
    }
    return ans;
}

void main(){
    int n;
    printf("Enter n:\n");
    scanf("%d",&n);
    int ans = fact(n);
    printf("Factorial of n is\n%d\n",ans);
}
