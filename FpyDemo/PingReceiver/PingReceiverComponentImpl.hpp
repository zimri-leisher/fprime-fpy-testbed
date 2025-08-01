// ======================================================================
// \title  PingReceiverImpl.hpp
// \author tim
// \brief  hpp file for PingReceiver component implementation class
//
// \copyright
// Copyright 2009-2015, by the California Institute of Technology.
// ALL RIGHTS RESERVED.  United States Government Sponsorship
// acknowledged.
//
// ======================================================================

#ifndef PingReceiver_HPP
#define PingReceiver_HPP

#include "FpyDemo/PingReceiver/PingReceiverComponentAc.hpp"

namespace FpyDemo {

  class PingReceiverComponentImpl final :
    public PingReceiverComponentBase
  {

    public:

      // ----------------------------------------------------------------------
      // Construction, initialization, and destruction
      // ----------------------------------------------------------------------

      //! Construct object PingReceiver
      //!
      PingReceiverComponentImpl(
          const char *const compName /*!< The component name*/
      );

      //! Destroy object PingReceiver
      //!
      ~PingReceiverComponentImpl();

    private:

      // ----------------------------------------------------------------------
      // Handler implementations for user-defined typed input ports
      // ----------------------------------------------------------------------

      //! Handler implementation for PingIn
      //!
      void PingIn_handler(
          const FwIndexType portNum, /*!< The port number*/
          U32 key /*!< Value to return to pinger*/
      );

      void PR_StopPings_cmdHandler(
              FwOpcodeType opCode, /*!< The opcode*/
              U32 cmdSeq /*!< The command sequence number*/
          );

      bool m_inhibitPings;
      U32 m_pingsRecvd;


    };

} // end namespace FpyDemo

#endif
