module ComFpy {

    # ComPacket Queue enum for queue types
    enum Ports_ComPacketQueue {
        EVENTS,
        TELEMETRY,
        FILE_QUEUE 
    }

    # ----------------------------------------------------------------------
    # Active Components
    # ----------------------------------------------------------------------
    instance comQueue: Svc.ComQueue base id ComFpyConfig.BASE_ID + 0x0100 \
        queue size ComFpyConfig.QueueSizes.comQueue \
        stack size ComFpyConfig.StackSizes.comQueue \
        priority ComFpyConfig.Priorities.comQueue \
    {
        phase Fpp.ToCpp.Phases.configConstants """
        enum {
            EVENTS,
            TELEMETRY,
            FILE_QUEUE
        };
        """
        phase Fpp.ToCpp.Phases.configComponents """
        Svc::ComQueue::QueueConfigurationTable configurationTable;

        // Events (highest-priority)
        configurationTable.entries[ConfigConstants::ComFpy_comQueue::EVENTS].depth = ComFpyConfig::QueueDepths::events;
        configurationTable.entries[ConfigConstants::ComFpy_comQueue::EVENTS].priority = ComFpyConfig::QueuePriorities::events;

        // Telemetry
        configurationTable.entries[ConfigConstants::ComFpy_comQueue::TELEMETRY].depth = ComFpyConfig::QueueDepths::tlm;
        configurationTable.entries[ConfigConstants::ComFpy_comQueue::TELEMETRY].priority = ComFpyConfig::QueuePriorities::tlm;

        // File Downlink Queue
        configurationTable.entries[ConfigConstants::ComFpy_comQueue::FILE_QUEUE].depth = ComFpyConfig::QueueDepths::file;
        configurationTable.entries[ConfigConstants::ComFpy_comQueue::FILE_QUEUE].priority = ComFpyConfig::QueuePriorities::file;

        // Allocation identifier is 0 as the MallocAllocator discards it
        ComFpy::comQueue.configure(configurationTable, 0, ComFpy::Allocation::memAllocator);
        """
        phase Fpp.ToCpp.Phases.tearDownComponents """
        ComFpy::comQueue.cleanup();
        """
    }

    instance cmdSeq: Svc.FpySequencer base id ComFpyConfig.BASE_ID + 0x0200 \
        queue size ComFpyConfig.QueueSizes.cmdSeq \
        stack size ComFpyConfig.StackSizes.cmdSeq \
        priority ComFpyConfig.Priorities.cmdSeq \
    {
        phase Fpp.ToCpp.Phases.configComponents """
        ComFpy::cmdSeq.allocateBuffer(0, ComFpy::Allocation::memAllocator, ComFpyConfig::BuffMgr::cmdSeqBuffSize);
        """

        phase Fpp.ToCpp.Phases.tearDownComponents """
        ComFpy::cmdSeq.deallocateBuffer(ComFpy::Allocation::memAllocator);
        """
    }

    # ----------------------------------------------------------------------
    # Passive Components
    # ----------------------------------------------------------------------
    instance frameAccumulator: Svc.FrameAccumulator base id ComFpyConfig.BASE_ID + 0x0500 \ 
    {

        phase Fpp.ToCpp.Phases.configObjects """
        Svc::FrameDetectors::CcsdsTcFrameDetector frameDetector;
        """
        phase Fpp.ToCpp.Phases.configComponents """
        ComFpy::frameAccumulator.configure(
            ConfigObjects::ComFpy_frameAccumulator::frameDetector,
            1,
            ComFpy::Allocation::memAllocator,
            ComFpyConfig::BuffMgr::frameAccumulatorSize
        );
        """

        phase Fpp.ToCpp.Phases.tearDownComponents """
        ComFpy::frameAccumulator.cleanup();
        """
    }

    instance commsBufferManager: Svc.BufferManager base id ComFpyConfig.BASE_ID + 0x0600 \
    {
        phase Fpp.ToCpp.Phases.configObjects """
        Svc::BufferManager::BufferBins bins;
        """

        phase Fpp.ToCpp.Phases.configComponents """
        memset(&ConfigObjects::ComFpy_commsBufferManager::bins, 0, sizeof(ConfigObjects::ComFpy_commsBufferManager::bins));
        ConfigObjects::ComFpy_commsBufferManager::bins.bins[0].bufferSize = ComFpyConfig::BuffMgr::commsBuffSize;
        ConfigObjects::ComFpy_commsBufferManager::bins.bins[0].numBuffers = ComFpyConfig::BuffMgr::commsBuffCount;
        ConfigObjects::ComFpy_commsBufferManager::bins.bins[1].bufferSize = ComFpyConfig::BuffMgr::commsFileBuffSize;
        ConfigObjects::ComFpy_commsBufferManager::bins.bins[1].numBuffers = ComFpyConfig::BuffMgr::commsFileBuffCount;
        ComFpy::commsBufferManager.setup(
            ComFpyConfig::BuffMgr::commsBuffMgrId,
            0,
            ComFpy::Allocation::memAllocator,
            ConfigObjects::ComFpy_commsBufferManager::bins
        );
        """

        phase Fpp.ToCpp.Phases.tearDownComponents """
        ComFpy::commsBufferManager.cleanup();
        """
    }

    instance fprimeRouter: Svc.FprimeRouter base id ComFpyConfig.BASE_ID + 0x0700 \
    
    instance comStub: Svc.ComStub base id ComFpyConfig.BASE_ID + 0x0800 \

    instance tcDeframer: Svc.Ccsds.TcDeframer base id ComFpyConfig.BASE_ID + 0x0900 \

    instance spacePacketDeframer: Svc.Ccsds.SpacePacketDeframer base id ComFpyConfig.BASE_ID + 0x0A00 \

    instance tmFramer: Svc.Ccsds.TmFramer base id ComFpyConfig.BASE_ID + 0x0B00 \

    instance spacePacketFramer: Svc.Ccsds.SpacePacketFramer base id ComFpyConfig.BASE_ID + 0x0C00 \

    instance apidManager: Svc.Ccsds.ApidManager base id ComFpyConfig.BASE_ID + 0x0D00 \

    topology Subtopology {
        # Active Components
        instance comQueue
        instance cmdSeq

        # Passive Components
        instance commsBufferManager
        instance frameAccumulator
        instance fprimeRouter
        instance comStub
        instance comDriver
        instance tcDeframer
        instance spacePacketDeframer
        instance tmFramer
        instance spacePacketFramer
        instance apidManager

        connections Downlink {


            # ComQueue <-> SpacePacketFramer
            comQueue.dataOut                -> spacePacketFramer.dataIn
            spacePacketFramer.dataReturnOut -> comQueue.dataReturnIn
            # SpacePacketFramer buffer and APID management
            spacePacketFramer.bufferAllocate   -> commsBufferManager.bufferGetCallee
            spacePacketFramer.bufferDeallocate -> commsBufferManager.bufferSendIn
            spacePacketFramer.getApidSeqCount  -> apidManager.getApidSeqCountIn
            # SpacePacketFramer <-> TmFramer
            spacePacketFramer.dataOut -> tmFramer.dataIn
            tmFramer.dataReturnOut    -> spacePacketFramer.dataReturnIn
            # Framer <-> ComStub
            tmFramer.dataOut      -> comStub.dataIn
            comStub.dataReturnOut -> tmFramer.dataReturnIn
            # ComStub <-> ComDriver
            comStub.drvSendOut      -> comDriver.$send
            comDriver.sendReturnOut -> comStub.drvSendReturnIn
            comDriver.ready         -> comStub.drvConnected
            # ComStatus
            comStub.comStatusOut            -> tmFramer.comStatusIn
            tmFramer.comStatusOut           -> spacePacketFramer.comStatusIn
            spacePacketFramer.comStatusOut  -> comQueue.comStatusIn
        }

        connections Uplink {
            # ComDriver buffer allocations
            comDriver.allocate      -> commsBufferManager.bufferGetCallee
            comDriver.deallocate    -> commsBufferManager.bufferSendIn
            # ComDriver <-> ComStub
            comDriver.$recv             -> comStub.drvReceiveIn
            comStub.drvReceiveReturnOut -> comDriver.recvReturnIn
            # ComStub <-> FrameAccumulator
            comStub.dataOut                -> frameAccumulator.dataIn
            frameAccumulator.dataReturnOut -> comStub.dataReturnIn
            # FrameAccumulator buffer allocations
            frameAccumulator.bufferDeallocate -> commsBufferManager.bufferSendIn
            frameAccumulator.bufferAllocate   -> commsBufferManager.bufferGetCallee
            # FrameAccumulator <-> Deframer
            frameAccumulator.dataOut          -> tcDeframer.dataIn
            tcDeframer.dataReturnOut          -> frameAccumulator.dataReturnIn
            # TcDeframer <-> SpacePacketDeframer
            tcDeframer.dataOut                -> spacePacketDeframer.dataIn
            spacePacketDeframer.dataReturnOut -> tcDeframer.dataReturnIn
            # SpacePacketDeframer APID validation
            spacePacketDeframer.validateApidSeqCount -> apidManager.validateApidSeqCountIn
            # SpacePacketDeframer <-> Router
            spacePacketDeframer.dataOut -> fprimeRouter.dataIn
            fprimeRouter.dataReturnOut  -> spacePacketDeframer.dataReturnIn
            # Router buffer allocations
            fprimeRouter.bufferAllocate   -> commsBufferManager.bufferGetCallee
            fprimeRouter.bufferDeallocate -> commsBufferManager.bufferSendIn
         
        }

    } # end topology
} # end ComFpy Subtopology
