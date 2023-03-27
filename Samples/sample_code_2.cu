#include <iostream>
#include <cuda.h>
__global__ void dkernel (){
	int a =2, b = 3;
	int c;
	c = a+b;
	int gid = threadIdx.x;
	printf("%d\n", gid); //still inside the size of printf buffer
}
int main(){
	dkernel <<<1,1024>>>();
	cudaDeviceSynchronize();
	return 0;
}