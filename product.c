// GroupID-12 (1511600_15116025) - AALIND SHARMA & HIMANSHU DUA
// Date: November 4, 2016
// product.c - Problem No.-7
#include <stdio.h>
int prod(int x){
	if(x==1)return 1;
	return x*prod(x-1);
}

int main(void) {
	int N;
	printf("Positive integer,N: ");
	scanf("%d",&N);
	printf("The value of product of %d",N);
	printf(" consecutive integers starting from 1 is:%d",prod(N));
	
	return 0;
}

