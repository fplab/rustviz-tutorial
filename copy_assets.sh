copy_assets.sh

# This is a convenience script to copy the code examples and corresponding SVG
# visualizations from the rustviz repository. See README.md for more details.
# RV='../rustviz'
RV='rustviz'

# printf "copying helper.js and book.js..."
cp "$RV/rustviz_mdbook/mdbook_plugin/helpers.js"  "./helpers.js"
cp "$RV/rustviz_mdbook/mdbook_plugin/book.js"  "./theme/book.js"
# printf "done\n"

printf "copying files into code_examples..."
EX=$RV/src/examples
for DIR in $EX/*/; do
    BASENAME=`basename $DIR`
    echo $BASENAME
    printf "basename is $BASENAME\n"
    printf "dir is $DIR\n"
    if [ -f  "$DIR/source.rs" ] && [ -f "$DIR/vis_code.svg" ] && [ -f "$DIR/vis_timeline.svg" ];
    then
        mkdir -p "./src/assets/code_examples/$BASENAME" && \
            cp "$DIR/source.rs" "./src/assets/code_examples/$BASENAME/source.rs" && \
            cp "$DIR/vis_code.svg" "./src/assets/code_examples/$BASENAME/vis_code.svg" && \
            cp "$DIR/vis_timeline.svg" "./src/assets/code_examples/$BASENAME/vis_timeline.svg"
    else
        echo "$BASENAME does not have the required files, skipping."
    fi
done
printf "${green}done${END}\n"

# Copy new files to modified_examples
printf "Copying files into modified_examples..."
for DIR in ./src/assets/modified_examples/*; do
    BASENAME=`basename $DIR`
    echo $BASENAME
    if [ -f  "$EX/$BASENAME/source.rs" ] && [ -f "$EX/$BASENAME/vis_code.svg" ] && [ -f "$EX/$BASENAME/vis_timeline.svg" ];
    then
        cp "$EX/$BASENAME/source.rs" "$DIR/source.rs" && \
        cp "$EX/$BASENAME/vis_code.svg" "$DIR/vis_code.svg" && \
        cp "$EX/$BASENAME/vis_timeline.svg" "$DIR/vis_timeline.svg"
    else
        echo "$BASENAME does not have the required files, skipping."
    fi
done
printf "${green}done${END}\n"

# mdbook build