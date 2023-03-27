#include <iostream>
#include <cuda.h>
__global__ void dkernel (){
	int a =2, b = 3;
	int c;
	c = a+b;
	printf("%d\n", c); //still inside the size of printf buffer
}
int main(){
	dkernel <<<1,32>>>();
	cudaDeviceSynchronize();
	return 0;
}