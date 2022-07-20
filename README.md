# Customize Rustviz tutorial 

RustViz is a tool that generates interactive visualizations from simple Rust programs to assist users in better understanding the Rust Lifetime and Borrowing mechanism.

RustViz is a project of the Future of Programming Lab at the University of Michigan. 

Check out fplab's [rustviz tutorial](https://fplab.github.io/rustviz-tutorial/).

# Installation to create a new tutrial book:

First Install mdbook.
```
cargo install mdbook
```

## From Source
1. Clone this repo and have an empty book. 

```
git clone https://github.com/fplab/rustviz-tutorial.git
```

# Steps to create an example:

   i. Write source code in Rust (Source.rs). For example，in a file source.rs:

```
fn main() {
    let x = 5;
    let y = x;
}
```
   ii. Annotate the source code for visualization generation according to the Table I. in the paper [RustViz: Interactively Visualizing Ownership and Borrowing](https://web.eecs.umich.edu/~comar/rustviz-hatra20.pdf) i.e  specify that event in comment (main.rs)

```
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

   iii. Put the source.rs and main.rs in the same parent folder, then run rustviz binary to get the svg files: vis_code.svg and vis_timeline.svg. Run
   ```
rustviz path/to/folder
```
![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_code.svg)

![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_timeline.svg)
   
   Note: make sure folder svg_generator is in the current folder when running the code 
   The two svg files will be saved in the current folder.

   iv. Lastly, provide annotated_source.rs (hope to make it automatically generated) that renders the visual feature of variables, and save it in a separate folder called input, under the parent folder
   
   Now your folder for one example should look like this:
```
Your Parent folder
├── input
│   └── annotated_source.rs
├── main.rs
├── source.rs
├── vis_code.svg
└── vis_timeline.svg
```

# Include the examples in your book

First, navigate to SUMAARY.md in folder src. SUMMARY is the directory of the book that could redirect to multiple files when rendering. 

An example is done for creating a new chapter, My First Chapter, where source code are contained in the my-first-chapter.md.

To include one svg file, refer to it by:

```
<object type="image/svg+xml" class="hatra2 code_panel" data="vis_code.svg"></object>
```
   Note: Example of additional mouse hovering feature is also included in the example in My First Chapter.
   
More SVG rendering could be found [here](https://developer.mozilla.org/en-US/docs/Web/SVG/Tutorial/Getting_Started).


# Build your book

Finally, build your mdbook and check out the book at http://localhost:3000/.
```
mdbook build 
mdbook serve -p 3000
```


