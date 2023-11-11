sh <(curl -L https://nixos.org/nix/install) --daemon

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

nix build --extra-experimental-features "nix-command flakes" .\#darwinConfigurations.<hostname>.system

./result/sw/bin/darwin-rebuild switch --flake .

