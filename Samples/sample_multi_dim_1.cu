#include <iostream>
#include <cuda.h>
__global__ void dkernel (){
	printf("%d\n", threadIdx.x); //still inside the size of printf buffer
}
int main(){
	dim3 block(8,32,4);
	dkernel <<<2,128>>>();
	cudaDeviceSynchronize();
	return 0;
}