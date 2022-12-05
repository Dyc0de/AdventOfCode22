package dayTwo

import future.keywords.in

rock := {"A", "X"}

isRock(me) {
	me in rock
}

paper := {"B", "Y"}

isPaper(me) {
	me in paper
}

scissors := {"C", "Z"}

isScissors(me) {
	me in scissors
}

isWin(opponent, me) {
	isRock(opponent)
	isPaper(me)
}

isWin(opponent, me) {
	isPaper(opponent)
	isScissors(me)
}

isWin(opponent, me) {
	isScissors(opponent)
	isRock(me)
}

isDraw(opponent, me) {
	opponent in rock
	me in rock
}

isDraw(opponent, me) {
	opponent in scissors
	me in scissors
}

isDraw(opponent, me) {
	opponent in paper
	me in paper
}

evaluateRoundPart1(opponent, me) := 6 + pointFor(me) {
	isWin(opponent, me)
} else := 3 + pointFor(me) {
	isDraw(opponent, me)
} else := 0 + pointFor(me)

pointFor(me) := 1 {
	isRock(me)
} else := 2 {
	isPaper(me)
} else := 3 {
	isScissors(me)
}

round_res := [r | r := evaluateRoundPart1(rounds[i][0], rounds[i][1])]

res_p1 := sum(round_res)

winRound(opponent) := "A" {
	isScissors(opponent)
} else := "B" {
	isRock(opponent)
} else := "C"

drawRound(opponent) := "A" {
	isRock(opponent)
} else := "B" {
	isPaper(opponent)
} else := "C"

loseRound(opponent) := "A" {
	isPaper(opponent)
} else := "B" {
	isScissors(opponent)
} else := "C"

lose := "X"

draw := "Y"

win := "Z"

findAction(opponent, outcome) := winRound(opponent) {
	outcome = win
} else := drawRound(opponent) {
	outcome = draw
} else := loseRound(opponent)

part2_round_res := [evaluateRoundPart1(opp_action, action) | opp_action := rounds[i][0]; action := findAction(rounds[i][0], rounds[i][1])]

res_p2 := sum(part2_round_res)
