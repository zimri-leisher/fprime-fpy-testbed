module ComFpy {
    # Communications driver. May be swapped out with other comm drivers like UART in this file
    # to use another driver in the Comms Subtopology
    instance comDriver: Drv.TcpClient base id ComFpyConfig.BASE_ID + 0x0B00 \ 
    {
        phase Fpp.ToCpp.Phases.configComponents """
        if (state.comCcsds.hostname != nullptr && state.comCcsds.port != 0) {
            ComFpy::comDriver.configure(state.comCcsds.hostname, state.comCcsds.port);
        }
        """

        phase Fpp.ToCpp.Phases.startTasks """
        // Initialize socket client communication if and only if there is a valid specification
        if (state.comCcsds.hostname != nullptr && state.comCcsds.port != 0) {
            Os::TaskString name("ReceiveTask");
            ComFpy::comDriver.start(name, ComFpyConfig::Priorities::comDriver, ComFpyConfig::StackSizes::comDriver);
        }
        """

        phase Fpp.ToCpp.Phases.stopTasks """
        ComFpy::comDriver.stop();
        """

        phase Fpp.ToCpp.Phases.freeThreads """
        (void)ComFpy::comDriver.join();
        """
    }
}
