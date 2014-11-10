##[Click here to access the Project Jellyfish homepage] (http://booz-allen-hamilton.github.io/projectjellyfish/)
![logo](https://cloud.githubusercontent.com/assets/8397443/4984316/9fbef166-6922-11e4-9e7e-74d3fe88c9b4.png)
<br>
<br>
##Project Jellyfish: <br>An Open Source Cloud Services Broker Solution
###Why Jellyfish
Jellyfish play an important role in the oceanic food chain, and are responsible for helping maintain balance in the ocean’s delicate, complex ecosystem. They occupy every major ocean in the world, and are adept at withstanding a broad range of salinities and temperatures. Today’s organizations need equal versatility in its cloud service brokering. With Project Jellyfish, you can provision and manage all your on- and off-premise cloud services from a centralized, open source e-commerce platform.

###Why an Open Source Cloud Broker
Cloud computing has emerged as one of the most valuable technologies for managing the IT ecosystem. Yet the myriad of cloud services available can be overwhelming to administer effectively. The lack of standardization and cost tracking capabilities, as well as the risk of vendor lock-in, adds to your company’s everyday financial and operational challenges. <br>

*To help resolve these issues,* Booz Allen Hamilton developed Project Jellyfish, an open source cloud services broker solution that unifies your disparate cloud resources, including Infrastructure as a Service (IaaS), Platform as a Service (PaaS), and Software as a Service (SaaS). This means automated and rapid service delivery, comprehensive performance and cost monitoring, standardized configuration management, and customizable workflows across public, private, or hybrid cloud platforms for overall improved business operations. Using an intuitive, e-commerce interface, Project Jellyfish provides a holistic reach into your entire inventory of virtualized assets — from the full catalog of services, to governance and compliance, to chargebacks. <br>

*The result is* a rapid self-service marketplace, reusable code, scalable infrastructure, and the ability to accurately track and report your company’s cloud services usage and costs. Project Jellyfish is revolutionizing today’s complex cloud ecosystem through open source to drive innovation, quality and efficiency. 

##Contents
[Architecture] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#architecture)<br>
[List of Our Repos] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#list-of-our-repos)<br>
[Requirements] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#requirements)<br>
[Installing the Cookbooks] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#installing-the-cookbooks)<br>
[Configuring the Marketplace] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#configuring-the-cloud-portal)<br>
[Configuring the Cloud Engine] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#configuring-the-cloud-engine)<br>
[Configuring the Cloud Gateway] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#configuring-the-cloud-gateway)<br>
[License] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#license)<br>
[Export Notice] (https://github.com/booz-allen-hamilton/projectjellyfish/blob/master/README.md#export-notice)
____
##Architecture
Jellyfish is made up of three components, the Marketplace, the Cloud Engine, and the Cloud Gateway. Each component serves a specific function, and when integrated together, they provide a flexible framework with the ability to interface to multiple cloud providers behind a single portal.<br>

**Marketplace**<br>
The Marketplace is a single pane of glass that users can use to browse and order a variety of IaaS, PaaS, and SaaS resources from the customizable storefront catalog. It also serves as a single point of entry for administrators to login and manage resources and user accounts. The Marketplace is built using Drupal 7.24.<br>

**Cloud Engine**<br>
The Cloud Engine provides the core automation capabilities of the cloud broker. The Jellyfish Cloud Engine uses  Apache ServiceMix 5.1.2 as the messaging engine and Chef as the configuration management engine.<br>

**Cloud Gateway**<br>
The Cloud Gateway is ManageIQ, and it enables integration between the cloud broker and cloud providers. The Cloud Gateway provides multi-cloud provisioning and management capabilities as serves as a central point for all the user's cloud resources.

## List of Our Repos

 - [Marketplace] (https://github.com/booz-allen-hamilton/marketplace)
 - [Cloud Engine] (https://github.com/booz-allen-hamilton/servicemix)
 - [ManageIQ] (https://github.com/booz-allen-hamilton/manageiq)
 - Chef Cookbooks:
    - [Marketplace Cookbook] (https://github.com/booz-allen-hamilton/chef-marketplace)
    - [ServiceMix Cookbook] (https://github.com/booz-allen-hamilton/chef-servicemix)
    - [ManageIQ Cookbook] (https://github.com/booz-allen-hamilton/chef-manageiq)

## Requirements
Jellyfish is built using three virtual machines for the three primary components. At a minimum, the cloud broker requires the following hardware, operating systems, and communications settings to support the suite of open source products.

**Marketplace Requirements**

| Component          |Marketplace                                       |
| --------           |:------------                                    |
| Operating System   | RHEL 6.5 or CentOS 6.5                           |
| Memory             | 8 GB                                             |    
| CPU                | 2                                                |
| Disk               | 100 GB                                           |
| TCP Ports          | 22, 80, 443, 8181                                   |
| UDP Ports          |                                                  |
| Network Access     | Public facing and access to broker services (8183)  |

**Cloud Engine Requirements**

| Component          |Cloud Engine                                      |
| --------           |:------------                                    |
| Operating System   | RHEL 6.5 or CentOS 6.5                           |
| Memory             | 8 GB                                             |    
| CPU                | 2                                                |
| Disk               | 50 GB                                            |
| TCP Ports          | 22, 8180, 8181, 8182, 8183, 8080, 61616                |
| UDP Ports          | 61616                                            |
| Network Access     | Access to broker services (8180, 8181, 8182, 8080, 61616)      |

**Cloud Gateway Requirements**

| Component          |Cloud Gateway                                      |
| --------           |:------------                                    |
| Operating System   | RHEL 6.5 or CentOS 6.5                           |
| Memory             | 8 GB                                             |    
| CPU                | 2                                                |
| Disk               | 80 GB                                            |
| TCP Ports          | 22, 443, 80                                        |
| UDP Ports          |                                                  |
| Network Access     | Access to cloud providers and broker services (443, 8183)   |


##Installing the Cookbooks

1) Log in to the appropriate VM as the root user

```Bash
ssh root@<ip-address> -i server-cert-key.pem
```

2) Update VM and install telnet, wget, and unzip and dependencies
```Bash
[root@server ~]# yum update –y
[root@server ~]# yum install -y vim telnet unzip wget git
```

3) Follow the specific instructions within the cookbook repo:
 - [Marketplace Cookbook] (https://github.com/booz-allen-hamilton/chef-marketplace)
 - [Cloud Engine Cookbook] (https://github.com/booz-allen-hamilton/chef-servicemix)
 - [Cloud Gateway Cookbook] (https://github.com/booz-allen-hamilton/chef-manageiq)


##Configuring the Marketplace
1) Configure Communications
 - Navigate to Store>Broker Order Communications
 - Enter *http://CLOUD_ENGINE_IP:8183/orders/create/* in "Transmit URL"
 - Enter the ServiceMix Username and Password
 - Note the Receive-Api Key required to configure the Cloud Engine

2) Add/Maintain a Catalog of Items
Create Application and Add
 - Navigate to Store>Products>Add a Product
 - Choose the type of item you are adding to the catalog
 - Enter the required information and click Save
 - Confirm the product was added in Store>Products
 - Navigate to Content>Add Content>Product
 - Enter the product name, description, and upload an image for the product
 - Click "Add Existing Product" and enter the SKU for the item you created
 - Click "Add Product" and then click Save

3) Create a Form Email Configuration
 - Navigate to Configuration>Workflow>Rules
 - On the Rules page, under Active Rules, locate the rules titled "Email when project_req set to Approved," and click on the rule to edit
 - Locate the Actions elements table and click the "+Add Action" button
 - On the "Add a New Action" page, click on the dropdown menu to add a variable
 - Locate "Send Mail" from the System block and click on it
 - On the Add a New Action page, add the recipient's email, the subject, and the body, and click Save *(add "[node:field-app-code]" at the end of the subject to add the project app code)

4) Update CRON Job Run Frequency
 - Navigate to Configuration>System>Cron Settings>Settings
 - Under "Single Job Settings," locate the job called "bah_order_com_cron," and adjust to your desired schedule and click Save

5) LDAP Configuration
 - Navigate to Configuration>People>LDAP Configuration
 - Settings Tab
    - The Settings page is the default tab when accessing the LDAP Configuration. All items on the Settings page should remain default.
 - Servers tab
    - You can add multiple LDAP Servers to use with the LDAP Authentication module. Server settings can be edited via the "List" tab once edited.
 - User Tab
    - This tab specifically addresses how user accounts are provisioned, synched, and updated between Drupal and Active Directory. In this envoironment, Drupal only pulls information from Active Directory so the BASIC PROVISIONING TO LDAP SETTINGS are left at their default value
 - Authentication Tab
    - Authenticate LDAP users
 - Authorization
    - This tab allows for Active Directory Security Groups to be mapped to roles and organic groups defined within Drupal and providing role Based Access to the marketplace
 - Project Configuration
    - When a new project has been requested, the marketplace must be updated to include the project APP code and the funding amount available for the project. Navigate to Content>Add Content>Project to create a new project and populate the appropriate title, organic group credits, and application code information.

6) Updating FAQs
 - Navigate to Content
 - Select "FAQ" from the Type drop down menu and click Filter
 - Click "+ Add Content" and click on FAQ
 - Create an FAQ by filling in the question and response fields and then click Save

##Configuring the Cloud Engine
1) Use your favorite command-line accessible text editor to edit the Cloud Engine configruration file:
```Bash
/opt/cloudengine/servicemix/etc/com.bah.cloudengine.cfg
```

2) Make the following changes to the file, then write+exit:
 - Insert the Marketplace, Engine, or Gateway IP addresses where they are referenced
 - Set "marketplace.restKey" to the Receive-API Key from the Broker Order Communications Page in the Marketplace

3) Restart the Cloud Engine
```Bash
service servicemix-service restart
```

##Configuring the Cloud Gateway
1) Adding Providers
 - For cloud providers, navigate to Clouds>Providers; for infrastructure providers, navigate to Infrastructure>Providers
 - Click on the Configuration drop down menu, and select "+ add a New Cloud Provider," or "+ add a New Infrastructure Provider"
 - In the Basic Information section, add a name, select a provider type from the drop down menu, and fill in the corresponding fields
 - In the Credentials section, enter your security information for the provider you selected
 - Click Validate and then click Add

2) Adding Catalog Items
 - Navigate to Services>Catalogs
 - Click on the Catalog Items accordion tab
 - Click on the Configuration drop down menu, and select "+ add a New Catalog Item"
 - Select a Catalog Item Type from the drop down menu
 - In the Basic Info section, fill in the item name and description. If you would like to assign the item to a catalog, check the "Display in Catalog" box, and fill in the required information.
 - Go to the Request Info section. Navigate through each sub-tab, and fill in the information required by the provider (at a minimum, field names marked with an asterick are required)
 - Click Add

3) Configuring Script to Update Cloud Engine
 - Navigate to Automate>Explorer
 - Click on the Datastore folder
    - Select "Add a New Domain" from the Configuration drop down menu
    - Enter "BAH" for the name and "Booz Allen Hamilton Customization" for the description
    - Check enabled and click Save
 - Navigate to ManageIQ>Service>Provisioning>StatsMachines>Methods
 - Select the Instances tab
    - Select "Add a New Instance" from the Configuration drop down menu
    - Enter "update_servicemix_and_chef" for the name and the display name
    - In the Fields section, find "execute" under the Name column and enter update_servicemix_and_chef for the value, then click Add
 - Navigate to ManageIQ>Service>Provisioning>StateMachines>Methods
 - Select the Methods tab
    - Click on Configuration>Add a New Method
    - Enter update_servicemix_and_chef for the name and display name
    - For the location, select inline
    - Under data, paste the code from [update_servicemix_and_chef code link], add the required information where it is requested within the script, and click Add
 - Navigate to ManageIQ>Service>Provisioning>StateMachines>ServiceProvision_Template> CatalogItemInitialization
    - Click on Configuration>Copy this Instance
    - For the To Domain value, select BAH from the drop down list
    - Check Copy to same path and click Copy
 - Navigate to ManageIQ>Service>Provisioning>StateMachines>ServiceProvision_Template> CatalogItemInitialization
    - Select Edit this Instance in the Configuration drop down menu
    - In the Fields section under the Name column, find post1 and for the value, enter /Service/Provisioning/StateMachines/Methods/update_servicemix_and_chef
    - Click Save
 - Create a new catalog item or select an existing one
 - For the Provisioning Entry Point, set the value to /BAH/Service/Provisioning/StateMachines/ServiceProvision_Template/ CatalogItemInitialization

## License

Booz Allen Hamilton’s Project Jellyfish Release 1 will be comprised of three primary modules:  Gateway (ManageIQ), Engine (Apache Service Mix) and Marketplace (Drupal).  Except where otherwise noted, all Project Jellyfish source files are licensed under the GNU General Public License, version 2 or later. That means you are free to download, reuse, modify, and distribute any files hosted in Project Jellyfish’s Git repositories under the terms of either the GPL version 2 (or later) in combination with any code with any license that is compatible with either versions 2 or 3, plus the licenses associated with other open source components of Project Jellyfish (e.g., Apache 2.0 and GPLv2 for ManageIQ). Detailed license files can be found in each repo, but at a high level, the licensing models for Release 1 are as follows: the Marketplace is licensed under GPLv2; the Engine is licensed under a combination of several license models (e.g., GPLv2, Apache2, LGPL2.1, and CDDL 1.1); and the Gateway is licensed under Apache 2.0 and GPL.

See [LICENSE.txt](LICENSE.txt)

## Export Notice

See [EXPORTNOTICE.txt](EXPORTNOTICE.txt)
