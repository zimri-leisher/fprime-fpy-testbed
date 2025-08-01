#ifndef REF_LPR_ATM_IMPL_HPP
#define REF_LPR_ATM_IMPL_HPP

#include <FpyDemo/RecvBuffApp/RecvBuffComponentAc.hpp>

namespace FpyDemo {

    class RecvBuffImpl final : public RecvBuffComponentBase {
        public:

            // Only called by derived class
            RecvBuffImpl(const char* compName);

            ~RecvBuffImpl();

        private:

            // downcall for input port
            void Data_handler(FwIndexType portNum, Drv::DataBuffer &buff);
            FpyDemo::PacketStat m_stats;
            U32 m_buffsReceived; // !< number of buffers received
            bool m_firstBuffReceived; // !< first buffer received or not
            U32 m_errBuffs; // !< number of buffers with errors received
            F32 m_sensor1;
            F32 m_sensor2;

            // parameter update notification
            void parameterUpdated(FwPrmIdType id);

    };

}

#endif
