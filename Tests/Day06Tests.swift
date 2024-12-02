// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import Testing

@testable import AdventOfCode

struct Day06Tests {
    @Test(arguments: [
        ("turn on 0,0 through 999,999", 1_000_000),
        ("toggle 0,0 through 999,0", 1_000),
        ("turn off 499,499 through 500,500", 0),
        ("turn on 499,499 through 500,500", 4),
    ])
    func testPart1(input: String, expected: Int) {
        let challenge = Day06(data: input)
        #expect(challenge.part1() == expected)
    }

    @Test(arguments: [
        ("turn on 0,0 through 0,0", 1),
        ("toggle 0,0 through 999,999", 2_000_000),
    ])
    func testPart2(input: String, expected: Int) {
        let challenge = Day06(data: input)
        #expect(challenge.part2() == expected)
    }
}
