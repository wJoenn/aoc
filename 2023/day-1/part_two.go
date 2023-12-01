package main

import (
	"bufio"
	"fmt"
	"os"
	"regexp"
	"strconv"
)

type Line string

var lettersToDigit = map[string]string{
	"one":   "o1e",
	"two":   "t2o",
	"three": "t3e",
	"four":  "f4r",
	"five":  "f5e",
	"six":   "s6x",
	"seven": "s7n",
	"eight": "e8t",
	"nine":  "n9e",
}

func main() {
	sum := 0

	for _, line := range readLines("input.txt") {
		line.parseLettersToNumbers()
		digits := line.digits()
		calibration, _ := strconv.Atoi(fmt.Sprintf("%v%v", digits[0], digits[len(digits)-1]))

		sum += calibration
	}

	fmt.Println(sum)
	// 54203
}

func (line Line) digits() []string {
	r := regexp.MustCompile(`\d`)
	digits := r.FindAllString(string(line), -1)

	return digits
}

func (line *Line) parseLettersToNumbers() {
	for letters, digit := range lettersToDigit {
		r := regexp.MustCompile(letters)
		*line = Line(r.ReplaceAllString(string(*line), digit))
	}
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
