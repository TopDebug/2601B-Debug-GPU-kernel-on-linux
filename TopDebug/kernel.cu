
#include "kernel.h"

__global__ void TestKernel(unsigned char* img, int nx, int ny)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= nx || y >= ny) return;

	int idx = y * nx + x;
    if (img[idx] == 1)
        img[idx] = 50;

    if (img[idx] == 128)
        img[idx] = 100;

    if (img[idx] == 255)
        img[idx] = 200;
}

void testKernel(unsigned char* img, int nx, int ny)
{
    //dim3 block(160, 160);
    dim3 block(32, 32);
    dim3 grid(
        (640 + block.x - 1) / block.x, // 4
        (480 + block.y - 1) / block.y // 3
    );

    TestKernel <<<grid, block >>> (img, nx, ny);
    cudaDeviceSynchronize();
}

