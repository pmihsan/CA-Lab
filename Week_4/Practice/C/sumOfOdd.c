#include<stdio.h>
void main(){
    int n;
    int ans=0;
    printf("Enter n\n");
    scanf("%d",&n);
    for(int i=1;i<=n;i+=2){
        ans += i;
    }
    printf("Sum of n is\n%d",ans);
}
