﻿// ----------------------------------------------------------------------------------
//
// Copyright Microsoft Corporation
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// ----------------------------------------------------------------------------------

using System;
using System.Collections;
using System.IO;
using System.Linq;
using System.Security;
using System.Security.Cryptography.X509Certificates;
using Microsoft.Azure.Common.Authentication;
using Microsoft.Azure.Common.Authentication.Models;
using Microsoft.WindowsAzure.Commands.Common.Properties;
using Microsoft.WindowsAzure.Commands.Profile.Models;
using Microsoft.WindowsAzure.Commands.Utilities.Common;
using System.Management.Automation;
using System.Security.Permissions;
using Microsoft.WindowsAzure.Commands.Utilities.Profile;

namespace Microsoft.WindowsAzure.Commands.Profile
{
    /// <summary>
    /// Creates new Microsoft Azure profile.
    /// </summary>
    [Cmdlet(VerbsCommon.Select, "AzureProfile"), OutputType(typeof(AzureProfile))]
    public class SelectAzureProfileCommand : SubscriptionCmdletBase
    {
        internal const string NewProfileParameterSet = "NewProfile";
        internal const string DefaultProfilePrameterSet = "DefaultProfile";

        [Parameter(ParameterSetName=NewProfileParameterSet, Mandatory=true, Position=0, ValueFromPipelineByPropertyName=true)]
        public new AzureProfile Profile { get; set; }

        [Parameter(ParameterSetName=DefaultProfilePrameterSet, Mandatory=true)]
        public SwitchParameter Default { get; set; }

        public SelectAzureProfileCommand() : base(true)
        {
        }

        [PermissionSet(SecurityAction.Demand, Name = "FullTrust")]
        public override void ExecuteCmdlet()
        {
            if (ParameterSetName == DefaultProfilePrameterSet)
            {
                Profile = AzurePSCmdlet.DefaultProfile;
            }

            if (Profile == null)
            {
                throw new ArgumentException("Selected profile must not be null.");
            }

            AzurePSCmdlet.CurrentProfile = Profile;
            AzurePSCmdlet.UpdateSessionStateForProfile(AzurePSCmdlet.CurrentProfile);
            WriteObject(Profile);
        }
    }
}
