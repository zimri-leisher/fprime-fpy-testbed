// ======================================================================
// \title  SignalGen.hpp
// \author bocchino
// \brief  hpp file for SequenceFileLoader component implementation class
//
// \copyright
// Copyright (C) 2009-2016 California Institute of Technology.
// ALL RIGHTS RESERVED.  United States Government Sponsorship
// acknowledged.
//
// ======================================================================

#ifndef Svc_SignalGen_HPP
#define Svc_SignalGen_HPP

#include <Fw/Types/ByteArray.hpp>
#include <Fw/Types/ConstByteArray.hpp>
#include <Os/File.hpp>
#include <Os/ValidateFile.hpp>
#include <FpyDemo/SignalGen/SignalGenComponentAc.hpp>
#include <cmath>

namespace FpyDemo {

    class SignalGen final :
        public SignalGenComponentBase
    {

    private:

        void schedIn_handler(
            FwIndexType portNum, /*!< The port number*/
            U32 context /*!< The call order*/
        ) final;

        void Settings_cmdHandler(
            FwOpcodeType opCode, /*!< The opcode*/
            U32 cmdSeq, /*!< The command sequence number*/
            U32 Frequency,
            F32 Amplitude,
            F32 Phase,
            FpyDemo::SignalType SigType
        ) final;

        void Toggle_cmdHandler(
            FwOpcodeType opCode, /*!< The opcode*/
            U32 cmdSeq /*!< The command sequence number*/
        ) final;

        void Skip_cmdHandler(
            FwOpcodeType opCode, /*!< The opcode*/
            U32 cmdSeq /*!< The command sequence number*/
        ) final;

        //! Handler implementation for command Dp
        //!
        //! Signal Generator Settings
        void Dp_cmdHandler(
           FwOpcodeType opCode, //!< The opcode
           U32 cmdSeq, //!< The command sequence number
           FpyDemo::SignalGen_DpReqType reqType,
           U32 records,
           U32 priority
       ) final;

        // ----------------------------------------------------------------------
        // Handler implementations for data products
        // ----------------------------------------------------------------------

        //! Receive a container of type DataContainer
        void dpRecv_DataContainer_handler(
            DpContainer& container, //!< The container
            Fw::Success::T status //!< The container status
        ) final;


    public:
        //! Construct a SignalGen
        SignalGen(
            const char* compName //!< The component name
        );

        //! Destroy a SignalGen
        ~SignalGen();

    private:
        // Generate the next sample internal helper
        F32 generateSample(U32 ticks);

        // DP cleanup helper
        void cleanupAndSendDp();

        // Member variables
        U32 sampleFrequency;
        U32 signalFrequency;
        F32 signalAmplitude;
        F32 signalPhase;
        U32 ticks;
        SignalType sigType;
        SignalSet sigHistory;
        SignalPairSet sigPairHistory;
        bool running;
        bool skipOne;
        DpContainer m_dpContainer;
        bool m_dpInProgress; //!< flag to indicate data products are being generated
        U32 m_numDps; //!< number of DPs to store
        U32 m_currDp; //!< current DP number
        U32 m_dpBytes; //!< currently serialized records
        FwDpPriorityType m_dpPriority; //!< stored priority for current DP

    };
}
#endif
