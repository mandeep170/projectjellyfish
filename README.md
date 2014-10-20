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
/opt/cloudengine/servicemix/etc/com.bah.cloudengine.cfg

2. Make the following changes to the file, then write+exit:
 - Insert the Cloud Portal, Engine, or Gateway IP addresses where they are referenced
 - Set "marketplace.restKey" to the Receive-API Key from the Broker Order Communications Page in the Cloud Portal

3. Restart the Cloud Engine
>service servicemix-service restart

###Configuring the Cloud Portal
1. Configure Communications
 - Go to http://CLOUD_GATEWAY_IP/admin/commerce/bah-order-com
 - Enter http://CLOUD_ENGINE_IP:8183/orders/create/ in "Transmit URL"
 - Also on this page, note the Receive-Api Key required to configure the Cloud Engine
2. Add Catalog Items
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
