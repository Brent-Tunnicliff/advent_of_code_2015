// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import Testing

@testable import AdventOfCode

struct Day04Tests {
    @Test(arguments: [
        ("abcdef", 609_043),
        ("pqrstuv", 1_048_970),
    ])
    func testPart1(input: String, expected: Int) async {
        let challenge = Day04(data: input)
        #expect(await challenge.part1() == expected)
    }
}
