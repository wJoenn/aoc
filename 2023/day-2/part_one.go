package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	sum := 0

	for _, game := range readLines("input.txt") {
		isPossible := true

		idAndResults := strings.Split(game, ": ")
		id, _ := strconv.Atoi(strings.Split(idAndResults[0], " ")[1])
		for _, result := range strings.Split(idAndResults[1], "; ") {
			cubes := map[string]int{}

			for _, cube := range strings.Split(result, ", ") {
				amountAndColour := strings.Split(cube, " ")
				amount, _ := strconv.Atoi(amountAndColour[0])
				cubes[amountAndColour[1]] = amount
			}

			if cubes["blue"] > 14 || cubes["green"] > 13 || cubes["red"] > 12 {
				isPossible = false
				break
			}
		}

		if isPossible {
			sum += id
		}
	}

	fmt.Println(sum)
	// 3059
}

func readLines(fileName string) (lines []string) {
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
