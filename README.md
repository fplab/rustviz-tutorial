# Design Your Rustviz tutorial 

RustViz is a tool that generates interactive visualizations from simple Rust programs to assist users in better understanding the Rust Lifetime and Borrowing mechanism.

RustViz is a project of the Future of Programming Lab at the University of Michigan. 

Check out fplab's [rustviz tutorial](https://fplab.github.io/rustviz-tutorial/).

# Installation to create a new tutorial book:

First Install mdbook.
```
cargo install mdbook
```

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

iii. Provide annotated_source.rs that renders the visual feature of variables, and save it in a separate folder called input inside current folder.

```
# annotated_source.rs

fn main() {
    let <tspan data-hash="1">x</tspan> = 5;
    let <tspan data-hash="2">y</tspan> = <tspan data-hash="1">x</tspan>;
}
```

iv. Lastly, put the source.rs in input folder, and main.rs remains in the curent folder, then run follwoing to generate the svg files: vis_code.svg and vis_timeline.svg. Run:
```
cargo run path/to/folder
```

![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_code.svg)


![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_timeline.svg)
  
> Note: make sure folder svg_generator is in the same folder as you are running the code 


Now your folder for one example should look like this:
```
Your Parent folder
├── input
│   └── annotated_source.rs
    └── source.rs
├── main.rs
├── vis_code.svg
└── vis_timeline.svg
```
 
# Include the examples in your book

 To start writing your own book, first navigate to SUMAARY.md in folder build_book/src. SUMMARY is the directory of the book that display all the chapters, and redirect to the files for chapters when rendering. Indicate different chapters/sub-chapters by including their corresponding markdown file names in SUMMARY.md. 

```
# Summary

- [My First Chapter](chapter_1.md)
- [Nested example](nested/README.md)
    - [Sub-chapter](nested/sub-chapter.md)
```

To include one svg file, refer to it by:

```
<object type="image/svg+xml" class="YOUR_EXAMPLE code_panel" data="YOUR_SVG.svg"></object>
```

An example is done for creating a new example in My First Chapter, source code are contained in the chapter_1.md.

> Note: Additional mouse hovering feature and nested chapters  also included

More SVG rendering feature could be found [here](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Getting_Started).


# Build your book

Finally, build your own mdbook, then check out the book at http://localhost:3000/
```
mdbook build 
mdbook serve -p 3000
```
