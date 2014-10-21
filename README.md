#Official Release October 20, 2014

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

###Configuring the Cloud Engine
1. Use your favorite command-line accessible text editor to edit the Cloud Engine configruration file:
>/opt/cloudengine/servicemix/etc/com.bah.cloudengine.cfg

2. Make the following changes to the file, then write+exit:
 - Insert the Cloud Portal, Engine, or Gateway IP addresses where they are referenced
 - Set "marketplace.restKey" to the Receive-API Key from the Broker Order Communications Page in the Cloud Portal

3. Restart the Cloud Engine
>service servicemix-service restart

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
3. Configuring Chef

## Learn more

Coming Soon

## List of our Repos

 - Cloud Engine
 - ManageIQ
 - Marketplace
 - Cookbooks
 - ?
 - ??

## License

Booz Allen Hamilton’s Project Jellyfish Release 1 will be comprised of three primary modules:  Gateway (ManageIQ), Engine (Apache Service Mix) and Marketplace (Drupal).  Except where otherwise noted, all Project Jellyfish source files are licensed under the GNU General Public License, version 2 or later. That means you are free to download, reuse, modify, and distribute any files hosted in Project Jellyfish’s Git repositories under the terms of either the GPL version 2 (or later) in combination with any code with any license that is compatible with either versions 2 or 3, plus the licenses associated with other open source components of Project Jellyfish (e.g., Apache 2.0 and GPLv2 for ManageIQ). Detailed license files can be found in each repo, but at a high level, the licensing models for Release 1 are as follows: the Marketplace is licensed under GPLv2; the Engine is licensed under a combination of several license models (e.g., GPLv2, Apache2, LGPL2.1, and CDDL 1.1); and the Gateway is licensed under Apache 2.0 and GPL.

See [LICENSE.txt](LICENSE.txt)

## Export Notice

See [EXPORTNOTICE.txt](EXPORTNOTICE.txt)
