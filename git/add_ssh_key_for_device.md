# Add SSH key to github account

## Check if available
Check ssh keys on sysem if available(generally named as  id_rsa.pub, id_rsa)

>ls -al ~/.ssh

if present we can add existing ssh key to ssh-agent or generate the new one

## Generate ssh-key

> ssh-keygen -t rsa -b 4096 -C "your_emailid"

or 

> ssh-keygen -t ed25519 -C "your_emailid"

## Add ssh key(existing or generated one) to ssh-agent

Step 1. Start ssh-agent in background
> eval "$(ssh-agent -s)"

_will output Agent pid <id>_

Step 2. Add key to it
> ssh-add ~/.ssh/id_rsa

Step 3. Add it to your github account

Go to github web(https://github.com/settings/keys), Go to new ssh key and paste in key edit box, also give title for better understanding
> xclip -selection clipboard < ~/.ssh/id_rsa.pub

