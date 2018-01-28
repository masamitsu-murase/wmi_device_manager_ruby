
require("set")

module WmiDeviceManager
# strings -u -nobanner -n 8 cimwin32.dll | grep ^DEVPKEY
 
Aep = Set[
  "AepId",
  "AssociationRetryCount",
  "Category",
  "ContainerId",
  "DeviceAddress",
  "DiscoveryMethod",
  "FriendlyName",
  "GeneratedFriendlyName",
  "InstanceIds",
  "InterfaceClasses",
  "IsAssociatable",
  "IsAssociatableByUserAction",
  "IsAssociated",
  "IsAuthenticated",
  "IsConnected",
  "IsEncrypted",
  "IsRoamable",
  "Manufacturer",
  "ModelId",
  "ModelName",
  "Present",
  "ProtocolId",
  "ProviderAepId",
  "ProviderInstanceIds",
  "ProviderName",
  "RefreshDevicePresenceState",
  "SignalStrength"
]

AepContainer = Set[
  "Categories",
  "Children",
  "ContainerId",
  "DialInstalledApplications",
  "FriendlyName",
  "IsAssociatable",
  "IsAssociatableByUserAction",
  "IsAssociated",
  "Manufacturer",
  "ModelIds",
  "ModelName",
  "Present",
  "ProtocolIds",
  "SupportedUriSchemes",
  "SupportsAudio",
  "SupportsCapturing",
  "SupportsImages",
  "SupportsInformation",
  "SupportsLimitedDiscovery",
  "SupportsNetworking",
  "SupportsObjectTransfer",
  "SupportsPositioning",
  "SupportsRendering",
  "SupportsTelephony",
  "SupportsVideo"
]

AepService = Set[
  "AepId",
  "Category",
  "ContainerId",
  "FriendlyName",
  "ParentAepIsAssociated",
  "ProtocolId",
  "ProviderName",
  "ProviderServiceId",
  "ServiceClassFriendlyName",
  "ServiceClassId",
  "ServiceId"
]

Bluetooth = Set[
  "AepQuery_IssueInquiry",
  "AepQuery_LE_ActiveScanning",
  "AepQuery_LE_ScanInterval",
  "AepQuery_LE_ScanWindow",
  "AepQuery_LE_UseFilteredDiscovery",
  "AepService_PublisherPackageName",
  "AepService_PublisherUserSecurityId",
  "AepService_ServiceGUID",
  "AepServiceQuery_CacheMode",
  "AepServiceQuery_TargetDevice",
  "Association_Ext_Param_InboundBlob",
  "ClassOfDevice",
  "ClassOfDevice_Deprecated|DEVPKEY_Bluetooth_DeviceManufacturer",
  "ClassOfDevice_Major",
  "ClassOfDevice_Minor",
  "ClassOfDevice_Service_Audio",
  "ClassOfDevice_Service_Capturing",
  "ClassOfDevice_Service_Information",
  "ClassOfDevice_Service_LimitedDiscovery",
  "ClassOfDevice_Service_Networking",
  "ClassOfDevice_Service_ObjectXfer",
  "ClassOfDevice_Service_Positioning",
  "ClassOfDevice_Service_Rendering",
  "ClassOfDevice_Service_Telephony",
  "DeviceAddress",
  "DeviceFlags",
  "DevicePID",
  "DeviceProductVersion",
  "DeviceVID",
  "DeviceVIDSource",
  "GattService_AttributeHandle",
  "IsDiscoverable",
  "L2capService_InstanceId",
  "LastConnectedTime",
  "LastConnectedTime_Deprecated|DEVPKEY_Bluetooth_DeviceModelNumber",
  "LastRawSignalStrengthInDBm",
  "RadioAddress",
  "RadioHciRevision",
  "RadioHciVendorFeatures",
  "RadioHciVersion",
  "RadioIsCentralRoleSupported",
  "RadioIsPeripheralRoleSupported",
  "RadioLmpSubVersion",
  "RadioLmpSupportedFeatures",
  "RadioLmpVersion",
  "RadioManufacturer",
  "RfcommService_InstanceId",
  "ServiceGUID"
]

BluetoothLE = Set[
  "AddressType",
  "Advertisement",
  "Appearance",
  "AppearanceCategory",
  "AppearanceSubcategory",
  "Connectable",
  "PrepairingDeviceId",
  "ScanResponse"
]

Bthhfenum = Set[
  "SupportsRemoteVolume"
]

DasParam = Set[
  "AepStoreOnly",
  "DiscoverOnPublicNetwork",
  "PassiveScanning",
  "QueryFromAppContainerWinRT",
  "StartedFromBackgroundTask",
  "X"
]

Device = Set[
  "AdditionalSoftwareRequested",
  "Address",
  "AvailableTime",
  "BaseContainerId",
  "BiosDeviceName",
  "Bitrates",
  "BusNumber",
  "BusRelations",
  "BusReportedDeviceDesc",
  "BusTypeGuid",
  "CanPlayProtectedAudio",
  "Capabilities",
  "Characteristics",
  "Children",
  "Class",
  "ClassGuid",
  "CompatibleIds",
  "ConfigFlags",
  "ConfigurationId",
  "ConnectionStateIsAuthoritative",
  "ContainerId",
  "DebuggerSafe",
  "DependencyBootSession",
  "DependencyDependents",
  "DependencyProviders",
  "DeviceCompatFlags",
  "DeviceDesc",
  "DevNodeStatus",
  "DevType",
  "DHP_Rebalance_Policy",
  "DLNACAP",
  "DLNADOC",
  "Driver",
  "DriverCoInstallers",
  "DriverDate",
  "DriverDesc",
  "DriverExtendedInfs",
  "DriverIncludedConfigs",
  "DriverIncludedInfs",
  "DriverInfPath",
  "DriverInfSection",
  "DriverInfSectionExt",
  "DriverLogoLevel",
  "DriverNodeStrongName",
  "DriverProblemDesc",
  "DriverPropPageProvider",
  "DriverProvider",
  "DriverRank",
  "DriverVersion",
  "EjectionRelations",
  "EnumeratorName",
  "Exclusive",
  "ExtendedAddress",
  "ExtendedConfigurationIds",
  "ExtraSinkProtocolInfo",
  "FirmwareDate",
  "FirmwareDependencies",
  "FirmwareRevision",
  "FirmwareVersion",
  "FirstInstallDate",
  "FriendlyName",
  "FriendlyNameAttributes",
  "GenericDriverInstalled",
  "HardwareConfigurationIndex",
  "HardwareIds",
  "HasProblem",
  "IconFileNames",
  "IconUrls",
  "InLocalMachineContainer",
  "InstallDate",
  "InstallError",
  "InstallFlags",
  "InstallInf",
  "InstallState",
  "InstallStrongName",
  "InstanceId",
  "IsAssociateableByUserAction",
  "IsConnected",
  "IsLegacyDMR",
  "IsPresent",
  "IsRebootRequired",
  "LastArrivalDate",
  "LastKnownParent",
  "LastRemovalDate",
  "Legacy",
  "LegacyBusType",
  "LocationInfo",
  "LocationPaths",
  "LowerFilters",
  "Manufacturer",
  "ManufacturerAttributes",
  "MatchingDeviceId",
  "MatchingTargetComputerId",
  "MaxVolume",
  "MigrationRank",
  "Model",
  "ModelId",
  "NetworkId",
  "NoConnectSound",
  "Numa_Node",
  "Numa_Proximity_Domain",
  "OverrideContainerId",
  "Owners",
  "PacketWakeFailedTime",
  "PacketWakeSupported",
  "Parent",
  "PDOName",
  "PendingConfigurationIds",
  "PendingSoftwareInstall",
  "PersistSystemGeneralize",
  "PhysicalDeviceLocation",
  "PostInstallInProgress",
  "PowerData",
  "PowerRelations",
  "PresenceNotForDevice",
  "ProblemCode",
  "ProblemStatus",
  "ProblemStatusOverride",
  "RemoteUrls",
  "RemovalPolicy",
  "RemovalPolicyDefault",
  "RemovalPolicyOverride",
  "RemovalRelations",
  "Reported",
  "ReportedDeviceIdsHash",
  "RequestConfigurationIds",
  "ResourcePickerExceptions",
  "ResourcePickerTags",
  "RestrictedSD",
  "RollbackDriverNode",
  "SafeRemovalRequired",
  "SafeRemovalRequiredOverride",
  "Security",
  "SecuritySDS",
  "SendPacketWakeSupported",
  "Service",
  "SessionId",
  "ShowInUninstallUI",
  "Siblings",
  "SignalStrength",
  "SinkProtocolInfo",
  "SoftRestartSupported",
  "Stack",
  "SupportedUriSchemes",
  "SupportsAudio",
  "SupportsImages",
  "SupportsMute",
  "SupportsSearch",
  "SupportsSetNextAVT",
  "SupportsVideo",
  "Text_Description",
  "TransportRelations",
  "UDN",
  "UINumber",
  "UINumberDescFormat",
  "UpperFilters",
  "UserSelectedDriverInstalled"
]

DeviceClass = Set[
  "BootCritical",
  "Characteristics",
  "ClassCoInstallers",
  "ClassInstaller",
  "ClassName",
  "CompatibleFeatureScores",
  "Configurable",
  "ConfigurableClassVersion",
  "ConfigurableOverride",
  "ConfigureSchemaSettings",
  "DefaultService",
  "DevType",
  "DHPRebalanceOptOut",
  "Exclusive",
  "FSFilterClass",
  "Icon",
  "IconPath",
  "Inbox",
  "LastDeleteDate",
  "LowerFilters",
  "LowerLogoVersion",
  "Name",
  "NeedsReinstall",
  "NoDisplayClass",
  "NoInstallClass",
  "NoUseClass",
  "PolicyExempt",
  "PreConfigure",
  "PropPageProvider",
  "ReinstallApplicableDevices",
  "Security",
  "SecuritySDS",
  "SilentInstall",
  "SystemCritical",
  "TransactedInstall",
  "UpperFilters"
]

DeviceContainer = Set[
  "Address",
  "AlwaysShowDeviceAsConnected",
  "AssociationArray",
  "AutoPlay_ApplicationID",
  "AutoPlay_AppUserModelID",
  "AutoPlay_AutoplayType",
  "AutoPlay_ContainerAutoplay",
  "AutoPlay_Handler",
  "AutoPlay_PackageFamilyName",
  "AutoPlay_PackageName",
  "AutoPlay_PackagePublisher",
  "AutoPlay_RegisteredAppsEnabled",
  "AutoPlay_Verb",
  "BaselineExperienceId",
  "Category",
  "Category_Desc_Plural",
  "Category_Desc_Singular",
  "Category_Icon",
  "CategoryGroup_Desc",
  "CategoryGroup_Icon",
  "ConfigFlags",
  "CustomPrivilegedPackageFamilyNames",
  "DCA_ApplicationID",
  "DCA_AppUserModelID",
  "DCA_DeviceNotificationHandlers",
  "DCA_ItemNameDisplay",
  "DCA_PackageFamilyName",
  "DCA_PackageName",
  "DCA_PackagePublisher",
  "DCA_Tile_Background",
  "DCA_Tile_KeystoneImagePath",
  "DCA_WnfStateName",
  "DeviceDescription1",
  "DeviceDescription2",
  "DeviceFunctionSubRank",
  "DiscoveryMethod",
  "ExperienceId",
  "FriendlyName",
  "GlyphIconPath",
  "GlyphId",
  "HasProblem",
  "Icon",
  "InstallInProgress|DEVPKEY_Device_InstallInProgress",
  "IsAuthenticated",
  "IsConnected",
  "IsDefaultDevice",
  "IsDeviceUniquelyIdentifiable",
  "IsEncrypted",
  "IsLocalMachine",
  "IsMetadataSearchInProgress",
  "IsNetworkDevice",
  "IsNotInterestingForDisplay",
  "IsPaired",
  "IsRebootRequired",
  "IsSharedDevice",
  "IsShowInDisconnectedState",
  "Last_Connected",
  "Last_Seen",
  "LaunchDeviceStageFromExplorer",
  "LaunchDeviceStageOnDeviceConnect",
  "Manufacturer",
  "MetadataCabinet",
  "MetadataChecksum",
  "MetadataPath",
  "ModelName",
  "ModelNumber",
  "PrimaryCategory",
  "PrivilegedPackageFamilyNames",
  "RequiresPairingElevation",
  "RequiresUninstallElevation",
  "UnpairUninstall",
  "Version",
  "WindowsHardwareLogoCertified"
]

DeviceDisplay = Set[
  "UserLastAccessTime"
]

DeviceId = Set[
  "DriverInfMatches",
  "DriverInfNames"
]

DeviceInterface = Set[
  "AutoPlay_CustomEventGuid",
  "Autoplay_Silent",
  "ClassGuid",
  "ClassGuidForPolicy",
  "Enabled",
  "FriendlyName",
  "HID_BackgroundAccess",
  "HID_IsReadOnly",
  "HID_ProductId",
  "HID_UsageId",
  "HID_UsagePage",
  "HID_VendorId",
  "HID_VersionNumber",
  "ReferenceString",
  "Restricted",
  "Serial_PortName",
  "Serial_UsbProductId",
  "Serial_UsbVendorId",
  "UnrestrictedAppCapabilities"
]

DeviceInterfaceClass = Set[
  "DefaultInterface",
  "Inbox",
  "Name",
  "UnrestrictedAppCapabilities"
]

DeviceItem = Set[
  "SetupProgress",
  "State",
  "Status"
]

DeviceItemParam = Set[
  "AsyncItemInitDelaysEnumComplete"
]

DeviceSetup = Set[
  "AutoplayReady",
  "AutoplayState",
  "ConnectivityNeeded",
  "CostedNetworkPolicyExempt",
  "DCA_State",
  "DeviceState",
  "DriverState",
  "FirstInstallDate",
  "HardErrorCount",
  "InstallDate",
  "InstallInProgress",
  "MetadataPackageId",
  "PairedAutomatically",
  "UserRefreshDate",
  "UXReady"
]

DevQuery = Set[
  "ObjectType"
]

DriverDatabase = Set[
  "AccessMask",
  "ConfigMode",
  "ConfigOptions",
  "Disabled",
  "FilePath",
  "Loaded",
  "LoadStatus",
  "NodeName",
  "OemDriverInfFileMap",
  "ProcessorArchitecture",
  "RegistryPath",
  "Selected",
  "UnloadTimeout",
  "Updated",
  "Version"
]

DriverFile = Set[
  "DriverInfName",
  "Owners",
  "ProtectionClass",
  "SubDirectory"
]

DriverInfFile = Set[
  "ActiveConfigurations",
  "ActiveDriverPackage",
  "DriverPackages",
  "Locked"
]

DriverPackage = Set[
  "BootCritical",
  "ClassGuid",
  "ClassVersion",
  "Configurable",
  "ConfigurableFlags",
  "ConfigurableOverride",
  "Configurations",
  "ConfigurationScopes",
  "DriverDate",
  "DriverFlightIds",
  "DriverInfName",
  "DriverSetIds",
  "DriverUpdateIds",
  "DriverVersion",
  "ExtensionId",
  "F6",
  "FirmwareDependencies",
  "FirmwareDependencyBootSession",
  "ImportDate",
  "Inbox",
  "Locale",
  "LockLevel",
  "NeedsReconfig",
  "OriginalInfName",
  "PendingDriverUpdate",
  "ProcessorArchitecture",
  "ProductName",
  "ProviderName",
  "Published",
  "RelatedDriverPackages",
  "SignerName",
  "SignerScore",
  "SourceMediaPath",
  "StatusFlags",
  "SystemCritical",
  "TargetComputerIds"
]

DriverRegKey = Set[
  "KeyOnly",
  "Owners"
]

DriverService = Set[
  "BootFlags",
  "Description",
  "DisplayName",
  "ErrorControl",
  "Group",
  "GroupDependencies",
  "ImagePath",
  "ObjectName",
  "Owners",
  "ServiceDependencies",
  "StartType",
  "Tag",
  "Type"
]

DrvPkg = Set[
  "BrandingIcon",
  "DetailedDescription",
  "DocumentationLink",
  "Icon",
  "Model",
  "VendorWebSite"
]

FirmwareResource = Set[
  "Id",
  "LastAttemptDate",
  "LastAttemptStatus",
  "LastAttemptVersion",
  "LowestSupportedVersion",
  "PendingVersion",
  "Type",
  "Version"
]

HdAudBus = Set[
  "DisableNonSnoop",
  "ForcedCacheType"
]

Imaging = Set[
  "Port"
]

InfraCast = Set[
  "ChallengeAep",
  "DevnodeAep"
]

IoT = Set[
  "AllJoynSoftwareVersion",
  "AppId",
  "AppName",
  "AppSoftwareVersion",
  "BusName",
  "CustomCategory",
  "DefaultLang",
  "HardwareVersion",
  "ServiceInterfaces",
  "SessionPort"
]

IPP = Set[
  "LocationListQuery",
  "LocationListResponse",
  "PrinterKeywordFilter",
  "PrinterLimit",
  "PrinterLocationFilter",
  "PrinterOffset",
  "PrinterOrgLocation",
  "PrinterQueryUnfiltered",
  "PrinterSortBy",
  "PrinterTotalCount"
]

KsAudio = Set[
  "PacketSize_Constraints",
  "PacketSize_Constraints2"
]

Mbae = Set[
  "NetworkAccountId",
  "NetworkInterfaceId"
]

MTPBTH = Set[
  "IsConnected_Private"
]

NFP = Set[
  "Capabilities"
]

PciDevice = Set[
  "AcsCapabilityRegister",
  "AcsCompatibleUpHierarchy",
  "AcsSupport",
  "AERCapabilityPresent",
  "AriSupport",
  "AtomicsSupported",
  "AtsSupport",
  "BarTypes",
  "BaseClass",
  "Correctable_Error_Mask",
  "CurrentLinkSpeed",
  "CurrentLinkWidth",
  "CurrentPayloadSize",
  "CurrentSpeedAndMode",
  "DeviceType",
  "ECRC_Errors",
  "Error_Reporting",
  "ExpressSpecVersion",
  "FirmwareErrorHandling",
  "InterruptMessageMaximum",
  "InterruptSupport",
  "Label_Id",
  "Label_String",
  "MaxLinkSpeed",
  "MaxLinkWidth",
  "MaxPayloadSize",
  "MaxReadRequestSize",
  "ProgIf",
  "RequiresReservedMemoryRegion",
  "RootError_Reporting",
  "S0WakeupSupported",
  "SriovSupport",
  "SubClass",
  "Uncorrectable_Error_Mask",
  "Uncorrectable_Error_Severity"
]

PciRootBus = Set[
  "ASPMSupport",
  "ClockPowerManagementSupport",
  "CurrentSpeedAndMode",
  "DeviceIDMessagingCapable",
  "ExtendedConfigAvailable",
  "ExtendedPCIConfigOpRegionSupport",
  "MSISupport",
  "NativePciExpressControl",
  "PCIExpressAERControl",
  "PCIExpressCapabilityControl",
  "PCIExpressNativeHotPlugControl",
  "PCIExpressNativePMEControl",
  "PCISegmentGroupsSupport",
  "SecondaryBusWidth",
  "SecondaryInterface",
  "SHPCNativeHotPlugControl",
  "SupportedSpeedsAndModes",
  "SystemMsiSupport"
]

Pos = Set[
  "ConnectionTypes",
  "DeviceConnectionString",
  "IsCustomPairing",
  "PosDeviceTypes",
  "ProtocolProviderDllName",
  "ProviderId",
  "SetPairingState"
]

PUBSVCS = Set[
  "METADATA"
]

Smartcard = Set[
  "DeviceReady",
  "FileSystem",
  "Friendly",
  "MachineId",
  "Transport",
  "VCard"
]

SSDP = Set[
  "AltLocationInfo",
  "DevLifeTime",
  "NetworkLocationInfo"
]

Storage = Set[
  "Portable",
  "Removable_Media",
  "System_Critical"
]

TSUSB = Set[
  "BUS_ENUMERATOR_TAG"
]

UPNP = Set[
  "AepServiceList",
  "FoundOnPublicNetwork",
  "IsDialDevice",
  "IsNetworkInterfacePublic",
  "WiFiDirectMacAddress"
]

User = Set[
  "Provided_Name"
]

WIA = Set[
  "DeviceType"
]

WiFi = Set[
  "InterfaceGuid"
]

WiFiDirect = Set[
  "AutoConnect",
  "DeviceAddress",
  "DeviceAddressCopy",
  "FoundWsbService",
  "GroupId",
  "InformationElements",
  "InfraCastAccessPointBssid",
  "InfraCastSinkHostName",
  "InterfaceAddress",
  "InterfaceGuid",
  "IsConnected",
  "IsDMGCapable",
  "IsInfraCastStreamSecuritySupported",
  "IsInfraCastSupported",
  "IsLegacyDevice",
  "IsMiracastLCPSupported",
  "IsRecentlyAssociated",
  "IsVisible",
  "MiracastVersion",
  "NoMiracastAutoProject",
  "ProfileString",
  "Service_Aeps",
  "Services",
  "SupportedChannelList"
]

WiFiDirectParam = Set[
  "DisableMiracastAutoProject",
  "DiscoverWSBDocks",
  "EnableAggressiveDiscovery",
  "EnableMultipleInterfaceDiscovery",
  "ServiceIdPrefix",
  "ServiceInfoDiscovery"
]

WiFiDirectServices = Set[
  "AdvertisementId",
  "RequestServiceInformation",
  "ServiceAddress",
  "ServiceConfigMethods",
  "ServiceInformation",
  "ServiceName"
]

Winusb = Set[
  "Device_Class",
  "Device_Custom_Interface_GUIDs",
  "Device_PID",
  "Device_Protocol",
  "Device_SubClass",
  "Device_VID"
]

WpdFs = Set[
  "VolumePath"
]

WSD = Set[
  "AepServiceList",
  "AppSeqInstanceID",
  "Challenge_Query",
  "Convert_To_Multicast",
  "FoundOnPublicNetwork",
  "IPConnectionString",
  "MetadataUpdated",
  "Supports_DNS",
  "WiFiDirectMacAddress"
]

DEVPKEY_LIST = [
  "Device",
  "DeviceContainer",
  "FirmwareResource",
  "PciDevice",
  "PciRootBus",

  "Aep",
  "AepContainer",
  "AepService",
  "Bluetooth",
  "BluetoothLE",
  "Bthhfenum",
  "DasParam",
  # ("Device", Device),
  "DeviceClass",
  # ("DeviceContainer", DeviceContainer),
  "DeviceDisplay",
  "DeviceId",
  "DeviceInterface",
  "DeviceInterfaceClass",
  "DeviceItem",
  "DeviceItemParam",
  "DeviceSetup",
  "DevQuery",
  "DriverDatabase",
  "DriverFile",
  "DriverInfFile",
  "DriverPackage",
  "DriverRegKey",
  "DriverService",
  "DrvPkg",
  # ("FirmwareResource", FirmwareResource),
  "HdAudBus",
  "Imaging",
  "InfraCast",
  "IoT",
  "IPP",
  "KsAudio",
  "Mbae",
  "MTPBTH",
  "NFP",
  # ("PciDevice", PciDevice),
  # ("PciRootBus", PciRootBus),
  "Pos",
  "PUBSVCS",
  "Smartcard",
  "SSDP",
  "Storage",
  "TSUSB",
  "UPNP",
  "User",
  "WIA",
  "WiFi",
  "WiFiDirect",
  "WiFiDirectParam",
  "WiFiDirectServices",
  "Winusb",
  "WpdFs",
  "WSD"
]
end
