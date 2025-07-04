#ifndef COMCCSDSSUBTOPOLOGY_DEFS_HPP
#define COMCCSDSSUBTOPOLOGY_DEFS_HPP

#include <Svc/FrameAccumulator/FrameDetector/CcsdsTcFrameDetector.hpp>
#include <Fw/Types/MallocAllocator.hpp>
#include <Svc/BufferManager/BufferManager.hpp>
#include "FpyDemo/ComFpy/ComFpyConfig/FppConstantsAc.hpp"
#include "ComFpyConfig/ComFpySubtopologyConfig.hpp"

namespace ComFpy {
    struct SubtopologyState {
        const char* hostname;
        U16 port;         
    };

    struct TopologyState {
        SubtopologyState comCcsds;
    };
}

#endif
