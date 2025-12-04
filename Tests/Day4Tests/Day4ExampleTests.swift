import Foundation
import Testing
@testable import Day4

struct Day4ExampleTests {

    @Test func exampleOne() {
        let input = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day4(input: parseResult).part1()

        #expect(result == 13)
    }

    @Test func exampleOnePart2() {
        let input = """
        ..@@.@@@@.
        @@@.@.@.@@
        @@@@@.@.@@
        @.@@@@..@.
        @@.@@@@.@@
        .@@@@@@@.@
        .@.@.@.@@@
        @.@@@.@@@@
        .@@@@@@@@.
        @.@.@@@.@.
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day4(input: parseResult).part2()

        #expect(result == 43)
    }
}
