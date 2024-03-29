#include <std.io>
#include <stdlib.h>

#include "cuda.h"

// This is my DEVICE function 
// __global__ mean this function is visible to the host
__global__ void kernelHelloWorld() {
  
  int thread = threadIdx.x; //local thread number in a block
  int block = blockIdx.x; //block number

  print("Hello World from thread %d of block %d!\n", thread, block);

}

int main(int argc, char** argv) {

  int Nblocks = 10; //number of blocks
  int Nthreads = 3; //number of threads per block

  // run the function 'kernelHellowWorld' on the DEVICE
  kernelHelloWorld <<< Nblocks, Nthreads >>> ();
  
  cudaDeviceSynchronize();

}
