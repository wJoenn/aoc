package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
	"strings"
)

var NUMBERS = map[string]string{}

func main() {
	linesOfChars := Map(ReadLines("input.txt"), func(line string) []string {
		return strings.Split(line, "")
	})

	sum := 0
	for x, line := range linesOfChars {
		for y, char := range line {
			r := regexp.MustCompile(`\*`)
			match := r.MatchString(char)

			if match {
				NUMBERS = map[string]string{}
				findAndAppendNumbers(linesOfChars, x, y)

				if len(NUMBERS) == 2 {
					gear := 1
					for _, number := range NUMBERS {
						n, _ := strconv.Atoi(number)
						gear *= n
					}

					sum += gear
				}
			}
		}
	}

	fmt.Println(sum)
	// 75312571
}

func findAndAppendNumbers(chars [][]string, x int, y int) {
	xPositions := map[int]bool{
		x - 1: x > 0,
		x:     x >= 0,
		x + 1: x < len(chars)-1,
	}

	for xPosition, xCondition := range xPositions {
		if xCondition {
			yPositions := map[int]bool{
				y - 1: y > 0,
				y:     y >= 0,
				y + 1: y < len(chars[xPosition])-1,
			}

			for yPosition, yCondition := range yPositions {
				if yCondition {
					appendNumber(chars, xPosition, yPosition)
				}
			}
		}
	}
}

func appendNumber(chars [][]string, x int, y int) {
	char := chars[x][y]

	_, err := strconv.Atoi(char)
	if err != nil {
		return
	}

	digits := []string{char}

	i := 1
	keepGoing := true
	for keepGoing && y-i >= 0 {
		_, err := strconv.Atoi(chars[x][y-i])
		if err != nil {
			keepGoing = false
		} else {
			digits = append([]string{chars[x][y-i]}, digits...)
			i++
		}
	}

	j := 1
	keepGoing = true
	for keepGoing && y+j < len(chars[x]) {
		_, err := strconv.Atoi(chars[x][y+j])
		if err != nil {
			keepGoing = false
		} else {
			digits = append(digits, chars[x][y+j])
			j++
		}
	}

	position := fmt.Sprintf("%v%v%v", x, y-i+1, y+j-1) // For number with coords [58, 101->103] => 5810103
	NUMBERS[position] = strings.Join(digits, "")
}

func Map[T any, R any](sli []T, fun func(T) R) []R {
	res := make([]R, len(sli))
	for i, ele := range sli {
		res[i] = fun(ele)
	}

	return res
}

func ReadLines(fileName string) (lines []string) {
	dir, _ := os.Getwd()
	filePath := fmt.Sprintf("%v/%v", dir, fileName)
	file, _ := os.Open(filePath)

	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, scanner.Text())
	}

	return
}
