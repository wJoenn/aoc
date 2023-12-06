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

	timing, _ := strconv.Atoi(rTrim.ReplaceAllString(rTitle.Split(lines[0], -1)[1], ""))
	distance, _ := strconv.Atoi(rTrim.ReplaceAllString(rTitle.Split(lines[1], -1)[1], ""))

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

	fmt.Println(sum)
	// 40087680
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
