// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import Testing

@testable import AdventOfCode

struct Day03Tests {
    @Test(arguments: [
        (">", 2),
        ("^>v<", 4),
        ("^v^v^v^v^v", 2),
    ])
    func testPart1(input: String, expected: Int) {
        let challenge = Day03(data: input)
        #expect(challenge.part1() == expected)
    }

    @Test(arguments: [
        ("^v", 3),
        ("^>v<", 3),
        ("^v^v^v^v^v", 11),
    ])
    func testPart2(input: String, expected: Int) {
        let challenge = Day03(data: input)
        #expect(challenge.part2() == expected)
    }
}
