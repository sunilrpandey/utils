# Linux Commands

## Basics
### Check ubuntu version
> lsb_release -a


## Find 
## find directories recursively with given name is current directory and delete them
> find . type d -name ".git*" -exec rm -rf {} +  OR
> find . type d -name ".git*" | xargs rm -rf 

# set default python to python3 
Add below line to ~/.bashrc
```sh
alias python=python3
```
to see commands specific to python27, e.g. to get version of python 2 prefix python with command
```sh
$ command python --version
```
