// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import AOCHelper

struct Day03: AdventDay {
    let data: String
    private var directions: [CompassDirection] {
        data.split(separator: "")
            .compactMap {
                switch $0.description {
                case "^": .north
                case "v": .south
                case ">": .east
                case "<": .west
                default: nil
                }
            }
    }

    func part1() -> Int {
        getHouses(from: directions).toSet().count
    }

    func part2() -> Int {
        let directions = directions.enumerated()
            .reduce(into: ([CompassDirection](), [CompassDirection]())) { partialResult, element in
                let (index, direction) = element
                if index % 2 == 0 {
                    partialResult.0.append(direction)
                } else {
                    partialResult.1.append(direction)
                }
            }

        let santaHouses = getHouses(from: directions.0)
        let roboHouses = getHouses(from: directions.1)
        return (santaHouses + roboHouses).toSet().count
    }

    private func getHouses(from directions: [CompassDirection]) -> [Coordinates] {
        let startingPoint = Coordinates(x: 0, y: 0)
        return directions.reduce(into: [startingPoint]) { partialResult, direction in
            let previous = partialResult.last ?? startingPoint
            partialResult.append(previous.next(in: direction))
        }
    }
}
