# Clone out this repo to your local workstation and node.

##  GOAL: get a full clone of the notes, documents, images and labs from this workshop

# Clone this repo to your FIONette Node

#### Step 1 - ssh into your node
```
ssh -A -l root gpn-workshop-node13.gpn.lan
```

#### Step 2 - Clone the repo
```
git clone https://github.com:GreatPlainsNetwork/20180601-FIONAworkshop.git
```

#### Step 3 - Update your .gitconfig
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

#### Step 4 - (OPTIONAL) Enjoy and improve the repo with git pull requests
```
git checkout -b newlab
cd labs
vim an_amazing_lab.md
git status
git add .
git commit -m 'useful notes here'
git push origin newlab
```


## Workstation Procedure:

#### Step 1 - Change to a directory as a landing zone.
```
mkdir -p ~/Documents/GPN-Workshop/
cd ~/Documents/GPN-Workshop/
```
#### Step 2 - Clone the repo
```
git clone https://github.com/GreatPlainsNetwork/20180601-FIONAworkshop.git
```
#### Step 3 (OPTIONAL) - Enjoy and improve the repo with pull requests
```
git checkout -b newlab
cd labs
vim an_amazing_lab.md
git status
git add .
git commit -m 'useful notes here'
git push origin newlab
```



