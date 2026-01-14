
#include <cuda_runtime.h>

extern "C" unsigned char* read_memory(unsigned char* d_ptr, size_t size) {
    unsigned char* host_ptr = (unsigned char*)malloc(size);
    if (!host_ptr) return NULL;
    cudaMemcpy(host_ptr, d_ptr, size, cudaMemcpyDeviceToHost);
    return host_ptr;
}

extern "C" int check_pointer(void* ptr)
{
    cudaPointerAttributes attr;
    cudaError_t err = cudaPointerGetAttributes(&attr, ptr);
    switch(attr.type)
    {
        case cudaMemoryTypeUnregistered:
        case cudaMemoryTypeHost:
        case cudaMemoryTypeManaged:
            return 0;
        case cudaMemoryTypeDevice:
            return 1;
    }
    return 0;
}

