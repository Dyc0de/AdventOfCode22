package dayThree

points = " abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

lines := split(challengeInput, "\n")

testBag := [[split(substring(line, 0, count(line) / 2), ""), substring(line, count(line) / 2, count(line) / 2)] | line := lines[_]]

findChar(haystack, needle) := needle {
	indexof(haystack, needle) > -1
}

findMatch(s1, s2) := needle[0] {
	needle := [findChar(s2, char) | char := s1[_]]
}

listError := [findMatch(s1, s2) | s1 := testBag[i][0]; s2 := testBag[i][1]]

res_p1 := sum([indexof(points, char) | char := listError[_]])

groups := [[split(s1, ""), s2, s3] | s1 := lines[i]; s2 := lines[i + 1]; s3 := lines[i + 2]; i % 3 = 0]

findMatches(s1, s2) := needle {
	needle := {findChar(s2, char) | char := s1[_]}
}

findGroup(s1, s2, s3) := res {
	needles1 := findMatches(s1, s2)

	needles2 := findMatches(s1, s3)

	res := needles1 & needles2
}

badges := [findGroup(s1, s2, s3) | s1 := groups[i][0]; s2 := groups[i][1]; s3 := groups[i][2]]

flatten := [b | b := badges[_][_]]

res_p2 := sum([indexof(points, char) | char := flatten[_]])
