#include <iostream>
#include <cuda.h>
__global__ void fun(int *a){
	int id = threadIdx.x;
	a[id] = id * id;
}
int main()
{
	int *array;
	int N=1024;
	array = (int*)calloc(sizeof(int),N);
	int *d_a;
	cudaMalloc(&d_a,N*sizeof(int));
	fun<<<1,N>>>(d_a);
	cudaDeviceSynchronize(); //can be commented also
	cudaMemcpy(array, d_a, N*sizeof(int),cudaMemcpyDeviceToHost);
	for(int i=0;i<N;i++){
		printf("%d\n", array[i]);
	}
	return 0;
}