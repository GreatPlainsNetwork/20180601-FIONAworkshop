# Clone out this repo to your local workstation and node.

##  GOAL: get a full clone of the notes, documents, images and labs from this workshop

### Workstation Procedure:

#### Step 1 - Change to a directory as a landing zone.
```
cd ~/Documents/GPN-Workshop/
```
#### Step 2 - Clone the repo
```
git clone git@github.com:GreatPlainsNetwork/20180601-FIONAworkshop.git
```
#### Step 3 - Enjoy and improve the repo
```
git checkout -b newlab
cd labs
vim an_amazing_lab.md
git status
git add .
git commit -m 'useful notes here'
git push origin newlab
```


# Clone this repo to your FIONette Node

#### Step 1 - ssh into your node
```
ssh -A -l root gpn-workshop-node13.gpn.lan
```

#### Step 2 - Clone the repo
```
git clone git@github.com:GreatPlainsNetwork/20180601-FIONAworkshop.git
```

#### Step 3 - Update your .gitconfig
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
```

#### Step 4 - Enjoy and improve the repo
```
git checkout -b newlab
cd labs
vim an_amazing_lab.md
git status
git add .
git commit -m 'useful notes here'
git push origin newlab
```

