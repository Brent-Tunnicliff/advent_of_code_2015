// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import AOCHelper
import CryptoKit
import Foundation

struct Day04: AdventDay {
    let data: String

    func part1() async -> Int {
        await getNumberStartingWith("00000")
    }

    func part2() async -> Int {
        await getNumberStartingWith("000000")
    }

    private func getNumberStartingWith(_ prefix: String) async -> Int {
        await withTaskGroup(of: Optional<Int>.self) { group in
            var count = 0

            while true {
                for value in (count...(count + 100)) {
                    group.addTask {
                        let md5 = Insecure.MD5.hash(data: Data("\(data)\(value)".utf8)).map {
                            String(format: "%02hhx", $0)
                        }.joined()

                        return md5.dropLast(md5.count - prefix.count) == prefix ? value : nil
                    }
                }

                for await value in group {
                    if let value {
                        return value
                    }
                }

                count += 100
            }
        }
    }
}
