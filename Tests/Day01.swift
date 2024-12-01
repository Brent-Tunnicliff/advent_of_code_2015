// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import Testing

@testable import AdventOfCode

struct Day01Tests {

    @Test(arguments: [
        ("(())", 0),
        ("()()", 0),
        ("(((", 3),
        ("(()(()(", 3),
        ("))(((((", 3),
        ("())", -1),
        ("))(", -1),
        (")))", -3),
        (")())())", -3),
    ])
    func testPart1(input: String, expectedAnswer: Int) {
        let challenge = Day01(data: input)
        #expect(challenge.part1() == expectedAnswer)
    }
}
