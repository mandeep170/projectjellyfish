#Official Release October 22, 2014

##Welcome to Project Jellyfish
Jellyfish is Booz Allen Hamilton's hybrid, automated, and customizable cloud management and brokerage solution. Jellyfish helps administrators track resource utilization and costs, simplifies the process of requesting cloud resources, and reduces the time required to acquire services. As a result, organizations can effectively manage their increasing number of cloud resources to ensure compliance with security, cost, and time requirements.
###Architecture
Jellyfish is made up of three components, the Cloud Portal, the Cloud Engine, and the Cloud Gateway. Each component serves a specific function, and when integrated together, they provide a flexible framework with the ability ot interface to multiple cloud providers behind a single portal.<br>
**Cloud Portal**<br>
The Cloud Portal is a single pane of glass that users can use to browse and order a variety of IaaS, PaaS, and SaaS resources from the customizable storefront catalog. It also serves as a single point of entry for administrators to login and manage marketplace resources and user accounts. The Cloud Portal is built using Drupal 7.24.<br>

**Cloud Engine**<br>
The Cloud Engine provides the core automation capabilities of the cloud broker. The Jellyfish Cloud Engine uses  Apache ServiceMix 5.1.2 as the messaging engine and Chef as the configuration management engine.<br>

**Cloud Gateway**<br>
The Cloud Gateway is ManageIQ, and it enables integration between the cloud broker and cloud providers. The Cloud Gateway provides multi-cloud provisioning and management capabilities as serves as a central point for all the user's cloud resources.

## List of our Repos

 - [Marketplace] (https://github.com/booz-allen-hamilton/marketplace)
 - [Cloud Engine] (https://github.com/booz-allen-hamilton/servicemix)
 - [ManageIQ] (https://github.com/booz-allen-hamilton/manageiq)
 - Cookbooks
    - [Marketplace] (https://github.com/booz-allen-hamilton/chef-marketplace)
    - [ServiceMix] (https://github.com/booz-allen-hamilton/chef-servicemix)
    - [ManageIQ] (https://github.com/booz-allen-hamilton/chef-manageiq)

## Get Started

###Installing the Cookbooks

1. Log in to the appropriate VM as the root user
>ssh root@<ip-address> -i server-cert-key.pem

2. Update Vm and install telnet, wget, and unzip and dependencies
>[root@server ~]# yum update –y
>
>[root@server ~]# yum install -y vim telnet unzip wget git

3. Go to http://gettingstartedwithchef.com/first-steps-with-chef.html and follow the instructions to install Chef on your VM.
>Thank you for installing Chef!

4. Using the instructions on http://gettingstartedwithchef.com/first-steps-with-chef.html, create a cookbook.

5. Run the appropriate Cookbook
 - Cloud Portal
>[root@server ~/chef-repo]# knife cookbook site install bah-marketplace

 - Cloud Engine
>[root@server ~/chef-repo]# knife cookbook site install servicemix

 - Cloud Gateway
>[root@server ~/chef-repo]# knife cookbook site install manageiq

6. Run the appropriate Chef-solo command (this could take up to 10 or 15 minutes)
 - Cloud Portal
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/bahmarketplace.json

 - Cloud Engine
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/servicemix.json

 - Cloud Gateway
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/manageiq.json

###Configuring the Cloud Portal
1. Configure Communications
 - Within the Cloud Portal, navigate to Store>Broker Order Communications
 - Enter *http://CLOUD_ENGINE_IP:8183/orders/create/* in "Transmit URL"
 - Enter the ServiceMix Username and Password
 - Also on this page, note the Receive-Api Key required to configure the Cloud Engine

2. Add/Maintain a Catalog of Items
Create Application and Add
 - Navigate to Store>Products>Add a Product
 - Choose "Create Application" or choose the type of item you are adding to the catalog
 - Enter the specifics for the Application Product
    - Enter a unique Product SKU
    - Enter the title of the application catalog
    - Enter the price
    - Click on "Active" for status
    - Select the size of your product
    - Choose the server type of the project
    - Choose a server size
    - Choose a CPU
    - Choose the size of RAM memory
    - Choose the OS
    - Choose the Networking option
    - Choose the Elasticity option
    - Choose the Storage option
 - Click "Save Product"
 - Confirm the product was added
    - Navigate to Store>Products
    - Locate and confirm the product was added to the store

 - Navigate to Content>Add Content>Product
 - Enter the Product Name
 - Enter a Description for the product
 - Click "Choose File" and upload an image for the product
 - Click "Add Existing Product"
   - In the product field, enter the SKU for the item you created
   - Click "Add Product"
 - Click "Save"
 - Visit the Marketplace Catalog and confirm the product you added is located in the catalog

3. Create a Form Email Configuration
 - Navigate to Configuration > Workflow > Rules
 - On the Rules page, under Active Rules, locate the rules titled "Email when project_req set to Approved"
   - Click on the rule to edit
 - In the rule editing screen, locate the Actions elements table and click the "+Add Action" button
 - On the Add a New Action page, click on the dropdown menu to add a variable
   - Locate "Send Mail" from the System block and click on it
 - On the Add a New Action page, add the following attributes:
    - Recipient's email
    - Subject of the email (add the following indentifier at the end of the  email to add the project add code [node:field-app-code]
    - Add the body of the email
    - Click Save

4. Update CRON Job Run Frequency
 - On the administrative toolbar on the top of the page, navigate to Configuration>System>Cron Settings>Settings
 - On the Settings page, under "Single Job Settings," locate the job called "bah_order_com_cron," and adjust to your desired schedule
 - Click Save.  If the changes are successful, a confirmation message will appear at the top of the screen. If you do not see this message, refresh the page, check "bah_order_com_cron," and try again.

5. LDAP Configuration
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
    - This tab allows for Active Directory Security Groups to be mapped to roles and organic groups defines within Drupal and providing role Based Access to the marketplace
 - Project Configuration
    - When a new project has been requested, the marketplace must be updated to include the project APP code and the funding amount available for the project. This creation will allow associated users to access funds and the rights to provision the environment. Navigate to Content > Add Content > Project to create a new project and populate the appropriate title, organic group credits, and application code information.

6. Updating FAQs
 - In the toolbar, navigate to Content
 - Select "FAQ" from the Type drop down menu and click Filter
 - Click "+ Add Content" anc click on FAQ
 - Create an FAQ by filling in the question and response fields and then click Save

7. Adding Items to the Catalog

###Configuring the Cloud Engine
1. Use your favorite command-line accessible text editor to edit the Cloud Engine configruration file:
>/opt/cloudengine/servicemix/etc/com.bah.cloudengine.cfg

2. Make the following changes to the file, then write+exit:
 - Insert the Cloud Portal, Engine, or Gateway IP addresses where they are referenced
 - Set "marketplace.restKey" to the Receive-API Key from the Broker Order Communications Page in the Cloud Portal

3. Restart the Cloud Engine
```Bash
service servicemix-service restart
```

###Configuring the Cloud Gateway
1. Adding Providers
 - Cloud Providers
    - Navigate to Clouds>Providers
    - Click on the Configuration drop down menu, and select "+ add a New Cloud Provider"
    - In the Basic Information section, add a name, select a provider type from the drop down menu, and fill in corresponding fields
    - In the Credentials section, enter your security information for the provider you selected
    - Click Validate
    - Click Add

 - Infrstructure Providers
    - Navigate to Infrastructure>Providers
    - Click on the Configuration drop down menu, and select "+ add a New Infrastructure Provider"
    - In the Basic Information section, add a name, select a provider type from the drop down menu, and fill in corresponding fields
    - In the Credentials section, enter your security information for the provider you selected
    - Click Validate
    - Click Add
2. Adding Catalog Items
 - Navigate to Services>Catalogs
 - Click on the Catalog Items accordion tab
 - Click on the Configuration drop down menu, and select "+ add a New Catalog Item"
 - Select a Catalog Item Type from the drop down menu
 - In the Basic Info section, fill in the item name and description. If you would like to assign the item to a catalog, check with "Display in Catalog" box, and fill in the required information.
 - Go to the Request Info section. Navigate through each sub-tab, and fill in the information required by the provider (at a minimum, field names marked with an asterick are required)
 - Click Add
3. Configuring Script to Update Cloud Engine
 - Navigate to Automate>Explorer
 - Click on the Datastore folder
    - Select "Add a New Domain" from the Configuration drop down menu
    - Enter "BAH" for the Name
    - Enter "Booz Allen Hamilton Customization" for the Description
    - Check enabled
    - Click Save
 - Navigate to ManageIQ>Service>Provisioning>StatsMachines>Methods
 - Select the Instances tab
    - Select "Add a New Instance" from the Configuration drop down menu
    - Enter "update_servicemix_and_chef" for the Name and the Display Name
    - Go to the Fields section
      - Find "execute" under the Name column
      - Enter update_servicemix_and_chef for the Value
      - Click Add
 - Navigate to ManageIQ>Service>Provisioning>StateMachines>Methods
 - Select the Methods tab
    - Click on Configuration -> Add a New Method
    - Enter update_servicemix_and_chef for the Name
    - Enter update_servicemix_and_chef for the Display Name
    - For the Location, select inline
    - Under Data, paste the code from [update_servicemix_and_chef code link]
    - Click Add
 - Navigate to ManageIQ>Service>Provisioning>StateMachines>ServiceProvision_Template>CatalogItemInitialization
    - Click on Configuration -> Copy this Instance
    - For the To Domain value, select BAH from the drop down list
    - Check the Copy to same path
    - Click Copy
 - Navigate to ManageIQ>Service>Provisioning>StateMachines>ServiceProvision_Template>CatalogItemInitialization
    - Select "Edit this Instance" in the Configuration drop down menu
    - Go to the Fields section
    - Under the Name column, find post1
    - For the Value, enter /Service/Provisioning/StateMachines/Methods/update_servicemix_and_chef
    - Click Save
 - Create a new catalof item or select an existing one
 - For the Provisioning Entry Point, set the value to /BAH/Service/Provisioning/StateMachines/ServiceProvision_Template/CatalogItemInitialization


## Requirements
Jellyfish is built using three virtual machines for the three promary components. At a minimum, the cloud broker requires the following hardware, operating systems, and communications settings to support the suite of open source products.

**Cloud Portal Requirements**

| Component          |Cloud Portal                                      |
| --------           |:------------                                    |
| Operating System   | RHEL 6.5 ot CentOS 6.5                           |
| Memory             | 8 BG                                             |    
| CPU                | 2                                                |
| Disk               | 100 GB                                           |
| TCP Ports          | 22,80,443,8181                                   |
| UDP Ports          |                                                  |
| Network Access     | Public facing and access to broker services (8183)  |

**Cloud Engine Requirements**

| Component          |Cloud Engine                                      |
| --------           |:------------                                    |
| Operating System   | RHEL 6.5 ot CentOS 6.5                           |
| Memory             | 8 BG                                             |    
| CPU                | 2                                                |
| Disk               | 50 GB                                            |
| TCP Ports          | 22,8180,8181,8182,8183,8080,61616                |
| UDP Ports          | 61616                                            |
| Network Access     | Access to broker services (8180,8181,8182,8080,61616)      |

**Cloud Gateway Requirements**

| Component          |Cloud Gateway                                      |
| --------           |:------------                                    |
| Operating System   | RHEL 6.5 ot CentOS 6.5                           |
| Memory             | 8 BG                                             |    
| CPU                | 2                                                |
| Disk               | 80 GB                                            |
| TCP Ports          | 22,443,80                                        |
| UDP Ports          |                                                  |
| Network Access     | Access to cloud providers and broker services (443,8183)   |



## License

Booz Allen Hamilton’s Project Jellyfish Release 1 will be comprised of three primary modules:  Gateway (ManageIQ), Engine (Apache Service Mix) and Marketplace (Drupal).  Except where otherwise noted, all Project Jellyfish source files are licensed under the GNU General Public License, version 2 or later. That means you are free to download, reuse, modify, and distribute any files hosted in Project Jellyfish’s Git repositories under the terms of either the GPL version 2 (or later) in combination with any code with any license that is compatible with either versions 2 or 3, plus the licenses associated with other open source components of Project Jellyfish (e.g., Apache 2.0 and GPLv2 for ManageIQ). Detailed license files can be found in each repo, but at a high level, the licensing models for Release 1 are as follows: the Marketplace is licensed under GPLv2; the Engine is licensed under a combination of several license models (e.g., GPLv2, Apache2, LGPL2.1, and CDDL 1.1); and the Gateway is licensed under Apache 2.0 and GPL.

See [LICENSE.txt](LICENSE.txt)

## Export Notice

See [EXPORTNOTICE.txt](EXPORTNOTICE.txt)
