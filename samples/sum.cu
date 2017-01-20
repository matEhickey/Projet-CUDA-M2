#include <iostream>
#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/sort.h>
#include <ctime>
#include <time.h>
#include <sstream>
#include <string>
#include <fstream>

using namespace std;


__global__ void reduce0(int *g_idata, int *g_odata, int size){

	// paratagé avec tout les threads dans un bloc
	extern __shared__ int sdata[];

	//On recupere l'endroit ou l'on ecrit dans la memoire partagé ainsi que la case que nous allons traiter
	unsigned int tid = threadIdx.x;
	unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;
	sdata[tid] = 0;
	if (i<size)
		sdata[tid] = g_idata[i];
	__syncthreads();

	for (unsigned int s = 1; s < blockDim.x; s *= 2) {
		if (tid % (2 * s) == 0) {
			sdata[tid] += sdata[tid + s];
		}
		__syncthreads();
	}

	if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}

__global__ void reduce1(int *g_idata, int *g_odata, int size){

	// paratagé avec tout les threads dans un bloc
	extern __shared__ int sdata[];

	//On recupere l'endroit ou l'on ecrit dans la memoire partagé ainsi que la case que nous allons traiter
	unsigned int tid = threadIdx.x;
	unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;
	sdata[tid] = 0;
	if (i<size)
		sdata[tid] = g_idata[i];
	__syncthreads();

	for (unsigned int s = 1; s < blockDim.x; s *= 2) {
		int index = 2 * s * tid;

		if (index < blockDim.x){
			sdata[index] += sdata[index + s];
		}
		__syncthreads();
	}

	if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}

__global__ void reduce2(int *g_idata, int *g_odata, int size){

	// paratagé avec tout les threads dans un bloc
	extern __shared__ int sdata[];

	//On recupere l'endroit ou l'on ecrit dans la memoire partagé ainsi que la case que nous allons traiter
	unsigned int tid = threadIdx.x;
	unsigned int i = blockIdx.x*blockDim.x + threadIdx.x;
	sdata[tid] = 0;
	if (i<size)
		sdata[tid] = g_idata[i];
	__syncthreads();

	for (unsigned int s =blockDim.x / 2; s>0; s >>= 1) {
		if(tid < s) {
			sdata[tid] += sdata[tid + s];
		}
		__syncthreads();
	}

	if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}

__global__ void reduce3(int *g_idata, int *g_odata, int size){

	// paratagé avec tout les threads dans un bloc
	extern __shared__ int sdata[];

	//On recupere l'endroit ou l'on ecrit dans la memoire partagé ainsi que la case que nous allons traiter
	unsigned int tid = threadIdx.x;
	unsigned int i = blockIdx.x*( blockDim.x * 2) + threadIdx.x;
	if (i + blockDim.x <size)
		sdata[tid] = g_idata[i] + g_idata[i + blockDim.x];

	for (unsigned int s = blockDim.x / 2; s>0; s >>= 1) {
		if (tid < s) {
			sdata[tid] += sdata[tid + s];
		}
		__syncthreads();
	}

	if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}


void benchmark(int size, void(*fptr)(int*, int*, int)){
	//initialize the data, all values will be 1(
	//so the final sum will be equal to size

	int threadsPerBlock = 1024;
	int totalBlocks = (size + (threadsPerBlock - 1)) / threadsPerBlock;


	cout << totalBlocks << " blocks, " << threadsPerBlock << " threads per blocks" << endl;


	//Without Optimization
	thrust::host_vector<int> data_h_i(size, 1);
	thrust::device_vector<int> data_v_i = data_h_i;
	thrust::device_vector<int> data_v_o(totalBlocks);

	int* output = thrust::raw_pointer_cast(data_v_o.data());
	int* input = thrust::raw_pointer_cast(data_v_i.data());

	cudaEvent_t start, stop;
	float elapsedTime;

	cudaEventCreate(&start);
	cudaEventRecord(start, 0);


	fptr <<<totalBlocks, threadsPerBlock, threadsPerBlock*sizeof(int) >>>(input, output, size);

	//After the first call, now data_v_o contains the sum for each blocks so we need to sum them
	fptr <<<1, threadsPerBlock, threadsPerBlock*sizeof(int) >>>(output, input, totalBlocks);

	
	cudaEventCreate(&stop);
	cudaEventRecord(stop, 0);
	cudaEventSynchronize(stop);

	

	cudaEventElapsedTime(&elapsedTime, start, stop);
	printf("Elapsed time : %f ms\n", elapsedTime);

	cudaDeviceSynchronize();
	data_v_o[0] = data_v_i[0];
	data_v_i.clear();
	data_v_i.shrink_to_fit();

	thrust::host_vector<int> data_h_o = data_v_o;

	data_v_o.clear();
	data_v_o.shrink_to_fit();

	cout << "Somme : " << data_h_o[0] << endl;
}

void cpu_benchmark(int size){
	int sum = 0;
	thrust::host_vector<int> data_h_i(size, 1);

	clock_t cpu_startTime, cpu_endTime;

	double cpu_ElapseTime = 0;
	cpu_startTime = clock();
		
	for (int i = 0; i < size; i++){
		sum += data_h_i[i];
	}

	cpu_endTime = clock();

	cpu_ElapseTime = ((cpu_endTime - cpu_startTime));

	printf("Elapsed time : %f ms\n", cpu_ElapseTime);
	
	cout << "Somme : " << sum << endl;
}


int main(void){



	int size = 1048576;

	cout << "Size : " << size << endl;

	cout << "--------------------" << endl;
	cout << "CPU : " << endl;
	cpu_benchmark(size);

	cout << "--------------------" << endl;
	cout << "Without Optimization : " << endl;
	benchmark(size,&reduce0);
	
	cout << "--------------------" << endl;
	cout << "Without divergent branching : " << endl;
	benchmark(size, &reduce1);
	
	cout << "--------------------" << endl;
	cout << "With Sequential Adressing : " << endl;
	benchmark(size, &reduce2);

	cout << "--------------------" << endl;
	cout << "With No Idle Threads : " << endl;
	benchmark(size, &reduce3);


	return 0;
}
