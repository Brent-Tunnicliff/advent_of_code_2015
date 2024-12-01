import Testing

@testable import AdventOfCode

struct Day02Tests {
    @Test(arguments: [
        ("2x3x4", 58),
        ("1x1x10", 43),
        (
            """
            2x3x4
            1x1x10
            """,
            101
        ),
    ])
    func testPart1(input: String, expectedResult: Int) {
        let challenge = Day02(data: input)
        #expect(challenge.part1() == expectedResult)
    }

    @Test(arguments: [
        ("2x3x4", 34),
        ("1x1x10", 14),
        (
            """
            2x3x4
            1x1x10
            """,
            48
        ),
    ])
    func testPart2(input: String, expectedResult: Int) {
        let challenge = Day02(data: input)
        #expect(challenge.part2() == expectedResult)
    }
}
