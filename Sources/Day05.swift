// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import AOCHelper
import Algorithms

struct Day05: AdventDay {
    let data: String

    var strings: [String] {
        data.split(separator: "\n")
            .map { String($0) }
    }

    func part1() -> Int {
        strings
            .filter {
                $0.containsThreeVowels()
                    && $0.containsTwoAdjacentRepeats()
                    && !$0.containsNaughtyStrings()
            }
            .count
    }

    func part2() -> Int {
        strings
            .filter {
                $0.containsPairOfTwoLettersRepeating()
                    && $0.containsRepeatingLetterWithOneBetween()
            }
            .count
    }
}

extension String {
    // MARK: - Part 1

    fileprivate func containsThreeVowels() -> Bool {
        let vowels = "aeiou"
        var count = 0
        for character in self {
            if vowels.contains(character) {
                count += 1
            }

            if count >= 3 {
                return true
            }
        }

        return false
    }

    fileprivate func containsNaughtyStrings() -> Bool {
        for naughtyString in ["ab", "cd", "pq", "xy"] where contains(naughtyString) {
            return true
        }

        return false
    }

    fileprivate func containsTwoAdjacentRepeats() -> Bool {
        let array = Array(self)
        for (index, character) in array.enumerated() {
            guard index + 1 < count else {
                return false
            }

            if array[index + 1] == character {
                return true
            }
        }

        return false
    }

    // MARK: - Part 2

    fileprivate func containsPairOfTwoLettersRepeating() -> Bool {
        let array = Array(self)
        for (index, character) in array.enumerated() {
            guard index + 2 < count else {
                return false
            }

            let pair = character.toString() + array[index + 1].toString()
            let remaining = array.dropFirst(index + 2)

            if remaining.contains(pair) {
                return true
            }
        }

        return false
    }

    fileprivate func containsRepeatingLetterWithOneBetween() -> Bool {
        let array = Array(self)
        for (index, character) in array.enumerated() {
            guard index + 2 < count else {
                return false
            }

            if array[index + 2] == character {
                return true
            }
        }

        return false
    }
}
