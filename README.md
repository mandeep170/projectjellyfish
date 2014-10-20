#Official Release October 20, 2014

## Get Started
1. Log in to your Cloud Portal VM as the root user
>ssh root@<ip-address> -i server-cert-key.pem
2. Update Vm and install telnet, wget, and unzip and dependencies
>[root@server ~]# yum update –y
>[root@server ~]# yum install -y vim telnet unzip wget git
3. Go to http://gettingstartedwithchef.com/first-steps-with-chef.html and follow the instructions to install Chef on your VM.
>Thank you for installing Chef!
4. Using the instructions on http://gettingstartedwithchef.com/first-steps-with-chef.html, create a cookbook.
5. Install the Marketplace cookbook
>[root@server ~/chef-repo]# knife cookbook site install bah-marketplace
6. Run Chef-solo (this could take up to 10 or 15 minutes)
>[root@server ~/chef-repo]# chef-solo –c solo.rb –j roles/bahmarketplace.json
>
>Chef Client finished


###Installing the Cloud Portal

>sdfnlewajf
>dfnrefnreoia


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
