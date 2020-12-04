# Linux Commands

## Basics
### Check ubuntu version
> lsb_release -a


## Find 
## find directories recursively with given name is current directory and delete them
> find . type d -name ".git*" -exec rm -rf {} +  OR
> find . type d -name ".git*" | xargs rm -rf 