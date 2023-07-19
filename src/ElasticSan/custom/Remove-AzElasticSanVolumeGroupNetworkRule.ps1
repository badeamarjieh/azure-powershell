
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
Remove a list of virtual network rules from a VolumeGroup
.Description
Remove a list of virtual network rules from a VolumeGroup
.Example
{{ Add code here }}
.Example
{{ Add code here }}

.Outputs
Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Models.Api20211120Preview.VirtualNetworkRule[]
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

NETWORKACLSVIRTUALNETWORKRULE <IVirtualNetworkRule[]>: The list of virtual network rules.
  VirtualNetworkResourceId <String>: Resource ID of a subnet, for example: /subscriptions/{subscriptionId}/resourceGroups/{groupName}/providers/Microsoft.Network/virtualNetworks/{vnetName}/subnets/{subnetName}.
  [Action <Action?>]: The action of virtual network rule.
#>
function Remove-AzElasticSanVolumeGroupNetworkRule {
    [OutputType([Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Models.Api20221201Preview.VirtualNetworkRule[]])]
    [CmdletBinding(DefaultParameterSetName='NetworkRuleObject', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
    param(
        [Parameter(ParameterSetName='NetworkRuleObject', Mandatory)]
        [Parameter(ParameterSetName='NetworkRuleResourceId', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Path')]
        [System.String]
        # The name of the ElasticSan.
        ${ElasticSanName},
    
        [Parameter(ParameterSetName='NetworkRuleObject', Mandatory)]
        [Parameter(ParameterSetName='NetworkRuleResourceId', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Path')]
        [System.String]
        # The name of the VolumeGroup.
        ${VolumeGroupName},
    
        [Parameter(ParameterSetName='NetworkRuleObject', Mandatory)]
        [Parameter(ParameterSetName='NetworkRuleResourceId', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Path')]
        [System.String]
        # The name of the resource group.
        # The name is case insensitive.
        ${ResourceGroupName},
    
        [Parameter(ParameterSetName='NetworkRuleObject')]
        [Parameter(ParameterSetName='NetworkRuleResourceId')]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Path')]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Runtime.DefaultInfo(Script='(Get-AzContext).Subscription.Id')]
        [System.String]
        # The ID of the target subscription.
        ${SubscriptionId},
    
        [Parameter(ParameterSetName='NetworkRuleObject', Mandatory, ValueFromPipeline=$true)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Body')]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Models.Api20221201Preview.IVirtualNetworkRule[]]
        # The list of virtual network rules.
        # To construct, see NOTES section for NETWORKACLSVIRTUALNETWORKRULE properties and create a hash table.
        ${NetworkAclsVirtualNetworkRule},

        [Parameter(ParameterSetName='NetworkRuleResourceId', Mandatory)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Body')]
        [System.String[]]
        # The list of virtual network rule resource Ids.
        # To construct, see NOTES section for NETWORKACLSVIRTUALNETWORKRULE properties and create a hash table.
        ${NetworkAclsVirtualNetworkResourceId},
    
        [Parameter()]
        [Alias('AzureRMContext', 'AzureCredential')]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Azure')]
        [System.Management.Automation.PSObject]
        # The credentials, account, tenant, and subscription used for communication with Azure.
        ${DefaultProfile},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command as a job
        ${AsJob},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Wait for .NET debugger to attach
        ${Break},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be appended to the front of the pipeline
        ${HttpPipelineAppend},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Runtime.SendAsyncStep[]]
        # SendAsync Pipeline Steps to be prepended to the front of the pipeline
        ${HttpPipelinePrepend},
    
        [Parameter()]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Run the command asynchronously
        ${NoWait},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [System.Uri]
        # The URI for the proxy server to use
        ${Proxy},
    
        [Parameter(DontShow)]
        [ValidateNotNull()]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [System.Management.Automation.PSCredential]
        # Credentials for a proxy server to use for the remote call
        ${ProxyCredential},
    
        [Parameter(DontShow)]
        [Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Category('Runtime')]
        [System.Management.Automation.SwitchParameter]
        # Use the default credentials for the proxy
        ${ProxyUseDefaultCredentials}
    )
    
    process {
        $NetworkRuleObjectParameterSet = "NetworkRuleObject"
        $updated = $false 
        $rulesToRemove = $PSBoundParameters.NetworkAclsVirtualNetworkRule
        $resourceIds = $PSBoundParameters.NetworkAclsVirtualNetworkResourceId
        
        if ($PSBoundParameters.ContainsKey('NetworkAclsVirtualNetworkResourceId')) {
            $null = $PSBoundParameters.Remove('NetworkAclsVirtualNetworkResourceId')
        }
        if ($PSBoundParameters.ContainsKey('NetworkAclsVirtualNetworkRule')) {
            $null = $PSBoundParameters.Remove('NetworkAclsVirtualNetworkRule')
        }
        $PSBoundParameters.Add('ErrorAction', 'Stop')

        try {
            $volumeGroup = Az.ElasticSan\Get-AzElasticSanVolumeGroup @PSBoundParameters
        } catch {
            Write-Error $_.Exception
            return
        }
        $originalRules = [System.Collections.Generic.List[Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Models.Api20221201Preview.IVirtualNetworkRule]]$volumeGroup.NetworkAclsVirtualNetworkRule
        if ($originalRules.count -eq 0) {
            $originalRules = New-Object System.Collections.Generic.List[Microsoft.Azure.PowerShell.Cmdlets.ElasticSan.Models.Api20221201Preview.IVirtualNetworkRule]
        }

        switch ($PSCmdlet.ParameterSetName) {
            $NetworkRuleObjectParameterSet {
                foreach ($ruleToRemove in $rulesToRemove) {
                    $removed =  $false 
                    foreach ($rule in $originalRules) {
                        if ($rule.VirtualNetworkResourceId -eq $ruleToRemove.VirtualNetworkResourceId) {
                            $updated = $true
                            $null = $originalRules.Remove($rule)
                            $removed = $true
                            break
                        }
                    }
                    if (-not $removed) {
                        Write-Error "Cannot remove the specific VirtualNetworkRule as it doesn't exist: $($ruleToRemove.VirtualNetworkResourceId)"
                    }
                }
                break
            }
            Default {
                foreach ($resourceId in $resourceIds) {
                    $removed = $false 
                    foreach ($rule in $originalRules) {
                        if ($rule.VirtualNetworkResourceId -eq $resourceId) {
                            $updated = $true
                            $null = $originalRules.Remove($rule)
                            $removed = $true 
                            break
                        }
                    }
                    if (-not $removed) {
                        Write-Error "Cannot remove the specific VirtualNetworkRule as it doesn't exist: $($resourceId)"
                    }
                }
            }
        }
        if ($updated) {
            try {
                $PSBoundParameters.Add('NetworkAclsVirtualNetworkRule', $originalRules.ToArray())
                $updatedVolumeGroup = Az.ElasticSan\Update-AzElasticSanVolumeGroup @PSBoundParameters
            } catch {
                Write-Error $_.Exception
                return 
            }    
        }
        Write-Output($originalRules)
    }
}
