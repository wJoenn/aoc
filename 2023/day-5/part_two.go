package main

import (
	"fmt"
	"os"
	"regexp"
	"slices"
	"strconv"
	"strings"
)

var CONVERTIONS = [][][2]int{}

func main() {
	file := ReadLines("input.txt")
	sections := strings.Split(file, "\n\n")

	getSeeds(sections[0])

	for _, section := range sections[1:] {
		CONVERTIONS = append(CONVERTIONS, [][2]int{})
		currentIndex := len(CONVERTIONS) - 2
		newIndex := len(CONVERTIONS) - 1

		lines := strings.Split(section, "\n")

		for i := 0; i < len(CONVERTIONS[currentIndex]); i++ {
			isPending := true

			for _, rangeMap := range lines[1:] {
				numbers := strings.Split(rangeMap, " ")
				rangeLength, _ := strconv.Atoi(numbers[2])

				destinationRange, _ := strconv.Atoi(numbers[0])

				sourceRange, _ := strconv.Atoi(numbers[1])
				sourceRangeEnd := sourceRange + rangeLength - 1

				seedStart := CONVERTIONS[currentIndex][i][0]
				seedRange := CONVERTIONS[currentIndex][i][1]
				seedEnd := seedStart + seedRange - 1

				if seedStart >= sourceRange && seedEnd <= sourceRangeEnd {
					// seed is wholly within sourceRange. MOVING AS IS

					startOffset := seedStart - sourceRange

					converstion := [2]int{destinationRange + startOffset, seedRange}
					CONVERTIONS[newIndex] = append(CONVERTIONS[newIndex], converstion)

					isPending = false
					break
				} else if seedStart < sourceRange && seedEnd > sourceRangeEnd {
					// seed start is not within sourceRange range. DIVIDING IN THREE

					startOffset := sourceRange - seedStart
					endOffset := seedEnd - sourceRangeEnd

					converstion := [2]int{destinationRange, rangeLength}
					CONVERTIONS[newIndex] = append(CONVERTIONS[newIndex], converstion)

					beforeSeed := [2]int{seedStart, startOffset}
					afterSeed := [2]int{sourceRangeEnd + 1, endOffset}
					CONVERTIONS[currentIndex] = append(CONVERTIONS[currentIndex], beforeSeed, afterSeed)

					isPending = false
					break
				} else if seedEnd <= sourceRangeEnd {
					// seed start is not within sourceRange. DIVIDING IN TWO

					startOffset := sourceRange - seedStart

					converstion := [2]int{destinationRange, seedRange - startOffset}
					CONVERTIONS[newIndex] = append(CONVERTIONS[newIndex], converstion)

					beforeSeed := [2]int{seedStart, startOffset}
					CONVERTIONS[currentIndex] = append(CONVERTIONS[currentIndex], beforeSeed)

					isPending = false
					break
				} else if seedStart >= sourceRange {
					// seed end is not within sourceRange. DIVIDING IN TWO

					startOffset := seedStart - sourceRange
					endOffset := seedEnd - sourceRangeEnd

					converstion := [2]int{destinationRange + startOffset, seedRange - endOffset}
					CONVERTIONS[newIndex] = append(CONVERTIONS[newIndex], converstion)

					afterSeed := [2]int{sourceRangeEnd + 1, endOffset}
					CONVERTIONS[currentIndex] = append(CONVERTIONS[currentIndex], afterSeed)

					isPending = false
					break
				}
			}

			if isPending {
				CONVERTIONS[newIndex] = append(CONVERTIONS[newIndex], CONVERTIONS[currentIndex][i])
			}
		}
	}

	locations := Map(CONVERTIONS[len(CONVERTIONS)-1], func(seed [2]int) int {
		return seed[0]
	})

	lowestLocation := slices.Min(locations)
	fmt.Println(lowestLocation)
}

func getSeeds(file string) {
	seedsLine := strings.Split(file, ": ")[1]

	r := regexp.MustCompile(`\d+ \d+`)
	matches := r.FindAllString(seedsLine, -1)

	pairs := Map(matches, func(match string) [2]int {
		numbers := strings.Split(match, " ")
		start, _ := strconv.Atoi(numbers[0])
		length, _ := strconv.Atoi(numbers[1])

		return [2]int{start, length}
	})

	CONVERTIONS = append(CONVERTIONS, pairs)
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
