package main

import (
	"fmt"
	"os"
	"slices"
	"strconv"
	"strings"
)

var CONVERTIONS = [][]int{}

func main() {
	file := ReadLines("input.txt")
	sections := strings.Split(file, "\n\n")

	getSeeds(sections[0])

	for _, section := range sections[1:] {
		CONVERTIONS = append(CONVERTIONS, []int{})
		index := len(CONVERTIONS) - 1

		lines := strings.Split(section, "\n")

		for _, seed := range CONVERTIONS[len(CONVERTIONS)-2] {
			isPending := true

			for _, rangeMap := range lines[1:] {
				numbers := strings.Split(rangeMap, " ")

				destinationRange, _ := strconv.Atoi(numbers[0])
				sourceRange, _ := strconv.Atoi(numbers[1])
				rangeLength, _ := strconv.Atoi(numbers[2])

				if seed >= sourceRange && seed < sourceRange+rangeLength {
					startOffset := seed - sourceRange
					CONVERTIONS[index] = append(CONVERTIONS[index], destinationRange+startOffset)

					isPending = false
				}
			}

			if isPending {
				CONVERTIONS[index] = append(CONVERTIONS[index], seed)
			}
		}
	}

	lowestLocation := slices.Min(CONVERTIONS[len(CONVERTIONS)-1])
	fmt.Println(lowestLocation)
	// 175622908
}

func getSeeds(file string) {
	seedsLine := strings.Split(file, ": ")[1]
	seeds := Map(strings.Split(seedsLine, " "), func(number string) int {
		seed, _ := strconv.Atoi(number)
		return seed
	})

	CONVERTIONS = append(CONVERTIONS, seeds)
}

func Map[T any, R any](sli []T, fun func(T) R) []R {
	res := make([]R, len(sli))
	for i, ele := range sli {
		res[i] = fun(ele)
	}

	return res
}

func ReadLines(fileName string) string {
	dir, _ := os.Getwd()
	filePath := fmt.Sprintf("%v/%v", dir, "input.txt")
	file, _ := os.ReadFile(filePath)

	return strings.Trim(string(file), "\n")
}
