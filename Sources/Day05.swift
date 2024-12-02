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
        strings.filter { $0.isNice() }.count
    }
}

private extension String {
    func isNice() -> Bool {
        containsThreeVowels()
            && containsTwoAdjacentRepeats()
            && !containsNaughtyStrings()
    }

    private func containsThreeVowels() -> Bool {
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

    private func containsNaughtyStrings() -> Bool {
        for naughtyString in ["ab", "cd", "pq", "xy"] where contains(naughtyString) {
            return true
        }

        return false
    }

    private func containsTwoAdjacentRepeats() -> Bool {
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
}
