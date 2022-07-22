# RustViz Tutorial

This repo contains an introductory Rust tutorial which contains visualizations
generated with [RustViz](https://github.com/fplab/rustviz). It is intended to be
used in the Rust unit in EECS 490 at the University of Michigan.

## Usage
### Copying Code Examples Using `copy_assets.sh`
To easily copy over code examples from the rustviz repo, you can run
`copy_assets.sh`. This will copy the source code and SVGs from the
`svg_generator/examples` directory in the rustviz repo to the
`src/assets/code_examples` directory in this repo. Some things to note:
- The script should only be run from the `rustviz-tutorial` directory.
- `rustviz-tutorial` and `rustviz` must have the same parent directory for the
script to work.
- The script will overwrite any existing files with the same name.
- This script doesn't actually run the svg_generator. It simply copies existing
files. You should run the svg generator examples first. 

### Building the Book
1. Install mdbook using `cargo install mdbook`
2. Navigate to the `rustviz-tutorial` directory and run `mdbook build`
3. Navigate to the `rustviz-tutorial/book` directory and run
`python3 -m http.server`. You should be able to view the tutorial in your
browser at http://localhost:8000/