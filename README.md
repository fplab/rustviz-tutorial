
## Installation

This is a general process of writing a new book : 

First Install mdbook.
```
cargo install mdbook
```

## From Source
1. Clone this repo and have an empty book. 

```
git clone https://github.com/Serenali-1108/my-first-book.git
```

2. Steps to create an example:

1. Write source code in Rust (Source.rs). For example，in source.rs:

```
fn main() {
    let x = 5;
    let y = x;
}
```

2. Annotate the source code according to the Table I. in the paper [RustViz: Interactively Visualizing Ownership and Borrowing](https://web.eecs.umich.edu/~comar/rustviz-hatra20.pdf) i.e  specify that event using DSL in comment (main.rs)

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

3. Supply the annotated file to DSL Processor to get the svg:  vis_code.svg and vis_timeline.svg, which is a section is the rustviz repo README (will have another section expanding on this)

![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_code.svg)

![Screen Shot 2022-06-27 at 11 46 52 AM](https://github.com/rustviz/rustviz/blob/master/src/examples/copy/vis_timeline.svg)

4. Could save the input code that actually generate the svg files in a separate folder(annotated_source.rs ) 

5. Save the above files in a separate folder and reference to these assets while writing book


###3. Adding features of your book with hover messages, etc






