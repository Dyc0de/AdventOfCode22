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
