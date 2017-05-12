#
# Module manifest for module 'PSGet_AzureRM'
#
# Generated by: Microsoft Corporation
#
# Generated on: 5/5/2017
#

@{

# Script module or binary module file associated with this manifest.
RootModule = '.\AzureRM.psm1'

# Version number of this module.
ModuleVersion = '4.0.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = 'b433e830-b479-4f7f-9c80-9cc6c28e1b51'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Azure Resource Manager Module'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.5.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
CLRVersion = '4.0'

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'AzureRM.Profile'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'Azure.Storage'; RequiredVersion = '3.0.1'; }, 
               @{ModuleName = 'AzureRM.AnalysisServices'; RequiredVersion = '0.3.0'; }, 
               @{ModuleName = 'Azure.AnalysisServices'; RequiredVersion = '0.3.0'; }, 
               @{ModuleName = 'AzureRM.ApiManagement'; RequiredVersion = '4.0.0'; }, 
               @{ModuleName = 'AzureRM.Automation'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Backup'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Batch'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Billing'; RequiredVersion = '0.12.0'; }, 
               @{ModuleName = 'AzureRM.Cdn'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.CognitiveServices'; RequiredVersion = '0.7.0'; }, 
               @{ModuleName = 'AzureRM.Compute'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Consumption'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'AzureRM.ContainerRegistry'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'AzureRM.DataFactories'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.DataLakeAnalytics'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.DataLakeStore'; RequiredVersion = '4.0.0'; }, 
               @{ModuleName = 'AzureRM.DevTestLabs'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Dns'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.EventHub'; RequiredVersion = '0.3.0'; }, 
               @{ModuleName = 'AzureRM.HDInsight'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Insights'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.IoTHub'; RequiredVersion = '2.0.0'; }, 
               @{ModuleName = 'AzureRM.KeyVault'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.LogicApp'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.MachineLearning'; RequiredVersion = '0.14.0'; }, 
               @{ModuleName = 'AzureRM.Media'; RequiredVersion = '0.6.0'; }, 
               @{ModuleName = 'AzureRM.Network'; RequiredVersion = '4.0.0'; }, 
               @{ModuleName = 'AzureRM.NotificationHubs'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.OperationalInsights'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.PowerBIEmbedded'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.RecoveryServices'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.RecoveryServices.Backup'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.RedisCache'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Relay'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'AzureRM.Resources'; RequiredVersion = '4.0.0'; }, 
               @{ModuleName = 'AzureRM.Scheduler'; RequiredVersion = '0.14.0'; }, 
               @{ModuleName = 'AzureRM.ServerManagement'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.ServiceBus'; RequiredVersion = '0.3.0'; }, 
               @{ModuleName = 'AzureRM.ServiceFabric'; RequiredVersion = '0.1.0'; }, 
               @{ModuleName = 'AzureRM.SiteRecovery'; RequiredVersion = '4.0.0'; }, 
               @{ModuleName = 'AzureRM.Sql'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Storage'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.StreamAnalytics'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Tags'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.TrafficManager'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.UsageAggregates'; RequiredVersion = '3.0.0'; }, 
               @{ModuleName = 'AzureRM.Websites'; RequiredVersion = '3.0.0'; })

# Assemblies that must be loaded prior to importing this module
# RequiredAssemblies = @()

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
# FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
# AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        LicenseUri = 'https://raw.githubusercontent.com/Azure/azure-powershell/dev/LICENSE.txt'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/Azure/azure-powershell'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '## 2017.05.10 - Version 4.0.0
* This release contains breaking changes. Please see the migration guide (https://aka.ms/azps-migration-guide) for change details and the impact on existing scripts.
* ApiManagement
    * Added support for configuring external groups in New-AzureRmApiManagementGroup.
* Billing
    * New Cmdlet Get-AzureRmBillingPeriod
    * Update Cmdlet Get-AzureRmBillingInvoice
    	- new property BillingPeriodNames
* Compute
    * Updated Set-AzureRmVMAEMExtension and Test-AzureRmVMAEMExtension cmdlets to support Premium managed disks
    * Backup encryption settings for IaaS VMs and restore on failure
    * ChefServiceInterval option is renamed to ChefDaemonInterval now. Old one will continue to work however.
    * Remove duplicated DataDiskNames and NetworkInterfaceIDs properties from PS VM object.
      - Make DataDiskNames and NetworkInterfaceIDs parameters optional in Remove-AzureRmVMDataDisk and Remove-AzureRmVMNetworkInterface, respectively.
    * Fix the piping issue of Get cmdlets when the Get cmdlets return a list object.
    * Cmdlets that conflicted with RDFE cmdlets have been renamed. See issue https://github.com/Azure/azure-powershell/issues/2917 for more details
        - `New-AzureVMSqlServerAutoBackupConfig` has been renamed to `New-AzureRmVMSqlServerAutoBackupConfig`
        - `New-AzureVMSqlServerAutoPatchingConfig` has been renamed to `New-AzureRmVMSqlServerAutoPatchingConfig`
        - `New-AzureVMSqlServerKeyVaultCredentialConfig` has been renamed to `New-AzureRmVMSqlServerKeyVaultCredentialConfig`
* Consumption
    * New Cmdlet Get-AzureRmConsumptionUsageDetail
* ContainerRegistry
    * Add PowerShell cmdlets for Azure Container Registry
        - New-AzureRmContainerRegistry
        - Get-AzureRmContainerRegistry
        - Update-AzureRmContainerRegistry
        - Remove-AzureRmContainerRegistry
        - Get-AzureRmContainerRegistryCredential
        - Update-AzureRmContainerRegistryCredential
        - Test-AzureRmContainerRegistryNameAvailability
* DataLakeAnalytics
    * Add support for catalog package get and list
    * Add support for listing the following catalog items from deeper ancestors:
      * Table
      * TVF
      * View
      * Statistics
* DataLakeStore
    * For `Import-AzureRMDataLakeStoreItem` and `Export-AzureRMDataLakeStoreItem` trace logging has been disabled by default to improve performance. If trace logging is desired please use the `-DiagnosticLogLevel` and `-DiagnosticLogPath` parameters
    * Fixed a bug that would sometimes cause PowerShell to crash when uploading lots of small file to ADLS.
* EventHub
    * Bug fix : 
    	- Fix for Set-AzureRmEventHubNamespace cmdlet error  - ''Tier'' cannot be null, where it should be ''SkuName'' 
        - Set-AzureRmEventHub - Fix ''Object reference not set to an instance of an object'' error while updating EventHub  
* Insights
    * Add-AzureRm*AlertRule
        - Returns a single object: newResource, statusCode, requestId
    * Get-AzureRmAlertRule
        - The output is now enumerated instead of considered a single object. Its type did not change, it is still a list.
    * Remove-AzureRmAlertRule
        - The statusCode follows the status code returned by the request, before it was Ok always.
    * Add-AzureRmAutoscaleSetting
        - Returns now a single object (not a list as before) containing statusCode, requestId, and the newly created/updated resource.
        - The status code follows the status returned by the request, before it was always Ok.
    * New-AzureRmAutoscaleRule
        - The parameter ScaleActionType has been extended, it receives the following values now: ChangeCount, PercentChangeCount, ExactCount.
    * Remove-AzureRmAutoscaleSetting
        - The statusCode in the output follows the statusCode returned by the request. Before it was always Ok. 
    * Get-AzureRMLogProfile
        - The output is now enumerated. Before it was considered a single object. The type of the output remains a list as before.
    * Metrics API
        - The SDK now retrieves metrics from MDM.
    * Get-AzureRmMetric
        - The call has changed. This is the new syntax: Get-AzureRmMetric ResourceId [MetricNames [TimeGrain] [AggregationType] [StartTime] [EndTime]] [DetailedOutput]
* KeyVault
    * Adding backup/restore support for KeyVault secrets
        - Secrets can be backed up and restored, matching the functionality currently supported for Keys    
    * Backup cmdlets for Keys and Secrets now accept a corresponding object as an input parameter
        - The caller may chain retrieval and backup operations: Get-AzureKeyVaultKey -VaultName myVault -Name myKey | Backup-AzureKeyVaultKey        
    * Backup cmdlets now support a -Force switch to overwrite an existing file
        - Note that attempting to overwrite an existing file will no longer throw, and will instead prompt the user for a choice on how to proceed.
* LogicApp
    * New parameters for Interchange Control Number disaster recovery cmdlets:
        - Optional -AgreementType parameter ("X12", or "Edifact") to specify the relevant control numbers
* MachineLearning
    * Consume new version of Azure Machine Learning .Net SDK and add a new cmdlet
        - Add-AzureRmMlWebServiceRegionalProperty
* Network
    * Added Test-AzureRmNetworkWatcherConnectivity cmdlet
        - Returns connectivity information for a specified source VM and a destination
        - If connectivity between the source and destination cannot be established, the cmdlet returns details about the issue
* Profile
    * Added `Send-Feedback` cmdlet
    * The following aliases have been removed as they conflicted with existing cmdlet names in the Azure module:
        - `Enable-AzureDataCollection` (supported by `Enable-AzureRmDataCollection`)
        - `Disable-AzureDataCollection` (supported by `Disable-AzureRmDataCollection`)
* Relay
    * Adds cmdlets for the Azure Relay which allows users to create and manage all Azure Relay resources.
        - `New-AzureRmRelayNamespace`
        - `Get-AzureRmRelayNamespace`
        - `Set-AzureRmRelayNamespace`
        - `Remove-AzureRmRelayNamespace`
        - `New-AzureRmWcfRelay`
        - `Get-AzureRmWcfRelay`
        - `Set-AzureRmWcfRelay`
        - `Remove-AzureRmWcfRelay`
        - `New-AzureRmRelayHybridConnection`
        - `Get-AzureRmRelayHybridConnection`
        - `Set-AzureRmRelayHybridConnection`
        - `Remove-AzureRmRelayHybridConnection`
        - `Test-AzureRmRelayName`
        - `Get-AzureRmRelayOperation`
        - `New-AzureRmRelayKey`
        - `Get-AzureRmRelayKey`
        - `New-AzureRmRelayAuthorizationRule`
        - `Get-AzureRmRelayAuthorizationRule`
        - `Set-AzureRmRelayAuthorizationRule`
        - `Remove-AzureRmRelayAuthorizationRule`
* Resources
    * Support cross-resource-group deployments for New-AzureRmResourceGroupDeployment
        - Users can now use nested deployments to deploy to different resource groups.
* ServiceBus    
    * Bug Fix: ServiceBus Queue object property values were set to null, the object is used as input parameter in Set-AzureRmServiceBusQueue cmdlet to update Queue. 
      - Properties affected are LockDuration, EntityAvailabilityStatus, DuplicateDetectionHistoryTimeWindow, MaxDeliveryCount and MessageCount 
* ServiceFabric    
    * Added cmdlets for service fabric
        - Add-AzureRmServiceFabricApplicationCertificate
        - Add-AzureRmServiceFabricClientCertificate
        - Add-AzureRmServiceFabricClusterCertificate
        - Add-AzureRmServiceFabricNodes
        - Add-AzureRmServiceFabricNodeType
        - Get-AzureRmServiceFabricCluster
        - New-AzureRmServiceFabricCluster
        - Remove-AzureRmServiceFabricClientCertificate
        - Remove-AzureRmServiceFabricClusterCertificate
        - Remove-AzureRmServiceFabricNodes
        - Remove-AzureRmServiceFabricNodeType
        - Remove-AzureRmServiceFabricSettings
        - Set-AzureRmServiceFabricSettings
        - Set-AzureRmServiceFabricUpgradeType
        - Update-AzureRmServiceFabricDurability
        - Update-AzureRmServiceFabricReliability
* Sql
    * Added -SampleName parameter to New-AzureRmSqlDatabase
    * Updates to Failover Group cmdlets
    	- Remove ''Tag'' parameters
    	- Remove ''PartnerResourceGroupName'' and ''PartnerServerName'' parameters from Remove-AzureRmSqlDatabaseFailoverGroup cmdlet
    	- Add ''GracePeriodWithDataLossHours'' parameter to New- and Set- cmdlets, which shall eventually replace ''GracePeriodWithDataLossHour''
    	- Documentation has been fleshed out and updated
    	- Change formatting of returned objects and fix some bugs where fields were not always populated
    	- Add ''DatabaseNames'' and ''PartnerLocation'' properties to Failover Group object
    	- Fix bug causing Switch- cmdlet to return immediately rather than waiting for operation to complete
    	- Fix integer overflow bug when high grace period values are used
    	- Adjust grace period to a minimum of 1 hour if a lower one is provided
    * Remove "Usage_Anomaly" from the accepted values for "ExcludedDetectionType" parameter of Set-AzureRmSqlDatabaseThreatDetectionPolicy cmdlet and Set-AzureRmSqlServerThreatDetectionPolicy cmdlet. 
* Storage
    * Upgrade SRP SDK to 6.3.0
    * New/Set-AzureRmStorageAccount:Add a new parameter to support EnableHttpsTrafficOnly
    * New/Set/Get-AzureRmStorageAccount: Returned Storage Account contains a new attribute EnableHttpsTrafficOnly'

        # External dependent modules of this module
        # ExternalModuleDependencies = ''

    } # End of PSData hashtable
    
 } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

