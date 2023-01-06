#include<stdio.h>
void main(){
    int n;
    int ans=1;
    printf("Enter n\n");
    scanf("%d",&n);
    for(int i=1;i<=n;i++){
        ans = ans * i;
    }
    printf("Factorial of n is\n%d",ans);
}
