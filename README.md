# execat

This script allows you to run simple test C programs from the command line.
This is not a build system, and it never will be.
Again, this is a script for simple tests.
However, if you want to see what size a `long` is on your system you could run:
    $ execat -s long

Or, maybe you want to make sure the following code will multiply the dereferenced pointer instead of dereferencing it twice.
    $ execat -m <<EOF
    >    char *s="\n"; //'\n' = 10
    >    printf("%d\n", 5 * *p);
    >EOF

If you want to compile a simple program from a file you can run this:
    $ export P=my_prog
    $ execat

Setting `$P` makes certain flags not work because they expect redirection.
See the manual for how `$P` works.

This script was inspired by the book 21st Century C 2nd Ed., pg. 31 (ISBN 978-1-491-90389-6).
That page was inspired by [c99sh](https://github.com/RhysU/c99sh).
Maybe check those out.
