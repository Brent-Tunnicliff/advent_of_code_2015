// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import Testing

@testable import AdventOfCode

struct Day05Tests {
    let testData = """
        ugknbfddgicrmopn
        aaa
        jchzalrnumimnmhp
        haegwjzuvuyypxyu
        dvszwmarrgswjxmb
        """

    @Test
    func testPart1() {
        let challenge = Day05(data: testData)
        #expect(challenge.part1() == 2)
    }

//    @Test
//    func testPart2() {
//        let challenge = Day05(data: testData)
//        #expect(challenge.part2() == 32000)
//    }
}
