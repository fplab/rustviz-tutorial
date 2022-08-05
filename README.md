# Design Your Rustviz tutorial 

RustViz is a tool that generates interactive visualizations from simple Rust programs to assist users in better understanding the Rust Lifetime and Borrowing mechanism.

RustViz is a project of the Future of Programming Lab at the University of Michigan. 

Check out fplab's [rustviz tutorial](https://fplab.github.io/rustviz-tutorial/).

# Installation to create a new tutorial book:

Creeating a new book requires [Rust](https://www.rust-lang.org/), [Cargo](https://doc.rust-lang.org/cargo/getting-started/installation.html) and [mdbook](https://github.com/rust-lang/mdBook) to be installed.

## From Source
1. Clone the branch user_designed_book of this repo and have an empty book with some sample code. 

```
git clone -b user_designed_book https://github.com/fplab/rustviz-tutorial.git
```


# Steps to create a visualization example:

Rustviz generate svg files, given annotated rust code, for visualization.

i. Write your source code in Rust (Source.rs). For example，in a file source.rs:
```
# source.rs

fn main() {
    let x = 5;
    let y = x;
}
```

ii. Annotate the source code for visualization generation in main.rs according to the Table I. in the paper. [RustViz: Interactively Visualizing Ownership and Borrowing](https://web.eecs.umich.edu/~comar/rustviz-hatra20.pdf) i.e  specify that event in comment 

```
# main.rs

/* --- BEGIN Variable Definitions ---
Owner x; Owner y
--- END Variable Definitions --- */
fn main() {
    let x = 5; // !{ Bind(x) }
    let y = x; // !{ Copy(x->y) }
} /* !{
    GoOutOfScope(x),
    GoOutOfScope(y)
} */
```

iii. Provide annotated_source.rs that renders the visual feature of variables.
In other words, set the color of your variables by setting different values to data-hash. Simple example below sets variable x and y to two different colors.
```
# annotated_source.rs

fn main() {
    let <tspan data-hash="1">x</tspan> = 5;
    let <tspan data-hash="2">y</tspan> = <tspan data-hash="1">x</tspan>;
}
```

iv. Lastly, put the source.rs and annotated_source.rs in a separate folder called input inside your current folder. And main.rs remains in the current folder, then run following to generate and save the svg files in current folder: vis_code.svg and vis_timeline.svg. Run:
```
cargo run path/to/current_folder
```

![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_code.svg)


![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_timeline.svg)
  
> Note: make sure folder svg_generator is in the same folder as where you are when running the code 


Now your folder for one example should look like this:
```
Your Current folder
├── input
│   └── annotated_source.rs
    └── source.rs
├── main.rs
├── vis_code.svg
└── vis_timeline.svg
```
 
Arbitrary input path and output path are also be provided to generate vis_code.svg and vis_timeline.svg in a separate folder. 

```
cargo run i path/to/input_folder o path/to/output_folder
```


# Include the examples in your book

To start writing your own tutorial, navigate to SUMAARY.md in folder build_book/src. SUMMARY is the directory of the book that display all the chapters, and redirect to the files for chapters when rendering. Indicate different chapters/sub-chapters by including their corresponding markdown file in SUMMARY.md. 

Refer to chapter_1.md for content in My First Chapter.
```
# Summary

- [My First Chapter](chapter_1.md)
- [Nested example](nested/README.md)
    - [Sub-chapter](nested/sub-chapter.md)
```

To include one svg file:

```
<object type="image/svg+xml" class="YOUR_EXAMPLE code_panel" data="YOUR_SVG.svg"></object>
```

> Note: Apply mouse hovering feature by proving event name to onmouseenter.

An example is done for creating a new example in chapter_1.md.


More SVG rendering feature could be found [here](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Getting_Started).


# Build your book

Finally, build your own mdbook, then check out the book at http://localhost:3000/

First navigate to build_book folder, then:

```
mdbook build 
mdbook serve -p 3000
```
