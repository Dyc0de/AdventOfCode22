package dayFour

import future.keywords.in

# lines := [split(l, ",") | l := split(testInput, "\n")[_]]

lines := [split(l, ",") | l := split(challengeInput, "\n")[_]]

pairs := [[s1, s2] | s1 := split(lines[i][0], "-"); s2 := split(lines[i][1], "-")]

is_contained(r1, r2) := 1 {
	c1 := count(r1) - 1
	r1[0] in r2
	r1[c1] in r2
}

is_contained(r1, r2) := 1 {
	c2 := count(r2) - 1
	r2[0] in r1
	r2[c2] in r1
}

rows := [[numbers.range(to_number(a), to_number(b)) | a := pair[j][0]; b := pair[j][1]] | pair := pairs[_]]

overlap_p1 := sum([is_contained(r[0], r[1]) | r := rows[_]])

is_ranged_contained(r1, r2) := 1 {
	r1[0] in r2
}

is_ranged_contained(r1, r2) := 1 {
	c1 := count(r1) - 1
	r1[c1] in r2
}

is_ranged_contained(r1, r2) := 1 {
	r2[0] in r1
}

is_ranged_contained(r1, r2) := 1 {
	c2 := count(r2) - 1
	r2[c2] in r1
}

overlap_p2 := sum([is_ranged_contained(r[0], r[1]) | r := rows[_]])
