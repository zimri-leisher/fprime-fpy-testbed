#include "ComFpySubtopologyConfig.hpp"

namespace ComFpy{
    namespace Allocation{ 
        //This instance can be changed to use a different allocator in the ComFpy Subtopology 
        Fw::MallocAllocator mallocatorInstance;
        Fw::MemAllocator& memAllocator = mallocatorInstance;
    }
}
