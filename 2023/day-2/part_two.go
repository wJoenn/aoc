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
		cubes := map[string]int{}

		idAndResults := strings.Split(game, ": ")
		for _, result := range strings.Split(idAndResults[1], "; ") {
			for _, cube := range strings.Split(result, ", ") {
				amountAndColour := strings.Split(cube, " ")
				amount, _ := strconv.Atoi(amountAndColour[0])
				if amount > cubes[amountAndColour[1]] {
					cubes[amountAndColour[1]] = amount
				}
			}
		}

		power := 1
		for _, amount := range cubes {
			power *= amount
		}

		sum += power
	}

	fmt.Println(sum)
	// 65371
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
