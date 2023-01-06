#include<stdio.h>
void main(){
	int n;
	printf("Enter n\n");
	scanf("%d",&n);
	int a = 0;
	int b = 1;
	int c = 0;
	if(n <= 0){
		printf("Fibonacci is %d\n",a);
	}
	else if(n <= 2){
		printf("Fibonacci is %d\n",b);
	}
	else{
		for(int i=2;i<=n;i++){
			c = a + b;
			a = b;
			b = c;
		}
		printf("Fibonacci is %d\n",c);
	}
}

