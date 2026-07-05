exclude-nix-files := ('.tack/default.nix')

format:
    nix run -f default.nix formatter

lint:
    deadnix --exclude {{exclude-nix-files}} --fail .
    statix check -i {{exclude-nix-files}} .
