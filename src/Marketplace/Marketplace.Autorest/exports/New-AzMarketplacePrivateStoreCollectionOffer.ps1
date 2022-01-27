
# ----------------------------------------------------------------------------------
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost if the code
# is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis
Update or add an offer to a specific collection of the private store.
.Description
Update or add an offer to a specific collection of the private store.
.Example
PS C:\>$acc = @{Accessibility = "azure_managedservices_professional"}
PS C:\> New-AzMarketplacePrivateStoreCollectionOffer -CollectionId fdb889a1-cf3e-49f0-95b8-2bb012fa01f1 -PrivateStoreId 7f5402e4-e8f4-46bd-9bd1-8d27866a606b  -OfferId aumatics.azure_managedservices -Plan $acc

Name                           SystemDataCreatedAt SystemDataCreatedBy SystemDataCreatedByType SystemDataLastModifiedAt SystemDataLastModifiedBy SystemDataLastModifiedByType
----                           ------------------- ------------------- ----------------------- ------------------------ ------------------------ ----------------------------
aumatics.azure_managedservices

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Models.Api20210601.IOffer
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

PLAN <IPlan[]>: Offer plans
  [Accessibility <Accessibility?>]: Plan accessibility
.Link
https://docs.microsoft.com/powershell/module/az.marketplace/new-azmarketplaceprivatestorecollectionoffer
#>
function New-AzMarketplacePrivateStoreCollectionOffer {
[OutputType([Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Models.Api20210601.IOffer])]
[CmdletBinding(DefaultParameterSetName='CreateExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Path')]
    [System.String]
    # The collection ID
    ${CollectionId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Path')]
    [System.String]
    # The offer ID to update or delete
    ${OfferId},

    [Parameter(Mandatory)]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Path')]
    [System.String]
    # The store ID - must use the tenant ID
    ${PrivateStoreId},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Body')]
    [System.String]
    # Identifier for purposes of race condition
    ${ETag},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Runtime.Info(PossibleTypes=([Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Models.Api20210601.IOfferPropertiesIconFileUris]))]
    [System.Collections.Hashtable]
    # Icon File Uris
    ${IconFileUri},

    [Parameter()]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Body')]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Models.Api20210601.IPlan[]]
    # Offer plans
    # To construct, see NOTES section for PLAN properties and create a hash table.
    ${Plan},

    [Parameter()]
    [AllowEmptyCollection()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Body')]
    [System.String[]]
    # Plan ids limitation for this offer
    ${SpecificPlanIdLimitation},

    [Parameter()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # Indicating whether the offer was not updated to db (true = not updated).
    # If the allow list is identical to the existed one in db, the offer would not be updated.
    ${UpdateSuppressedDueIdempotence},

    [Parameter()]
    [Alias('AzureRMContext', 'AzureCredential')]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Azure')]
    [System.Management.Automation.PSObject]
    # The credentials, account, tenant, and subscription used for communication with Azure.
    ${DefaultProfile},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Runtime')]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            CreateExpanded = 'Az.Marketplace.private\New-AzMarketplacePrivateStoreCollectionOffer_CreateExpanded';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Azure.PowerShell.Cmdlets.Marketplace.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}
