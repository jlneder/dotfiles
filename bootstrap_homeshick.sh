#!/bin/bash -ex

# Paste this into ssh
# curl -sL https://gist.github.com/andsens/2913223/raw/bootstrap_homeshick.sh | tar -xzO | /bin/bash -ex
# When forking, you can get the URL from the raw (<>) button.

### Set some command variables depending on whether we are root or not ###
# This assumes you use a debian derivate, replace with yum, pacman etc.
#aptget='sudo apt-get'
chsh='sudo chsh'
if [ `whoami` = 'root' ]; then
	#aptget='apt-get'
	chsh='chsh'
fi

### Install git and some other tools we'd like to use ###
#$aptget update
#$aptget install -y zsh tmux vim git

### Install homeshick ###
git clone git://github.com/andsens/homeshick.git $HOME/.homesick/repos/homeshick
source $HOME/.homesick/repos/homeshick/homeshick.sh

### Trust github ###
mkdir -p .ssh
cat <<EOF >> .ssh/known_hosts
|1|6WX8FDwncDK8tfyfkLLbvyepVRw=|15RHFpHg3GHML7eJqvNL/yVYChI= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
|1|cccEMXs7ur0u/JXs4NQYv4A9Xb8=|Pddv+wa776NKeZ4v1yMn1cZWt4s= ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAq2A7hRGmdnm9tUDbO9IDSwBK6TbQa+PXYPCPy6rbTrTtw7PHkccKrpp0yVhp5HdEIcKr6pLlVDBfOLX9QUsyCOV0wzfjIJNlGEYsdlLJizHhbn2mUjvSAHQqZETYP81eFzLQNnPHt4EVVUh7VfDESU84KezmD5QlWpXLmvU31/yMf+Se8xhHTvKSCZIFImWwoG6mbUoWf9nzpIoaSjB+weqqUUmpaaasXVal72J+UX2B+2RPW3RcT0eOzQgqlJL3RKrTJvdsjE3JEAvGq3lGHSZXy28G3skua2SmVi/w4yCE6gbODqnTWlg7+wC604ydGXA8VJiS5ap43JXiUFFAaQ==
EOF

### Set SSH_AUTH_SOCK etc. ###
eval `ssh-agent -s`

### Deploy private dotfiles ###
#cat > .dotfiles-deploy-key <<EOF
#-----BEGIN RSA PRIVATE KEY-----
#MII.............................................................
#................................................................
#.....................==
#-----END RSA PRIVATE KEY-----
#EOF
#chmod 600 .dotfiles-deploy-key
#ssh-add .dotfiles-deploy-key
#homeshick --batch clone git@github.com:jlneder/dotfiles
#ssh-add -D
#rm .dotfiles-deploy-key

### Clone public repos ###
git clone https://github.com/tarjoilija/zgen.git ~/.zgen
homeshick clone junegunn/vim-plug
homeshick clone jlneder/dotfiles

### Link it all to $HOME ###
homeshick link --force

### Set default shell to your favorite shell ###
$chsh --shell /bin/zsh `whoami`
echo "Log in again to start your proper shell"
