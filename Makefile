all: brew_install brew_bundle rbenv_plugins

brew_install:
	if [ -s /usr/local/bin/brew ]; \
	then { echo "brew already installed, skipping..."; } \
	else { ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"; } \
	fi

brew_bundle:
	brew update
	brew bundle

rbenv_plugins:
	if [ -d ~/.rbenv/plugins ]; \
	then \
	  echo "rbenv plugins already present, skipping..."; \
	else \
	  mkdir ~/.rbenv/plugins; \
	  cd ~/.rbenv/plugins; \
	  git clone https://github.com/sstephenson/rbenv-gem-rehash.git; \
	  git clone https://github.com/sstephenson/ruby-build.git; \
	fi
