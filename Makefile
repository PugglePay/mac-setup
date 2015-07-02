all: install_brew brew_update git_install rbenv brewdler

install_brew:
	if [ -s /usr/local/bin/brew ]; \
	then { echo "brew already installed, skipping..."; } \
	else { ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; } \
	fi

brew_update:
	brew update

git_install:
	brew install git

rbenv: rbenv_install ruby_build rbenv_gem_rehash

rbenv_install:
	brew install rbenv

ruby_build:
	@if [ -d ~/.rbenv/plugins/ruby-build ]; \
	then \
		echo "ruby-build already present, skipping..."; \
	else \
		mkdir -p ~/.rbenv/plugins; \
		cd ~/.rbenv/plugins; \
		git clone https://github.com/sstephenson/ruby-build.git; \
	fi

rbenv_gem_rehash:
	@if [ -d ~/.rbenv/plugins/rbenv-gem-rehash ]; \
	then \
		echo "rbenv-gem-rehash already present, skipping..."; \
	else \
		mkdir -p ~/.rbenv/plugins; \
		cd ~/.rbenv/plugins; \
		git clone https://github.com/sstephenson/rbenv-gem-rehash.git; \
	fi

brewdler:
	brew tap Homebrew/brewdler
	brewdle install
