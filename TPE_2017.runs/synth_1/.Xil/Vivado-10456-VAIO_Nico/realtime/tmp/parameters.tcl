# Group: HARTPACellDelay
rt::set_parameter speedupFunneling {true}
# Group: gen
rt::set_parameter datapathCSAShareSumsNonTD {false}
rt::set_parameter reencodePrioMux {true}
# Group: hartcleanup
rt::set_parameter collapseLutsCheckCarryLoads {false}
rt::set_parameter collapseLutsTiming {true}
rt::set_parameter extendCarryChainTop {true}
rt::set_parameter extractSyncControlThreshold {3}
rt::set_parameter extractSyncSetInNetlist {true}
rt::set_parameter lutDupLimit {100}
rt::set_parameter lutFanoutThreshold {10000}
# Group: hartgdp
rt::set_parameter eqKeepXor {false}
# Group: hartiomap
rt::set_parameter enableTristateToMux {true}
# Group: hartlutmap
rt::set_parameter convertUMinusToAdderMultiFanout {true}
rt::set_parameter convertUMinusToAdderSingleFanout {true}
rt::set_parameter maxDissolveSize {5000}
rt::set_parameter useParentCountForControlSet {true}
# Group: hartndb
rt::set_parameter deriveConstraints {false}
rt::set_parameter reinferMultiInstsByName {true}
rt::set_parameter reinferPruneBitWidths {true}
# Group: hartsyn
rt::set_parameter PartId {xc7k70tfbv676-1}
rt::set_parameter clock_gating_bdd_support_threshold {100}
rt::set_parameter clock_gating_enable_div_by_2_xform {false}
rt::set_parameter clock_gating_enable_edge_detect_xform {false}
rt::set_parameter clock_gating_enable_stability_latch_removal {false}
rt::set_parameter clock_gating_retiming_strategy {2}
rt::set_parameter collapsePrioMux {true}
rt::set_parameter combineLutInstPairThreshold {50}
rt::set_parameter combineLutsLutRegisterCheck {true}
rt::set_parameter combineLutsLutRegisterCheck2 {true}
rt::set_parameter combineLutsRuntimeFix {true}
rt::set_parameter combineLutsTimingCallRuntimeFix {true}
rt::set_parameter convUMinusToAdder {true}
rt::set_parameter convertLoopToLatch {true}
rt::set_parameter datapathAddTimingThreshold {11}
rt::set_parameter datapathComparatorThreshold {6}
rt::set_parameter datapathComparatorTimingThreshold {11}
rt::set_parameter datapathEqThreshold {8}
rt::set_parameter datapathEqTimingThreshold {8}
rt::set_parameter doDspResourceManagement {true}
rt::set_parameter dspDebugLevel {1}
rt::set_parameter dspFlattenBeforeReinfer {true}
rt::set_parameter enableKeepHierarchy {true}
rt::set_parameter enableParallelHelperSpawn {true}
rt::set_parameter finalCleanupUndriven {true}
rt::set_parameter flattenHierarchyValue {4}
rt::set_parameter helper_shm_key {LaunchHelperProcessKey_10456_1495727894}
rt::set_parameter hoptPostCollapseMuxChain {2}
rt::set_parameter inferAddSub {true}
rt::set_parameter inferBinaryMux {true}
rt::set_parameter inferCounter {true}
rt::set_parameter inferDynamicSrl {true}
rt::set_parameter inferLoadableAdd {true}
rt::set_parameter inferMuxOpt {3}
rt::set_parameter inferMuxOptFromLoop {true}
rt::set_parameter inferMuxPart {true}
rt::set_parameter inferRegPart {true}
rt::set_parameter inferRom {true}
rt::set_parameter inferSignInv {true}
rt::set_parameter insertLutForOutputKeep {false}
rt::set_parameter leaveRamRegOutOfDSP {false}
rt::set_parameter lutPairFanoutThreshold {30}
rt::set_parameter lutPairSlackThreshold {0}
rt::set_parameter lutPairSlackThresholdRange {1}
rt::set_parameter lutPairSlackThresholdRange2 {5}
rt::set_parameter mapRuntimeFix {1}
rt::set_parameter maxNumCutsPerNode {300}
rt::set_parameter minRomAddrWidth {5}
rt::set_parameter optMergeLut1s {true}
rt::set_parameter partitionMuxesNew {true}
rt::set_parameter prepDsps {true}
rt::set_parameter prepRams {true}
rt::set_parameter pullFirstSrlRegister {true}
rt::set_parameter pullLastSrlRegister {true}
rt::set_parameter recodeMuxes {2}
rt::set_parameter recognizeDsps {true}
rt::set_parameter reinferMuxLevel {3}
rt::set_parameter repFanoutThreshold {10000}
rt::set_parameter requiredTimeOffset {0}
rt::set_parameter retimeLogicForRegisterInference {true}
rt::set_parameter romLutToGates {false}
rt::set_parameter spdAbc {false}
rt::set_parameter spdForTiming {false}
rt::set_parameter srlDepthThreshold {3}
rt::set_parameter supportBWWE {true}
rt::set_parameter suppressReport {true}
rt::set_parameter timingOptFlowCtrl {false}
rt::set_parameter useUniprims {true}
rt::set_parameter webTalkPath {C:/Users/nicob/Google Drive/Arquitectura de sistemas I/Vivado/TPE_2017/TPE_2017.cache/wt}
rt::set_parameter writeXmsg {true}
rt::set_parameter xilinxBoolSwitch1 {true}
rt::set_parameter xilinxDecompMultAllowAsyncReg {true}
rt::set_parameter xilinxDecompMultFix2 {true}
rt::set_parameter xilinxDecompMultFix3 {true}
rt::set_parameter xilinxDontExtractGenomeForSmallDesign {true}
rt::set_parameter xilinxEvalMuxGenGenerators {true}
rt::set_parameter xilinxNewSDPRam {true}
rt::set_parameter xilinxPrioMuxGenGenerator {true}
rt::set_parameter xilinxUseTunedCSA {true}
# Group: hdl
rt::set_parameter convertMultToShift {false}
# Group: lib
rt::set_parameter markPadAsMacro {false}
# Group: naming
rt::set_parameter allowOptWithKeepHier {true}
rt::set_parameter array_instance_naming_style {%s[%d]}
rt::set_parameter block_naming_style {%s.}
rt::set_parameter generate_naming_style {%s[%d].}
rt::set_parameter if_generate_naming_style {%s.}
rt::set_parameter setP1735DontTouch {true}
# Group: nl
rt::set_parameter dissolveMergeNamesSeparator {/}
rt::set_parameter dissolveMergeNamesToDfg {true}
rt::set_parameter numSupportedHierSepInInstName {50}
rt::set_parameter usePostFindUniquification {false}
# Group: optimize
rt::set_parameter allowHillClimb {false}
rt::set_parameter areaOptMaxDatapathArea {2000}
rt::set_parameter disableAbc {true}
rt::set_parameter useAbcAreaScript {false}
# Group: syn
rt::set_parameter ProhibitMultiCE4Block {true}
rt::set_parameter areaOptMergeXilinxInferred {true}
rt::set_parameter areaOptMergeXilinxInferred2 {true}
rt::set_parameter collapseBMerges {false}
rt::set_parameter connectConstantForGenomeUndrivenPin {false}
rt::set_parameter connectTopModUndrivenPinToObuft {true}
rt::set_parameter constPropUseFFEnableDontCare {false}
rt::set_parameter datapathAddThreshold {11}
rt::set_parameter decloneMultiDriverRegisters {false}
rt::set_parameter dontCollapseMuxChainInFsmPart {true}
rt::set_parameter downgradeMessageList {8-3332 8-3936 8-3917 8-506 8-3919 8-3295}
rt::set_parameter enableSplitFlow {true}
rt::set_parameter enableSplitFlowPath {C:/Users/nicob/Google Drive/Arquitectura de sistemas I/Vivado/TPE_2017/TPE_2017.runs/synth_1/.Xil/Vivado-10456-VAIO_Nico/}
rt::set_parameter enableSplitFlowStep {2}
rt::set_parameter enableSplitFlowXDC {true}
rt::set_parameter extractGenomes {false}
rt::set_parameter extractSyncControlInNetlist {true}
rt::set_parameter forceExtractGenerateGenomes {25000}
rt::set_parameter inequalitiesInLogicPartition {4}
rt::set_parameter inferAllRamVerilog {true}
rt::set_parameter inferAllRamVhdl {true}
rt::set_parameter inferFsm {true}
rt::set_parameter inferMemoryIfTotalBitsMoreThan {16383}
rt::set_parameter installLutInBaseMod {true}
rt::set_parameter max_loop_limit {65536}
rt::set_parameter multiDriveConstAssgnCheck {true}
rt::set_parameter muxDecompInElaborate {false}
rt::set_parameter muxMapLevel {1}
rt::set_parameter newMuxPartition {true}
rt::set_parameter oocMessageList {8-638 8-256}
rt::set_parameter prioMuxNoCarryChain {true}
rt::set_parameter propagateConstantsCleanupNetsInElaborate {false}
rt::set_parameter propagateConstantsInElaborate {false}
rt::set_parameter pushRamOps {true}
rt::set_parameter resolveMultiDriversInConstProp {false}
rt::set_parameter retainUnconnectedPinsForPrimBBox {true}
rt::set_parameter spdSimpleGate {false}
rt::set_parameter transformUminus {3}
rt::set_parameter v8SupportBramCascade {true}
rt::set_parameter xilinxConnectUndrivenRegWithInit {true}
rt::set_parameter xilinxHierName {true}
rt::set_parameter xilinxSyncRSFix {true}
# Group: timer
rt::set_parameter dontFunnel {true}
# Group: write
rt::set_parameter writeBlackboxInterface {true}
# Unregistered parameters
set rt::flattenHierarchy {4}
set rt::quickRtlOpt {false}
set rt::useAbc {1}
set rt::nl_opt_flow {2}
set rt::postMapTimingOpt {0}
set rt::inParallelWrap {true}
set rt::runtime_optimized {0}
set rt::combineLutsInTechmap {0}
