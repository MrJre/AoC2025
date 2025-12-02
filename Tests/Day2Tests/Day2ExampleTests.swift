import Foundation
import Testing
@testable import Day2

struct Day2ExampleTests {

    @Test func exampleOne() {
        let input = """

        """

        let parseResult = InputParser(input: input).parse()
        let result = Day2(input: parseResult).part1()

        #expect(result == -1)
    }
}