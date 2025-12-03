import Foundation
import Testing
@testable import Day3

struct Day3ExampleTests {

    @Test func exampleOne() {
        let input = """
        987654321111111
        811111111111119
        234234234234278
        818181911112111
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day3(input: parseResult).part1()

        #expect(result == 357)
    }
}
