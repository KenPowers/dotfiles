#!/usr/bin/env zsh
curl https://sh.rustup.rs -sSf | sh -s -- -y

CARGO="$HOME/.cargo/bin/cargo"
RUSTUP="$HOME/.cargo/bin/rustup"

crates=(
  bat         # A cat clone with wings
  cargo-edit  # Add, remove, and upgrade cargo dependencies from the command line
  cargo-watch # Watch for file changes and run cargo commands
  hexyl       # A command-line hex viewer
  hyperfine   # A command-line benchmarking tool
  racer       # Code completion for rust
)

$CARGO add component rust-src
$CARGO install "${crates[@]///}"
