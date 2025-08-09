telemetry packets FpyDemoPackets {

  packet CDH id 1 group 1 {
    CdhCore.cmdDisp.CommandsDispatched

    FileHandling.fileUplink.FilesReceived
    FileHandling.fileUplink.PacketsReceived
    FileHandling.fileDownlink.FilesSent
    FileHandling.fileDownlink.PacketsSent
    FileHandling.fileManager.CommandsExecuted

  FpyDemo.cmdSeq.State
  FpyDemo.cmdSeq.SequencesSucceeded
  FpyDemo.cmdSeq.SequencesFailed
  FpyDemo.cmdSeq.SequencesCancelled
  FpyDemo.cmdSeq.StatementsDispatched
  FpyDemo.cmdSeq.StatementsFailed
  FpyDemo.cmdSeq.LastDirectiveError
  FpyDemo.cmdSeq.SeqPath
  FpyDemo.cmdSeq.DebugBreakpointIdx
  FpyDemo.cmdSeq.Debug
  FpyDemo.cmdSeq.PRM_STATEMENT_TIMEOUT_SECS


    ComCcsds.comQueue.comQueueDepth
    ComCcsds.comQueue.buffQueueDepth
    ComCcsds.commsBufferManager.TotalBuffs
    ComCcsds.commsBufferManager.CurrBuffs
    ComCcsds.commsBufferManager.HiBuffs
    #ComCcsds.tlmSend.SendLevel

    FpyDemo.rateGroup1Comp.RgMaxTime
    FpyDemo.rateGroup2Comp.RgMaxTime
    FpyDemo.rateGroup3Comp.RgMaxTime
  }

  packet CDHErrors id 2 group 1 {
    CdhCore.$health.PingLateWarnings

    FileHandling.fileUplink.Warnings
    FileHandling.fileDownlink.Warnings
    FileHandling.fileManager.Errors

    ComCcsds.commsBufferManager.NoBuffs
    ComCcsds.commsBufferManager.EmptyBuffs

    FpyDemo.rateGroup1Comp.RgCycleSlips
    FpyDemo.rateGroup2Comp.RgCycleSlips
    FpyDemo.rateGroup3Comp.RgCycleSlips
  }

  packet DriveTlm id 3 group 1 {
    FpyDemo.pingRcvr.PR_NumPings
    FpyDemo.sendBuffComp.PacketsSent
    FpyDemo.sendBuffComp.NumErrorsInjected
    FpyDemo.sendBuffComp.Parameter3
    FpyDemo.sendBuffComp.Parameter4
    FpyDemo.sendBuffComp.SendState
    FpyDemo.recvBuffComp.PktState
    FpyDemo.recvBuffComp.Sensor1
    FpyDemo.recvBuffComp.Sensor2
    FpyDemo.recvBuffComp.Parameter1
    FpyDemo.recvBuffComp.Parameter2
    FpyDemo.blockDrv.BD_Cycles
  }

  packet SigGenSum id 4 group 1 {
    FpyDemo.SG1.Output
    FpyDemo.SG1.Type
    FpyDemo.SG2.Output
    FpyDemo.SG2.Type
    FpyDemo.SG3.Output
    FpyDemo.SG3.Type
    FpyDemo.SG4.Output
    FpyDemo.SG4.Type
    FpyDemo.SG5.Output
    FpyDemo.SG5.Type
  }

  packet SystemRes1 id 5 group 2 {
    FpyDemo.systemResources.MEMORY_TOTAL
    FpyDemo.systemResources.MEMORY_USED
    FpyDemo.systemResources.NON_VOLATILE_TOTAL
    FpyDemo.systemResources.NON_VOLATILE_FREE
  }

  packet SystemRes3 id 6 group 2 {
    FpyDemo.systemResources.CPU
    FpyDemo.systemResources.CPU_00
    FpyDemo.systemResources.CPU_01
    FpyDemo.systemResources.CPU_02
    FpyDemo.systemResources.CPU_03
    FpyDemo.systemResources.CPU_04
    FpyDemo.systemResources.CPU_05
    FpyDemo.systemResources.CPU_06
    FpyDemo.systemResources.CPU_07
    FpyDemo.systemResources.CPU_08
    FpyDemo.systemResources.CPU_09
    FpyDemo.systemResources.CPU_10
    FpyDemo.systemResources.CPU_11
    FpyDemo.systemResources.CPU_12
    FpyDemo.systemResources.CPU_13
    FpyDemo.systemResources.CPU_14
    FpyDemo.systemResources.CPU_15
  }

  packet SigGen1Info id 10 group 2 {
    FpyDemo.SG1.Info
  }

  packet SigGen2Info id 11 group 2 {
    FpyDemo.SG2.Info
  }

  packet SigGen3Info id 12 group 2 {
    FpyDemo.SG3.Info
  }

  packet SigGen4Info id 13 group 2 {
    FpyDemo.SG4.Info
  }

  packet SigGen5Info id 14 group 2 {
    FpyDemo.SG5.Info
  }

  packet SigGen1 id 15 group 3 {
    FpyDemo.SG1.PairOutput
    FpyDemo.SG1.History
    FpyDemo.SG1.PairHistory
    FpyDemo.SG1.DpBytes
    FpyDemo.SG1.DpRecords
  }

  packet SigGen2 id 16 group 3 {
    FpyDemo.SG2.PairOutput
    FpyDemo.SG2.History
    FpyDemo.SG2.PairHistory
    FpyDemo.SG2.DpBytes
    FpyDemo.SG2.DpRecords
  }

  packet SigGen3 id 17 group 3 {
    FpyDemo.SG3.PairOutput
    FpyDemo.SG3.History
    FpyDemo.SG3.PairHistory
    FpyDemo.SG3.DpBytes
    FpyDemo.SG3.DpRecords
  }

  packet SigGen4 id 18 group 3 {
    FpyDemo.SG4.PairOutput
    FpyDemo.SG4.History
    FpyDemo.SG4.PairHistory
    FpyDemo.SG4.DpBytes
    FpyDemo.SG4.DpRecords
  }

  packet SigGen5 id 19 group 3 {
    FpyDemo.SG5.PairOutput
    FpyDemo.SG5.History
    FpyDemo.SG5.PairHistory
    FpyDemo.SG5.DpBytes
    FpyDemo.SG5.DpRecords
  }

  packet TypeDemo id 20 group 3 {
    FpyDemo.typeDemo.ChoiceCh
    FpyDemo.typeDemo.ChoicesCh
    FpyDemo.typeDemo.ExtraChoicesCh
    FpyDemo.typeDemo.ChoicePairCh
    FpyDemo.typeDemo.ChoiceSlurryCh
    FpyDemo.typeDemo.Float1Ch
    FpyDemo.typeDemo.Float2Ch
    FpyDemo.typeDemo.Float3Ch
    FpyDemo.typeDemo.FloatSet
    FpyDemo.typeDemo.ScalarStructCh
    FpyDemo.typeDemo.ScalarU8Ch
    FpyDemo.typeDemo.ScalarU16Ch
    FpyDemo.typeDemo.ScalarU32Ch
    FpyDemo.typeDemo.ScalarU64Ch
    FpyDemo.typeDemo.ScalarI8Ch
    FpyDemo.typeDemo.ScalarI16Ch
    FpyDemo.typeDemo.ScalarI32Ch
    FpyDemo.typeDemo.ScalarI64Ch
    FpyDemo.typeDemo.ScalarF32Ch
    FpyDemo.typeDemo.ScalarF64Ch
  }

  packet DataProducts id 21 group 3 {
    DataProducts.dpCat.CatalogDps
    DataProducts.dpCat.DpsSent

    DataProducts.dpMgr.NumSuccessfulAllocations
    DataProducts.dpMgr.NumFailedAllocations
    DataProducts.dpMgr.NumDataProducts
    DataProducts.dpMgr.NumBytes

    DataProducts.dpWriter.NumBuffersReceived
    DataProducts.dpWriter.NumBytesWritten
    DataProducts.dpWriter.NumSuccessfulWrites
    DataProducts.dpWriter.NumFailedWrites
    DataProducts.dpWriter.NumErrors

    DataProducts.dpBufferManager.TotalBuffs
    DataProducts.dpBufferManager.CurrBuffs
    DataProducts.dpBufferManager.HiBuffs
    DataProducts.dpBufferManager.NoBuffs
    DataProducts.dpBufferManager.EmptyBuffs
  }

  packet Version1 id 22 group 2 {
    CdhCore.version.FrameworkVersion
    CdhCore.version.ProjectVersion
  }

  packet Version_Library1 id 23 group 2 {
    CdhCore.version.LibraryVersion01
    CdhCore.version.LibraryVersion02
  }

  packet Version_Library2 id 24 group 2 {
    CdhCore.version.LibraryVersion03
    CdhCore.version.LibraryVersion04
  }

  packet Version_Library3 id 25 group 2 {
    CdhCore.version.LibraryVersion05
    CdhCore.version.LibraryVersion06
  }

  packet Version_Library4 id 26 group 2 {
    CdhCore.version.LibraryVersion07
    CdhCore.version.LibraryVersion08
  }

  packet Version_Library5 id 27 group 2 {
    CdhCore.version.LibraryVersion09
    CdhCore.version.LibraryVersion10
  }

  packet Version_Custom1 id 28 group 2 {
    CdhCore.version.CustomVersion01
  }

  packet Version_Custom2 id 29 group 2 {
    CdhCore.version.CustomVersion02
  }

  packet Version_Custom3 id 30 group 2 {
    CdhCore.version.CustomVersion03
  }

  packet Version_Custom4 id 31 group 2 {
    CdhCore.version.CustomVersion04
  }

  packet Version_Custom5 id 32 group 2 {
    CdhCore.version.CustomVersion05
  }

  packet Version_Custom6 id 33 group 2 {
    CdhCore.version.CustomVersion06
  }

  packet Version_Custom7 id 34 group 2 {
    CdhCore.version.CustomVersion07
  }

  packet Version_Custom8 id 35 group 2 {
    CdhCore.version.CustomVersion08
  }

  packet Version_Custom9 id 36 group 2 {
    CdhCore.version.CustomVersion09
  }

  packet Version_Custom10 id 37 group 2 {
    CdhCore.version.CustomVersion10
  }

} omit {
  CdhCore.cmdDisp.CommandErrors
}
