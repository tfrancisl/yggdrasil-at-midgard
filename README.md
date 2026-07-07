# yggdrasil

Nix code defining my Pi 4 server, hosted privately on my home network.

### Using Nix(OS) on the Pi

The [SD card images](https://hydra.nixos.org/job/nixos/unstable/nixos.sd_image.aarch64-linux) 
and the derivations to build them are critical. So long as you can install 
NixOS, you can begin defining the system with nix code. Future work for 
this repo will likely involve switching to [finix](https://github.com/finix-community/finix), 
including implementing the OS image for the Pi.


### System Architecture

I am making use of systemd-nspawn containers, provided through the 
[`containers`](https://search.nixos.org/options?channel=26.05&query=containers#show=option%253Acontainers) 
option in NixOS. These containers are easy to setup and are defined with
their own NixOS config.

The host is running ssh so that I can access the system and deploy this
config to it. Any services I define beyond ssh will be implemented as
NixOS containers. The sole [current example is pihole](./containers/pihole).
Some of the requirements for any given container are actually host system
config options, so those will go in `host.nix`, and the containers config
will go in `guest.nix`.


### Services

- ssh (remote system access)
- pihole (DNS and web filtering)


#### Ideas for other services

- gitea for local mirrors of remotes
