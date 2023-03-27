#include <iostream>
#include <cuda.h>
__global__ void fun(int *a){
	int id = threadIdx.x + blockDim.x * blockIdx.x;
	a[id] = id;
}
int main()
{
	int *array;
	int N=2048;
	array = (int*)calloc(sizeof(int),N);
	int *d_a;
	cudaMalloc(&d_a,N*sizeof(int));
	fun<<<2,1024>>>(d_a);
	cudaDeviceSynchronize(); //can be commented also
	cudaMemcpy(array, d_a, N*sizeof(int),cudaMemcpyDeviceToHost);
	for(int i=0;i<N;i++){
		printf("%d\n", array[i]);
	}
	return 0;
}