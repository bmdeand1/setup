configure-docker:
	gcloud auth configure-docker

configure-dotfiles:
	echo 'Configure dotfiles...'
	cp ~/Projects/setup/.dotfiles/.zshrc ~
	cp ~/Projects/setup/.dotfiles/.gitconfig ~

configure-gcp-sdk:
	echo 'Configuring GCP SDK'
	gcloud init 
	gcloud auth application-default login

install: install-brew install-brew-packages install-oh-my-zsh install-gcloud

install-brew:
	echo ‘Installing Brew…’
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh -o /tmp/install-brew.sh
	bash /tmp/install-brew.sh
	rm /tmp/install-brew.sh

install-brew-packages:
	echo 'Installing Brew packages...'
	brew bundle

install-gcloud:
	echo 'Installing kubectl, cbt...'
	gcloud components update
	gcloud components install kubectl
	gcloud components install cbt
	gcloud components install bq

install-oh-my-zsh:
ifneq ($(wildcard ~/.oh-my-zsh/.*),)
	@echo "Oh My Zsh is already installed"
else
	echo 'Installing Oh My Zsh...'
	curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o /tmp/install-oh-my-zsh.sh;
	sh /tmp/install-oh-my-zsh.sh
	rm /tmp/install-oh-my-zsh.sh
	chsh -s /usr/bin/zsh
endif

setup: install configure-dotfiles configure-gcp-sdk configure-docker