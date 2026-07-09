exclude-nix-files := ('.tack/default.nix')

format:
    treefmt
lint:
    deadnix --exclude {{exclude-nix-files}} --fail .
    statix check -i {{exclude-nix-files}} .
deploy:
    nh os switch \
        --target-host ratatoskr@yggdrasil.midgard.lan \
        --build-host ratatoskr@yggdrasil.midgard.lan \
        --file . nixosConfigurations.yggdrasil
safe-deploy:
    nh os boot \
        --target-host ratatoskr@yggdrasil.midgard.lan \
        --build-host ratatoskr@yggdrasil.midgard.lan \
        --file . nixosConfigurations.yggdrasil
