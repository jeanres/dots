## Install Nix

```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

## Install Homebrew

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Build Nix

```
nix build --extra-experimental-features "nix-command flakes" .\#darwinConfigurations.<hostname>.system
```

## Build Nix Darwin

```
./result/sw/bin/darwin-rebuild switch --flake .
```

## What it looks like



