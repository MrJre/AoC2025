import Foundation
import PuzzleToolbox

struct InputParser {
    let input: String

    func parse() -> [Vec3] {
        input
            .components(separatedBy: "\n").filter { !$0.isEmpty }
            .map {
                let comps = $0.components(separatedBy: ",").compactMap(Int.init)
                return Vec3(x: comps[0], y: comps[1], z: comps[2])
            }
    }
}
