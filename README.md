<div align="center">

# Snig

[<img src="https://github.com/user-attachments/assets/13920bf0-bb56-4bdd-a994-674a3b473860" width="200" alt="Snig logo">](https://github.com/grimerssy/snig)

**Snig** _/snʲiɦ/_, Ukrainian for "snow" – a great find while looking for flakes.

</div>

<br/>

A collection of [Nix](https://nixos.org) flake utilities designed to streamline
the development workflow and provide a consistent, reproducible setup across
different machines.

## Modules

This flake exposes the following types of modules:

- [nix-darwin](https://github.com/nix-darwin/nix-darwin) options and configurations
- [Home Manager](https://github.com/nix-community/home-manager) options and configurations

### Options

*Option modules* are what you'd typically call a module in the Nix ecosystem.
They don't change your configuration; instead, they make more options available.

You can use them by adding `snig.<type>Modules.default` to your `imports`.

For example, to use the Home Manager options, you'd import them in a Home
Manager module:

```nix
{ inputs, ... }:
{
  imports = [ inputs.snig.homeManagerModules.default ];
}
```

### Configurations

This flake also exports *Configuration modules*, which provide opinionated
configurations for available options.
Defined values are subject to change in newer revisions and can be selectively
overridden with `lib.mkForce`.

> [!IMPORTANT]
> Configurations may set options defined in this flake.
> Make sure to also import options before using configuration.

It's encouraged *not* to bulk import available configurations.
Instead, selectively use them in your own setup.

For example, if you want to use the Git configuration but not Delta for syntax
highlighting, your Home Manager module would look like this:

```nix
{ lib, inputs, ... }:
{
  imports = [ inputs.snig.homeManagerModules.configurations.git ];
  programs.git.delta.enable = lib.mkForce false;
}
```
