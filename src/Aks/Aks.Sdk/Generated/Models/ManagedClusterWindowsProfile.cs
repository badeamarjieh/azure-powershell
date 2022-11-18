// <auto-generated>
// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License.txt in the project root for
// license information.
//
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Microsoft.Azure.Management.ContainerService.Models
{
    using Microsoft.Rest;
    using Newtonsoft.Json;
    using System.Linq;

    /// <summary>
    /// Profile for Windows VMs in the managed cluster.
    /// </summary>
    public partial class ManagedClusterWindowsProfile
    {
        /// <summary>
        /// Initializes a new instance of the ManagedClusterWindowsProfile
        /// class.
        /// </summary>
        public ManagedClusterWindowsProfile()
        {
            CustomInit();
        }

        /// <summary>
        /// Initializes a new instance of the ManagedClusterWindowsProfile
        /// class.
        /// </summary>
        /// <param name="adminUsername">Specifies the name of the administrator
        /// account. &lt;br&gt;&lt;br&gt; **Restriction:** Cannot end in "."
        /// &lt;br&gt;&lt;br&gt; **Disallowed values:** "administrator",
        /// "admin", "user", "user1", "test", "user2", "test1", "user3",
        /// "admin1", "1", "123", "a", "actuser", "adm", "admin2", "aspnet",
        /// "backup", "console", "david", "guest", "john", "owner", "root",
        /// "server", "sql", "support", "support_388945a0", "sys", "test2",
        /// "test3", "user4", "user5". &lt;br&gt;&lt;br&gt; **Minimum-length:**
        /// 1 character &lt;br&gt;&lt;br&gt; **Max-length:** 20
        /// characters</param>
        /// <param name="adminPassword">Specifies the password of the
        /// administrator account. &lt;br&gt;&lt;br&gt; **Minimum-length:** 8
        /// characters &lt;br&gt;&lt;br&gt; **Max-length:** 123 characters
        /// &lt;br&gt;&lt;br&gt; **Complexity requirements:** 3 out of 4
        /// conditions below need to be fulfilled &lt;br&gt; Has lower
        /// characters &lt;br&gt;Has upper characters &lt;br&gt; Has a digit
        /// &lt;br&gt; Has a special character (Regex match [\W_])
        /// &lt;br&gt;&lt;br&gt; **Disallowed values:** "abc@123", "P@$$w0rd",
        /// "P@ssw0rd", "P@ssword123", "Pa$$word", "pass@word1", "Password!",
        /// "Password1", "Password22", "iloveyou!"</param>
        /// <param name="licenseType">The license type to use for Windows VMs.
        /// See [Azure Hybrid User
        /// Benefits](https://azure.microsoft.com/pricing/hybrid-benefit/faq/)
        /// for more details. Possible values include: 'None',
        /// 'Windows_Server'</param>
        /// <param name="enableCSIProxy">Whether to enable CSI proxy.</param>
        /// <param name="gmsaProfile">The Windows gMSA Profile in the Managed
        /// Cluster.</param>
        public ManagedClusterWindowsProfile(string adminUsername, string adminPassword = default(string), string licenseType = default(string), bool? enableCSIProxy = default(bool?), WindowsGmsaProfile gmsaProfile = default(WindowsGmsaProfile))
        {
            AdminUsername = adminUsername;
            AdminPassword = adminPassword;
            LicenseType = licenseType;
            EnableCSIProxy = enableCSIProxy;
            GmsaProfile = gmsaProfile;
            CustomInit();
        }

        /// <summary>
        /// An initialization method that performs custom operations like setting defaults
        /// </summary>
        partial void CustomInit();

        /// <summary>
        /// Gets or sets specifies the name of the administrator account.
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Restriction:** Cannot end in
        /// "." &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Disallowed values:**
        /// "administrator", "admin", "user", "user1", "test", "user2",
        /// "test1", "user3", "admin1", "1", "123", "a", "actuser", "adm",
        /// "admin2", "aspnet", "backup", "console", "david", "guest", "john",
        /// "owner", "root", "server", "sql", "support", "support_388945a0",
        /// "sys", "test2", "test3", "user4", "user5".
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Minimum-length:** 1
        /// character &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Max-length:** 20
        /// characters
        /// </summary>
        [JsonProperty(PropertyName = "adminUsername")]
        public string AdminUsername { get; set; }

        /// <summary>
        /// Gets or sets specifies the password of the administrator account.
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Minimum-length:** 8
        /// characters &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Max-length:** 123
        /// characters &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Complexity
        /// requirements:** 3 out of 4 conditions below need to be fulfilled
        /// &amp;lt;br&amp;gt; Has lower characters &amp;lt;br&amp;gt;Has upper
        /// characters &amp;lt;br&amp;gt; Has a digit &amp;lt;br&amp;gt; Has a
        /// special character (Regex match [\W_])
        /// &amp;lt;br&amp;gt;&amp;lt;br&amp;gt; **Disallowed values:**
        /// "abc@123", "P@$$w0rd", "P@ssw0rd", "P@ssword123", "Pa$$word",
        /// "pass@word1", "Password!", "Password1", "Password22", "iloveyou!"
        /// </summary>
        [JsonProperty(PropertyName = "adminPassword")]
        public string AdminPassword { get; set; }

        /// <summary>
        /// Gets or sets the license type to use for Windows VMs. See [Azure
        /// Hybrid User
        /// Benefits](https://azure.microsoft.com/pricing/hybrid-benefit/faq/)
        /// for more details. Possible values include: 'None', 'Windows_Server'
        /// </summary>
        [JsonProperty(PropertyName = "licenseType")]
        public string LicenseType { get; set; }

        /// <summary>
        /// Gets or sets whether to enable CSI proxy.
        /// </summary>
        /// <remarks>
        /// For more details on CSI proxy, see the [CSI proxy GitHub
        /// repo](https://github.com/kubernetes-csi/csi-proxy).
        /// </remarks>
        [JsonProperty(PropertyName = "enableCSIProxy")]
        public bool? EnableCSIProxy { get; set; }

        /// <summary>
        /// Gets or sets the Windows gMSA Profile in the Managed Cluster.
        /// </summary>
        [JsonProperty(PropertyName = "gmsaProfile")]
        public WindowsGmsaProfile GmsaProfile { get; set; }

        /// <summary>
        /// Validate the object.
        /// </summary>
        /// <exception cref="ValidationException">
        /// Thrown if validation fails
        /// </exception>
        public virtual void Validate()
        {
            if (AdminUsername == null)
            {
                throw new ValidationException(ValidationRules.CannotBeNull, "AdminUsername");
            }
        }
    }
}
