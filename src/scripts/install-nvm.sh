# Only install nvm if it's not already installed
if command -v nvm &> /dev/null; then
    echo "nvm is already installed. Skipping nvm install.";
else
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash;
    echo 'export NVM_DIR="$HOME/.nvm"' >> $BASH_ENV;
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $BASH_ENV;
    source $BASH_ENV;
fi

if [ "$NODE_PARAM_LTS" = "1" ]; then
    nvm install --lts
else
    nvm install "$NODE_PARAM_VERSION"
    nvm alias default "$NODE_PARAM_VERSION"
    echo 'nvm use default &>/dev/null' >> $BASH_ENV
fi
