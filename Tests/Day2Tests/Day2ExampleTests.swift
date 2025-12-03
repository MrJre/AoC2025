import Foundation
import Testing
@testable import Day2

struct Day2ExampleTests {

    @Test func exampleOne() {
        let input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

        let parseResult = InputParser(input: input).parse()
        let result = Day2(input: parseResult).part1()

        #expect(result == -1)
    }

    @Test func exampleOnePart2() {
        let input = "11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124"

        let parseResult = InputParser(input: input).parse()
        let result = Day2(input: parseResult).part2()

        #expect(result == -1)
    }

    @Test func validatePart2() {
        let string = "123123123"

        #expect(Day2(input: []).validatePart2(id: string, chunkSize: 3) == false)
    }
}
