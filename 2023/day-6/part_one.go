package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
)

func main() {
	lines := ReadLines("input.txt")

	rTitle := regexp.MustCompile(`:\s+`)
	rTrim := regexp.MustCompile(`\s+`)

	times := Map(rTrim.Split(rTitle.Split(lines[0], -1)[1], -1), func(number string) int {
		n, _ := strconv.Atoi(number)
		return n
	})

	distances := Map(rTrim.Split(rTitle.Split(lines[1], -1)[1], -1), func(number string) int {
		n, _ := strconv.Atoi(number)
		return n
	})

	result := 1
	for i, timing := range times {
		distance := distances[i]
		isEven := timing%2 == 0
		half := timing / 2

		sum := 0
		for i := half; i >= 0; i-- {
			if i*(timing-i) <= distance {
				break
			}

			sum += 2
		}

		if isEven {
			sum--
		}

		result *= sum
	}

	fmt.Println(result)
	// 1731600
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
