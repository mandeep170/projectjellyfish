#Official Release October 20, 2014

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

5. Install the Marketplace, ServiceMix, or ManageIQ cookbook
>[root@server ~/chef-repo]# knife cookbook site install bah-marketplace
>
or
>
>[root@server ~/chef-repo]# knife cookbook site install servicemix
>
or
>
>[root@server ~/chef-repo]# knife cookbook site install manageiq

6. Run Chef-solo (this could take up to 10 or 15 minutes)
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/bahmarketplace.json
>
>or
>
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/servicemix.json
>
>or
>
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/manageiq.json
>
>Chef Client finished

###Configuring the Cloud Engine
1. Use your favorite command-line accessible text editor to edit the Cloud Engine configruration file:
>/opt/cloudengine/servicemix/etc/com.bah.cloudengine.cfg

2. Make the following changes to the file, then write+exit:
 - Insert the Cloud Portal, Engine, or Gateway IP addresses where they are referenced
 - Set "marketplace.restKey" to the Receive-API Key from the Broker Order Communications Page in the Cloud Portal

3. Restart the Cloud Engine
>service servicemix-service restart

###Configuring the Cloud Portal
1. Configure Communications
 - Go to http://CLOUD_GATEWAY_IP/admin/commerce/bah-order-com
 - Enter http://CLOUD_ENGINE_IP:8183/orders/create/ in "Transmit URL"
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
    - Navigate to Store > Products
    - Locate and confirm the product was added to the store

 - Navigate to Content > Add Content > Product
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
 - On the administrative toolbar on the top of the page, navigate to Configuration > System > Cron Settings > Settings
 - On the Settings page, under "Single Job Settings," locate the job called "bah_order_com_cron," and adjust to your desired schedule
 - Click Save.  If the changes are successful, a confirmation message will appear at the top of the screen. If you do not see this message, refresh the page, check "bah_order_com_cron," and try again.

5. LDAP Configuration
 - Navigate to Configuration > People > LDAP Configuration
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

###Configuring the Cloud Gateway
1. Adding templates to ManageIQ
2. 

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

See [LICENSE.txt](LICENSE.txt)

## Export Notice

See [EXPORTNOTICE.txt](EXPORTNOTICE.txt)
