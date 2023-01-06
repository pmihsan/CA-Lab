#include<stdio.h>
void main(){
    int n;
    int ans=0;
    printf("Enter n\n");
    scanf("%d",&n);
    while(n > 0){
        ans += 1;
        n = n & (n - 1);
    }
    printf("Number of SetBits\n%d",ans);
}
