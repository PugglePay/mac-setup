all: brew_install brew_bundle rbenv_plugins

brew_install:
	if [ -s /usr/local/bin/brew ]; \
	then { echo "brew already installed, skipping..."; } \
	else { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; } \
	fi

brew_bundle:
	brew update
	brew bundle

rbenv_plugins: ruby_build rbenv_gem_rehash

ruby_build:
	if [ -d ~/.rbenv/plugins/ruby-build ]; \
	then \
		echo "ruby-build already present, skipping..."; \
	else \
		mkdir -p ~/.rbenv/plugins; \
		cd ~/.rbenv/plugins; \
		git clone https://github.com/sstephenson/ruby-build.git; \
	fi

rbenv_gem_rehash:
	if [ -d ~/.rbenv/plugins/rbenv-gem-rehash ]; \
	then \
		echo "rbenv-gem-rehash already present, skipping..."; \
	else \
		mkdir -p ~/.rbenv/plugins; \
		cd ~/.rbenv/plugins; \
		git clone https://github.com/sstephenson/rbenv-gem-rehash.git; \
	fi
