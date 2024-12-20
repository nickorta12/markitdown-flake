# MarkItDown Flake

Simple flake to run the [MarkItDown](https://github.com/microsoft/markitdown) tool.

## Usage

In your flake.nix inputs section:

```nix
inputs = {
  markitdown = {
    url = "github:nickorta12/markitdown-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };
};
```

Somewhere in your nixos config:

```nix
{inputs, ...}: {
  environment.systemPackages = [
    inputs.markitdown.packages.x86_64-linux.markitdown
  ];
}
```
