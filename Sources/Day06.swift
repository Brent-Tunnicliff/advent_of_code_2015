// Copyright © 2024 Brent Tunnicliff <brent@tunnicliff.dev>

import AOCHelper
import Algorithms

struct Day06: AdventDay {
    let data: String

    private var commands: [(Command, [Coordinates])] {
        data.split(separator: "\n")
            .reduce(into: [(Command, [Coordinates])]()) { partialResult, row in
                let input = row.toString()
                let command = Command(value: input)
                let coordinates = parse(command: command, input: input)
                partialResult.append((command, coordinates))
            }
    }

    func part1() -> Int {
        var grid = generateGrid()
        for (command, coordinates) in commands {
            let newValues = coordinates.reduce(into: [Coordinates: Bool]()) { partialResult, coordinates in
                partialResult[coordinates] =
                    switch command {
                    case .toggle: !(partialResult[coordinates] ?? grid[coordinates] ?? false)
                    case .turnOn: true
                    case .turnOff: false
                    }
            }

            grid = grid.adding(newValues, overrideExisting: true)
        }

        return grid.values.filter(\.value).count
    }

    // MARK: - Helpers

    private func generateGrid() -> Grid<Coordinates, Bool> {
        let keys = generateCoordinates(
            from: Coordinates(x: 0, y: 0),
            to: Coordinates(x: 999, y: 999)
        )

        let values = keys.reduce(into: [Coordinates: Bool]()) { partialResult, coordinates in
            partialResult[coordinates] = false
        }

        return Grid(values: values)
    }

    private enum Command: String, CaseIterable {
        case toggle = "toggle"
        case turnOn = "turn on"
        case turnOff = "turn off"

        init(value: String) {
            guard let value = Command.allCases.first(where: { value.hasPrefix($0.rawValue) }) else {
                fatalError("Unknown value \(value)")
            }

            self = value
        }
    }

    private func parse(command: Command, input: String) -> [Coordinates] {
        let coordinates = input.trimmingPrefix(command.rawValue)
            .split(separator: "through")
            .map {
                let values = $0.split(separator: ",")
                    .map { $0.toInt() }
                precondition(values.count == 2)
                return Coordinates(x: values[0], y: values[1])
            }

        precondition(coordinates.count == 2)
        return generateCoordinates(from: coordinates[0], to: coordinates[1])
    }

    private func generateCoordinates(from: Coordinates, to: Coordinates) -> [Coordinates] {
        let minX = min(from.x, to.x)
        let maxX = max(from.x, to.x)
        let minY = min(from.y, to.y)
        let maxY = max(from.y, to.y)

        var results: [Coordinates] = []
        for x in (minX...maxX) {
            for y in (minY...maxY) {
                results.append(Coordinates(x: x, y: y))
            }
        }

        return results
    }
}
