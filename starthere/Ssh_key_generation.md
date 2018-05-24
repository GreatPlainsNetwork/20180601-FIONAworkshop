/*
  Title: Generate A SSH Keypair
  Sort: 0
*/  

> SSH Keypairs are a simple and secure way to access a Linux server. An SSH keypair contains a private key and a public key. You will keep your private key to on your computer or external media. The public key you will need to provide to the remote server using standard password exchange. 


### Generate your keys and copy them to the nodes.

On the computer you want to use to access a workshop node, open your favorite terminal app. Then type the following command:  

```
ssh-keygen
```

Make sure you:

- use the default location (~/.ssh/id_rsa)
- use a strong passphrase (required / highly recomended!)

  

```
Generating public/private RSA key pair.
Enter file in which to save the key (/home/<your_user_name_here>/.ssh/id_rsa):
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /home/<your_user_name_here>/.ssh/id_rsa.
Your public key has been saved in /home/<your_user_name_here>/.ssh/id_rsa.pub.
The key fingerprint is:
25:67:55:1a:4e:ab:71:cc:5c:81:67:45:f5:72:79:e0 <your_user_name_here>@<your_computer_name_here>
The key's randomart image is:
+--[ RSA 2048]----+
|            +o=+=|
|           B.*o.o|
|        . = OoE.+|
|         = +   o.|
|        S .      |
|                 |
|                 |
|                 |
|                 |
+-----------------+
```

<br>
> **Note**
> 
> Your fingerprint, randomart image, and key will be different from the example. 
> The randomart image is not your key. Its purpose is to rapidly identify different keys.



After you generate your key you will need to copy *public* key to your assigned lab node via the command:  

```
ssh-copy-id root@gpn-workshop-node##.gpn.lan
```

Example output:

```
[user@machine ~]$ ssh-copy-id root@gpn-workshop-node13.gpn.lan
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
Password: 

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'root@gpn-workshop-node13.gpn.lan'"
and check to make sure that only the key(s) you wanted were added.

```


To peek at your public key:


```
cat ~/.ssh/id_rsa.pub
```

The output will be simiplar to:  

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC7iKBE2qsnnR+mguxvvKNyj/IJchBjba4QD39BGMCCvytPxFOoN9h2WbeIg1cUSpv7sb6STGcrCXnSrthM4fuasFM/KXELnJobq0JBEd6pld72jhBVHzObomrsktGSThO3JqSgE2O0elxcfT/0dSn/6t+GY/HvkcgdFnenfW3oHTOdAyWgHXe/0aWSuq60DhLfJGp8mM1NIxjagd9s/OLByOSV7GxwUCNl+OD/CsaLkGgrB6jonf01cjfaFYh4iYcBX5s7lZuBCSpFY1+KqeE8ZZ8kqDdMqgYOmw2SxFpST1iaC9wmL9N4J4XmKFraKFkfNsVyixSvLPhJEJCEetzh <your_user_name_here>@<your_computer_name_here>
```

It is recommended that you make a back-up copy of your pass-phrase protected SSH keypair to external media.


