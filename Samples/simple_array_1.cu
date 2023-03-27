#include <iostream>
#include <cuda.h>
__global__ void fun(int *a){
	int id = threadIdx.x;
	a[id] = id * id;
}
int main()
{
	int *array;
	int N=100;
	array = (int*)calloc(sizeof(int),N);
	fun<<<1,N>>>(array);
	cudaDeviceSynchronize();
	for(int i=0;i<N;i++){
		printf("%d\n", array[i]);
	}
	return 0;
}