#!/bin/bash

cd "${0%/*}";

die(){
	printf '%s\n' "$1">&2;
	exit 1;
}

export P;
export ALLHEADS='./head.h';

for i in nop a\ b;do
	#The idea is to test that it compiles and runs, not to test output.
	P="$i" C > /dev/null || exit;
done

match_test(){
	[ "$1" = "$2" ] || die "$1"$'\nDOESN\'T MATCH:\n'"$2";
}

P=paren;
args=(foo bar\ baz bax);
a="$(printf '(%s)\n' "./$P" "${args[@]}")";
b="$(C -- "${args[@]}")" || exit;
match_test "$a" "$b";

P=;
#Command substitution removes the trailing \n,
#so use command substitution on both `a' & b.
#a=$'0\n1\n'; #No.
a="$(printf '0\n1\n')";
b="$(C -ql stdbool -p '"%d\n", false' -p '"%d\n", true';)";
match_test "$a" "$b";

P= C -s 'int' > /dev/null || die '-s test failed.';


printf 'All tests passed\n';
