# JuypterLab Notebook Engine Basics


## GOAL: launch the juypter-lab environment.

### Procedure:

#### Step 1 -  ssh into your node:
```
ssh -A -l root gpn-workshop-node###.gpn.lan
```
#### Step 2 - Clone the repo
```
git clone https://github.com:GreatPlainsNetwork/20180601-FIONAworkshop.git
```
#### Step 3 - copy out the latest start-juypter.sh script out of the git repo:
```
cp 20180601-FIONAworkshop/misc/start-juypter.sh .
```
#### Step 4 -  Make it executable and launch juypterlab via the start-juypter script:
```
chmod u+x start-juypter.sh
./start-juypter.sh
```

#### Final Step - Open the tokenized URL via the provide link from the output.


#### Full working example from the ssh login to a running juypterlab:
```
[robbg@cupcake ~]$ ssh -A -l root gpn-workshop-node13.gpn.lan 
Last login: Sun May 20 21:41:20 2018 from cupcake.gpn.lan
Installed by Razor using Red Hat Enterprise Linux 6 - CentOS 7 Installer
Repo: http://web.gpn.lan/centos/7.5.1804/os/x86_64/
Node: http://razor.gpn.lan:8150/api/nodes/13
Install log: /var/log/razor.log
[root@gpn-workshop-node13 ~]# cp 20180601-FIONAworkshop/misc/start-juypter.sh .
[root@gpn-workshop-node13 ~]# ./start-juypter.sh 
crack open firewall...
success
load up juypter lab
[I 21:41:46.497 LabApp] Writing notebook server cookie secret to /run/user/0/jupyter/notebook_cookie_secret
[I 21:41:47.575 LabApp] JupyterLab beta preview extension loaded from /usr/lib/python3.4/site-packages/jupyterlab
[I 21:41:47.576 LabApp] JupyterLab application directory is /usr/share/jupyter/lab
[W 21:41:47.591 LabApp] JupyterLab server extension not enabled, manually loading...
[I 21:41:47.594 LabApp] JupyterLab beta preview extension loaded from /usr/lib/python3.4/site-packages/jupyterlab
[I 21:41:47.594 LabApp] JupyterLab application directory is /usr/share/jupyter/lab
[I 21:41:47.603 LabApp] Serving notebooks from local directory: /root
[I 21:41:47.604 LabApp] 0 active kernels
[I 21:41:47.604 LabApp] The Jupyter Notebook is running at:
[I 21:41:47.604 LabApp] http://gpn-workshop-node13.gpn.lan:8888/?token=6dd53644cbb39b52450ee248fded45c815b146852a728670
[I 21:41:47.604 LabApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 21:41:47.606 LabApp] 
Copy/paste this URL into your browser when you connect for the first time,
to login with a token:
http://gpn-workshop-node13.gpn.lan:8888/?token=6dd53644cbb39b52450ee248fded45c815b146852a728670&token=6dd53644cbb39b52450ee248fded45c815b146852a728670
```

