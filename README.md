# docker-rust-armv7hf

This repository is used to build a Docker image for the Rust programming language and a few supporting tools for the armv7hf architecture, used by the popular Raspberry Pi 3 computer. The image includes `rustc`, `rustdoc`, `cargo`, `git`, SSL certificates, and build essentials, so it should be able to run `cargo build` on most projects out of the box. The path `/source` is a volume where you can mount a Cargo project from the host machine.

For an x86_64 version of this image, see https://github.com/jimmycuadra/docker-rust.

## Usage

The following command will drop you into a Bash shell with the current directory on the host shared. From there you can run `rustc`, `rustdoc`, and `cargo` as you please.

``` bash
docker run -it --rm -v $(pwd):/source jimmycuadra/rust
```
