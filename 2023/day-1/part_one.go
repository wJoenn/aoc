package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
)

type Line string

func main() {
	sum := 0

	for _, line := range readLines("input.txt") {
		digits := line.digits()
		calibration, _ := strconv.Atoi(fmt.Sprintf("%v%v", digits[0], digits[len(digits)-1]))

		sum += calibration
	}

	fmt.Println(sum)
	// 54667
}

func (line Line) digits() []string {
	r := regexp.MustCompile(`\d`)
	digits := r.FindAllString(string(line), -1)

	return digits
}

func readLines(fileName string) (lines []Line) {
	dir, _ := os.Getwd()
	filePath := fmt.Sprintf("%v/%v", dir, fileName)
	file, _ := os.Open(filePath)

	defer file.Close()

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		lines = append(lines, Line(scanner.Text()))
	}

	return
}
