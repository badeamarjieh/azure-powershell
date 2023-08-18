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
# Code generated by Microsoft (R) AutoRest Code Generator.Changes may cause incorrect behavior and will be lost If the code
# is regenerated.
# ----------------------------------------------------------------------------------

# Usage: 1. This script can be called by build.proj used in CI pipeline
#        2. Can be used to do static analysis in local env. Such as: .\tools\ExecuteCIStep.ps1 -StaticAnalysisSignature -TargetModule "Accounts;Compute"
#        3. Can run static analyis for all the module built in artifacts. Such as: .\tools\ExecuteCIStep.ps1 -StaticAnalysisSignature will run static analysis signature check for all the modules under artifacts/debug.
Param(
    [Switch]
    $Build,

    [String]
    $BuildAction='build',

    [String]
    $PullRequestNumber,

    [String]
    $GenerateDocumentationFile,

    [String]
    $EnableTestCoverage,

    [Switch]
    $Test,

    [Switch]
    $TestAutorest,

    [String]
    $AutorestDirectory,

    [Switch]
    $StaticAnalysis,

    [Switch]
    $StaticAnalysisBreakingChange,

    [Switch]
    $StaticAnalysisDependency,

    [Switch]
    $StaticAnalysisSignature,

    [Switch]
    $StaticAnalysisHelp,

    [Switch]
    $StaticAnalysisUX,

    [Switch]
    $StaticAnalysisCmdletDiff,

    [Switch]
    $StaticAnalysisGeneratedSdk,

    [String]
    $RepoArtifacts='artifacts',

    [String]
    $Configuration='Debug',

    [String]
    $TestFramework='net6.0',

    [String]
    $TestOutputDirectory='artifacts/TestResults',

    [String]
    $StaticAnalysisOutputDirectory='artifacts/StaticAnalysisResults',

    [String]
    $TargetModule
)

$CIPlanPath = "$RepoArtifacts/PipelineResult/CIPlan.json"
$PipelineResultPath = "$RepoArtifacts/PipelineResult/PipelineResult.json"

$testResults = @{
    Succeeded = 1
    Warning = 10
    Failed = 100
}

Function Get-PlatformInfo
{
    If ($IsWindows)
    {
        $OS = "Windows"
    }
    ElseIf ($IsLinux)
    {
        $OS = "Linux"
    }
    ElseIf ($IsMacOS)
    {
        $OS = "MacOS"
    }
    Else
    {
        $OS = "Others"
    }
    return "$($Env:PowerShellPlatform) - $OS"
}

Function Get-ModuleFromPath
{
    Param(
        [String]
        $Path
    )
    Return "Az." + $Path.Split([IO.Path]::DirectorySeparatorChar + "src")[1].Split([IO.Path]::DirectorySeparatorChar)[1]
}

Function Set-ModuleTestStatusInPipelineResult
{
    Param(
        [String]
        $ModuleName,
        [String]
        $Status,
        [String]
        $Content=""
    )
    Write-Warning "Set-ModuleTestStatusInPipelineResult $ModuleName - $Status"
    If (Test-Path $PipelineResultPath)
    {
        $PipelineResult = Get-Content $PipelineResultPath | ConvertFrom-Json
        $Platform = Get-PlatformInfo
        $PipelineResult.test.Details[0].Platform = $Platform
        Foreach ($ModuleInfo in $PipelineResult.test.Details[0].Modules)
        {
            If ($ModuleInfo.Module -Eq $ModuleName)
            {
                if ([string]::IsNullOrWhiteSpace($ModuleInfo.Status) -or $testResults[$ModuleInfo.Status] -lt $testResults[$Status]) {
                    $ModuleInfo.Status = $Status
                    $ModuleInfo.Content = $Content
                }
            }
        }
        ConvertTo-Json -Depth 10 -InputObject $PipelineResult | Out-File -FilePath $PipelineResultPath
    }
}

$ErrorActionPreference = 'Stop'

If ($Build)
{
    $LogFile = "$RepoArtifacts/Build.Log"
    $buildCmdResult = "dotnet $BuildAction $RepoArtifacts/Azure.PowerShell.sln -c $Configuration -fl '/flp1:logFile=$LogFile;verbosity=quiet'"
    If ($GenerateDocumentationFile -eq "false")
    {
        $buildCmdResult += " -p:GenerateDocumentationFile=false"
    }
    if ($EnableTestCoverage -eq "true")
    {
        $buildCmdResult += " -p:TestCoverage=TESTCOVERAGE"
    }
    Invoke-Expression -Command $buildCmdResult

    If (Test-Path -Path "$RepoArtifacts/PipelineResult")
    {
        $LogContent = Get-Content $LogFile
        $BuildResultArray = @()
        ForEach ($Line In $LogContent)
        {
            $Position, $ErrorOrWarningType, $Detail = $Line.Split(": ")
            $Detail = Join-String -Separator ": " -InputObject $Detail
            If ($Position.Contains("src"))
            {
                $ModuleName = "Az." + $Position.Split("src" + [IO.Path]::DirectorySeparatorChar)[1].Split([IO.Path]::DirectorySeparatorChar)[0]
            }
            ElseIf ($Position.Contains([IO.Path]::DirectorySeparatorChar))
            {
                $ModuleName = "Az." + $Position.Split([IO.Path]::DirectorySeparatorChar)[0]
            }
            Else
            {
                $ModuleName = "dotnet"
            }
            $Type, $Code = $ErrorOrWarningType.Split(" ")
            $BuildResultArray += @{
                "Position" = $Position;
                "Module" = $ModuleName;
                "Type" = $Type;
                "Code" = $Code;
                "Detail" = $Detail
            }
        }

        #Region produce result.json for GitHub bot to comsume
        $Platform = Get-PlatformInfo
        $Template = Get-Content "$PSScriptRoot/PipelineResultTemplate.json" | ConvertFrom-Json
        $ModuleBuildInfoList = @()
        $CIPlan = Get-Content "$RepoArtifacts/PipelineResult/CIPlan.json" | ConvertFrom-Json
        ForEach ($ModuleName In $CIPlan.build)
        {
            $BuildResultOfModule = $BuildResultArray | Where-Object { $_.Module -Eq "Az.$ModuleName" }
            If ($BuildResultOfModule.Length -Eq 0)
            {
                $ModuleBuildInfoList += @{
                    Module = "Az.$ModuleName";
                    Status = "Succeeded";
                    Content = "";
                }
            }
            Else
            {
                $Content = "|Type|Code|Position|Detail|`n|---|---|---|---|`n"
                $ErrorCount = 0
                ForEach ($BuildResult In $BuildResultOfModule)
                {
                    If ($BuildResult.Type -Eq "Error")
                    {
                        $ErrorTypeEmoji = "❌"
                        $ErrorCount += 1
                    }
                    ElseIf ($BuildResult.Type -Eq "Warning")
                    {
                        $ErrorTypeEmoji = "⚠️"
                    }
                    $Content += "|$ErrorTypeEmoji|$($BuildResult.Code)|$($BuildResult.Position)|$($BuildResult.Detail)|`n"
                }
                If ($ErrorCount -Eq 0)
                {
                    $Status = "Warning"
                }
                Else
                {
                    $Status = "Failed"
                }
                $ModuleBuildInfoList += @{
                    Module = "Az.$ModuleName";
                    Status = $Status;
                    Content = $Content;
                }
            }
        }
        $BuildDetail = @{
            Platform = $Platform;
            Modules = $ModuleBuildInfoList;
        }
        $Template.Build.Details += $BuildDetail

        $DependencyStepList = $Template | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object { $_ -Ne "build" }

        Write-Warning "==========================================="
        Write-Warning $Env:IsGenerateBased
        Write-Warning "==========================================="
        if ($Env:IsGenerateBased -eq "true")
        {
            ForEach ($phase In ($CIPlan | Get-Member -MemberType NoteProperty | Select-Object -ExpandProperty Name | Where-Object { $_ -Ne "build" }))
            {
                $CIPlan.$phase = $CIPlan.$phase | Where-Object { $_ -Ne "Accounts" }
            }
            ConvertTo-Json -Depth 10 -InputObject $CIPlan | Out-File -FilePath $CIPlanPath
        }

        ForEach ($DependencyStep In $DependencyStepList)
        {
            $ModuleInfoList = @()
            ForEach ($ModuleName In $CIPlan.$DependencyStep)
            {
                $ModuleInfoList += @{
                    Module = "Az.$ModuleName";
                    Status = "Running";
                    Content = "";
                }
            }
            $Detail = @{
                Platform = $Platform;
                Modules = $ModuleInfoList;
            }
            $Template.$DependencyStep.Details += $Detail
        }
        If ($PSBoundParameters.ContainsKey("PullRequestNumber")) {
            $Template | Add-Member -NotePropertyName pull_request_number -NotePropertyValue $PullRequestNumber
        }

        ConvertTo-Json -Depth 10 -InputObject $Template | Out-File -FilePath "$RepoArtifacts/PipelineResult/PipelineResult.json"
        #EndRegion
    }
    Return
}

If (Test-Path $CIPlanPath)
{
    $CIPlan = Get-Content $CIPlanPath | ConvertFrom-Json
}
ElseIf (-Not $PSBoundParameters.ContainsKey("TargetModule"))
{
    $TargetModule = Get-ChildItem "$RepoArtifacts/$Configuration" | ForEach-Object { $_.Name.Replace("Az.", "") } | Join-String -Separator ';'
    $PSBoundParameters["TargetModule"] = $TargetModule
}

# Run the test-module.ps1 in current folder and set the test status in pipeline result
If ($TestAutorest)
{
    If (-not (Test-Path "$AutorestDirectory/test-module.ps1"))
    {
        Write-Warning "There is no test-module.ps1 found in the folder: $AutorestDirectory"
        Return
    }
    $ModuleName = Split-Path -Path $AutorestDirectory -Leaf
    If ($ModuleName.EndsWith(".Autorest"))
    {
        $ModuleName = Split-Path -Path $AutorestDirectory | Split-Path -Leaf
    }
    $ModuleFolderName = $ModuleName.Split(".")[1]
    If (Test-Path $CIPlanPath)
    {
        $CIPlan = Get-Content $CIPlanPath | ConvertFrom-Json
        If (-not ($CIPlan.test.Contains($ModuleFolderName)))
        {
            Write-Debug "Skip test for $ModuleName because it is not in the test plan."
            Return
        }
        . $AutorestDirectory/test-module.ps1
        If ($LastExitCode -ne 0)
        {
            $Status = "Failed"
        }
        Else
        {
            $Status = "Succeeded"
        }
        Set-ModuleTestStatusInPipelineResult -ModuleName $ModuleName -Status $Status
    }
    Return
}

If ($Test -And (($CIPlan.test.Length -Ne 0) -Or ($PSBoundParameters.ContainsKey("TargetModule"))))
{
    dotnet test $RepoArtifacts/Azure.PowerShell.sln --filter "AcceptanceType=CheckIn&RunType!=DesktopOnly" --configuration $Configuration --framework $TestFramework --logger trx --results-directory $TestOutputDirectory

    $TestResultFiles = Get-ChildItem "$RepoArtifacts/TestResults/" -Filter *.trx
    $FailedTestCases = @{}
    Foreach ($TestResultFile in $TestResultFiles)
    {
        $Content = Get-Content -Path $TestResultFile
        $XmlDocument = New-Object System.Xml.XmlDocument
        $XmlDocument.LoadXml($Content)
        $FailedTestIdList = $XmlDocument.TestRun.Results.UnitTestResult | Where-Object { $_.outcome -eq "Failed" } | ForEach-Object { $_.testId }
        Foreach ($FailedTestId in $FailedTestIdList)
        {
            $TestMethod = $XmlDocument.TestRun.TestDefinitions.UnitTest | Where-Object {$_.id -eq $FailedTestId} | ForEach-Object {$_.TestMethod}
            $ModuleName = Get-ModuleFromPath $TestMethod.codeBase
            $FailedTestName = $TestMethod.name
            If (-not $FailedTestCases.ContainsKey($ModuleName))
            {
                $FailedTestCases.Add($ModuleName, @($FailedTestName))
            }
            Else
            {
                $FailedTestCases[$ModuleName] += $FailedTestName
            }
        }
    }
    If (Test-Path $PipelineResultPath)
    {
        $PipelineResult = Get-Content $PipelineResultPath | ConvertFrom-Json
        Foreach ($ModuleInfo in $PipelineResult.test.Details[0].Modules)
        {
            If ($FailedTestCases.ContainsKey($ModuleInfo.Module))
            {
                $Status = "Failed"
                #TODO We will add the content of failed test cases in the feature.
            }
            Else
            {
                $Status = "Succeeded"
            }
            Set-ModuleTestStatusInPipelineResult -ModuleName $ModuleInfo.Module -Status $Status
        }
    }

    If ($FailedTestCases.Length -ne 0)
    {
        Return -1
    }
    Else
    {
        Return
    }
}

If ($StaticAnalysis)
{
    $Parameters = @{
        RepoArtifacts = $RepoArtifacts;
        StaticAnalysisOutputDirectory = $StaticAnalysisOutputDirectory;
        Configuration = $Configuration;
    }
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $Parameters["TargetModule"] = $TargetModule
    }
    $FailedTasks = @()
    $ErrorLogPath = "$StaticAnalysisOutputDirectory/error.log"
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisBreakingChange @Parameters 2>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "BreakingChange"
    }
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisDependency @Parameters 2>>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "Dependency"
    }
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisSignature @Parameters 2>>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "Signature"
    }
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisHelp @Parameters 2>>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "Help"
    }
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisUX @Parameters 2>>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "UXMetadata"
    }
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisCmdletDiff @Parameters 2>>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "CmdletDiff"
    }
    .("$PSScriptRoot/ExecuteCIStep.ps1") -StaticAnalysisGeneratedSdk @Parameters 2>>$ErrorLogPath
    If (($LASTEXITCODE -ne 0) -and ($LASTEXITCODE -ne $null))
    {
        $FailedTasks += "GenertedSdk"
    }
    If ($FailedTasks.Length -ne 0)
    {
        Write-Host "There are failed tasks: $FailedTasks"
        $ErrorLog = Get-Content -Path $ErrorLogPath | Join-String -Separator "`n"
        Write-Error $ErrorLog
    }
    Return 0
}

If ($StaticAnalysisBreakingChange)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $BreakingChangeCheckModuleList = $TargetModule
    }
    Else
    {
        $BreakingChangeCheckModuleList = Join-String -Separator ';' -InputObject $CIPlan.'breaking-change'
    }
    If ("" -Ne $BreakingChangeCheckModuleList)
    {
        Write-Host "Running static analysis for breaking change..."
        dotnet $RepoArtifacts/StaticAnalysis/StaticAnalysis.Netcore.dll -p $RepoArtifacts/$Configuration -r $StaticAnalysisOutputDirectory --analyzers breaking-change -u -m $BreakingChangeCheckModuleList
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
    }
    Return 0
}
If ($StaticAnalysisDependency)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $DependencyCheckModuleList = $TargetModule
    }
    Else
    {
        $DependencyCheckModuleList = Join-String -Separator ';' -InputObject $CIPlan.dependency
    }
    If ("" -Ne $DependencyCheckModuleList)
    {
        Write-Host "Running static analysis for dependency..."
        dotnet $RepoArtifacts/StaticAnalysis/StaticAnalysis.Netcore.dll -p $RepoArtifacts/$Configuration -r $StaticAnalysisOutputDirectory --analyzers dependency -u -m $DependencyCheckModuleList
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
        .($PSScriptRoot + "/CheckAssemblies.ps1") -BuildConfig $Configuration
    }
    Return 0
}

If ($StaticAnalysisSignature)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $SignatureCheckModuleList = $TargetModule
    }
    Else
    {
        $SignatureCheckModuleList = Join-String -Separator ';' -InputObject $CIPlan.signature
    }
    If ("" -Ne $SignatureCheckModuleList)
    {
        Write-Host "Running static analysis for signature..."
        dotnet $RepoArtifacts/StaticAnalysis/StaticAnalysis.Netcore.dll -p $RepoArtifacts/$Configuration -r $StaticAnalysisOutputDirectory --analyzers signature -u -m $SignatureCheckModuleList
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
    }
    Return 0
}

If ($StaticAnalysisHelp)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $HelpCheckModuleList = $TargetModule
    }
    Else
    {
        $HelpCheckModuleList = Join-String -Separator ';' -InputObject $CIPlan.help
    }
    If ("" -Ne $HelpCheckModuleList)
    {
        Write-Host "Running static analysis for help..."
        dotnet $RepoArtifacts/StaticAnalysis/StaticAnalysis.Netcore.dll -p $RepoArtifacts/$Configuration -r $StaticAnalysisOutputDirectory --analyzers help -u -m $HelpCheckModuleList
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
    }
    Return 0
}

If ($StaticAnalysisUX)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $UXModuleList = $TargetModule
    }
    Else
    {
        $UXModuleList = Join-String -Separator ';' -InputObject $CIPlan.ux
    }
    If ("" -Ne $UXModuleList)
    {
        Write-Host "Running static analysis for UX metadata..."
        dotnet $RepoArtifacts/StaticAnalysis/StaticAnalysis.Netcore.dll -p $RepoArtifacts/$Configuration -r $StaticAnalysisOutputDirectory --analyzers ux -u -m $UXModuleList
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
    }
    Return 0
}

If ($StaticAnalysisCmdletDiff)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $CmdletDiffModuleList = $TargetModule
    }
    Else
    {
        $CmdletDiffModuleList = Join-String -Separator ';' -InputObject $CIPlan.'cmdlet-diff'
    }
    If ("" -Ne $CmdletDiffModuleList)
    {
        Write-Host "Running static analysis for cmdlet diff..."
        dotnet $RepoArtifacts/StaticAnalysis/StaticAnalysis.Netcore.dll -p $RepoArtifacts/$Configuration -r $StaticAnalysisOutputDirectory --analyzers cmdlet-diff -u -m $CmdletDiffModuleList
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
    }
    Return 0
}

If ($StaticAnalysisGeneratedSdk)
{
    If ($PSBoundParameters.ContainsKey("TargetModule"))
    {
        $GeneratedSdkModuleList = $TargetModule
    }
    Else
    {
        $GeneratedSdkModuleList = Join-String -Separator ';' -InputObject $CIPlan.'generated-sdk'
    }
    If ("" -Ne $GeneratedSdkModuleList)
    {
        Write-Host "Running static analysis to verify generated sdk..."
        $result = .($PSScriptRoot + "/StaticAnalysis/GeneratedSdkAnalyzer/SDKGeneratedCodeVerify.ps1")
        Write-Host "Static analysis to verify generated sdk result: $result"
        If ($LASTEXITCODE -ne 0)
        {
            Return $LASTEXITCODE
        }
    }
    Return 0
}