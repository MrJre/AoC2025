import Foundation
import Testing
@testable import Day5

struct Day5ExampleTests {

    @Test func exampleOne() {
        let input = """
        3-5
        10-14
        16-20
        12-18
        
        1
        5
        8
        11
        17
        32
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day5(input: parseResult).part1()

        #expect(result == 3)
    }

    @Test func examplePart2() {
        let input = """
        3-5
        10-14
        16-20
        12-18
        
        1
        5
        8
        11
        17
        32
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day5(input: parseResult).part2()

        #expect(result == 14)
    }
}
