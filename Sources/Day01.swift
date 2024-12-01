// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

struct Day01: AdventDay {
    let data: String

    // Replace this with your solution for the first part of the day's challenge.
    func part1() -> Int {
        data.reduce(into: 0) { partialResult, character in
            switch character {
            case "(": partialResult += 1
            case ")": partialResult -= 1
            default: break
            }
        }
    }

    func part2() -> Int {
        var count = 0
        for (index, character) in data.enumerated() {
            switch character {
            case "(": count += 1
            case ")": count -= 1
            default: break
            }

            if count == -1 {
                return index + 1
            }
        }

        fatalError("Never reached basement.")
    }
}
