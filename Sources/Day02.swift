// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import AOCHelper

struct Day02: AdventDay {
    let data: String
    private var entities: [(length: Int, width: Int, height: Int)] {
        data.split(separator: "\n").reduce(into: [(Int, Int, Int)]()) { partialResult, row in
            guard !row.isEmpty else {
                return
            }

            let values = row.split(separator: "x")
            partialResult.append(
                (
                    values[0].toInt(),
                    values[1].toInt(),
                    values[2].toInt()
                )
            )
        }
    }

    func part1() -> Int {
        entities.reduce(into: 0) { partialResult, row in
            let lengthByWidth = row.length * row.width
            let heightByLength = row.height * row.length
            let widthByHeight = row.width * row.height

            partialResult +=
                min(lengthByWidth, heightByLength, widthByHeight)
                + (2 * lengthByWidth)
                + (2 * heightByLength)
                + (2 * widthByHeight)
        }
    }

    func part2() -> Int {
        entities.reduce(into: 0) { partialResult, row in
            let ribbonForWrapping = [row.height, row.length, row.width]
                .sorted()
                // Drop the largest number
                .dropLast()
                .reduce(into: 0) { ribbonForWrappingResult, value in
                    ribbonForWrappingResult += value * 2
                }

            let ribbonForBow = row.height * row.length * row.width

            partialResult += ribbonForWrapping + ribbonForBow
        }
    }
}
