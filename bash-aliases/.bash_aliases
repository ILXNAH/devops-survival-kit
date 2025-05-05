
# DevOps Survival Kit - Bash Aliases Template

# WSL Clean all Zone.Identifier files from current dir
alias cleanzone='find . -exec bash -c '''cat "$1:Zone.Identifier" > /dev/null 2>&1 && { echo "Removing Zone.Identifier from $1"; rm "$1:Zone.Identifier"; }''' _ {} \;'

# Ownership & permissions
alias fixowner='sudo chown -R $(whoami):$(whoami) .'
alias fixperms='chmod -R 777 .'

# # Kubernetes aliases
# alias k='kubectl'
# alias kgp='kubectl get pods'
# alias kgs='kubectl get svc'
# alias kgd='kubectl get deployments'
# alias kaf='kubectl apply -f'

# # Minikube shortcut
# alias minisvc='minikube service'

# Cheatsheets
alias linux='cat /home/ilona/devops-survival-kit/cheatsheets/linux-commands.txt'
alias k8s-cheat='cat /home/ilona/devops-survival-kit/cheatsheets/k8s-cheatsheet.txt'

# # Docker clean-up
# alias dockerclean='docker system prune -f'

# # Alias sync - into $(whoami)'s ~/.bashrc
# alias alias-sync='sudo cp ~/.bash_aliases /root/.bash_aliases && echo "Aliases synced from $(whoami) to root."'

