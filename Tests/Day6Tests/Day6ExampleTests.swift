import Foundation
import Testing
@testable import Day6

struct Day6ExampleTests {

    @Test func exampleOne() {
        let input = """
        123 328  51 64 
        45 64  387 23 
        6 98  215 314
        *   +   *   +  
        """

        let parseResult = InputParser(input: input).parsePart1()
        let result = Day6(input: parseResult).part1()

        #expect(result == 4277556)
    }

    @Test func examplePart2() {
        let input = """
        123 328  51 64 
         45 64  387 23 
          6 98  215 314
        *   +   *   +   
        """

        let parseResult = InputParser(input: input).parsePart2()
        let result = Day6(input: parseResult).part2()

        #expect(result == 3263827)
    }
}
