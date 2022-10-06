// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.PowerShell.Ssh.Helpers.HybridCompute.Models
{
    using Newtonsoft.Json;
    using System.Collections;
    using System.Collections.Generic;
    using System.Linq;

    /// <summary>
    /// Describes the Machine Extensions List Result.
    /// </summary>
    public partial class MachineExtensionsListResult
    {
        /// <summary>
        /// Initializes a new instance of the MachineExtensionsListResult
        /// class.
        /// </summary>
        public MachineExtensionsListResult()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the MachineExtensionsListResult
        /// class.
        /// </summary>
        /// <param name="value">The list of extensions</param>
        /// <param name="nextLink">The uri to fetch the next page of machine
        /// extensions. Call ListNext() with this to fetch the next page of
        /// extensions.</param>
        public MachineExtensionsListResult(IList<MachineExtension> value = default(IList<MachineExtension>), string nextLink = default(string))
        {
            Value = value;
            NextLink = nextLink;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets the list of extensions
        /// </summary>
        [JsonProperty(PropertyName = "value")]
        public IList<MachineExtension> Value { get; set; }

        /// <summary>
        /// Gets or sets the uri to fetch the next page of machine extensions.
        /// Call ListNext() with this to fetch the next page of extensions.
        /// </summary>
        [JsonProperty(PropertyName = "nextLink")]
        public string NextLink { get; set; }

    }
}
