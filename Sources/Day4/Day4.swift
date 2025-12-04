import Foundation
import PuzzleCore

struct Day4: Puzzle {

    let input: Grid

    func part1() -> Int {
        input.nodes.filter { $0.char == "@" }.filter { neighbours(of: $0, in: input).filter { $0.char == "@" }.count < 4 }.count
    }

    func part2() -> Int {
        var grid = input
        var count = 0

        while true {
            let removedNodes = grid.nodes.filter { $0.char == "@" }.filter { neighbours(of: $0, in: grid).filter { $0.char == "@" }.count < 4 }
            guard !removedNodes.isEmpty else { break }

            count += removedNodes.count

            var nodes = grid.nodes
            for node in removedNodes {
                nodes[node.y * grid.width + node.x] = Node(x: node.x, y: node.y, char: ".")
            }
            grid = Grid(width: grid.width, height: grid.height, nodes: nodes)
        }

        return count
    }

    func neighbours(of node: Node, in grid: Grid) -> [Node] {
        let nodes = [
            grid.nodeAt(x: node.x - 1, y: node.y - 1),
            grid.nodeAt(x: node.x - 1, y: node.y),
            grid.nodeAt(x: node.x - 1, y: node.y + 1),

            grid.nodeAt(x: node.x, y: node.y - 1),
            grid.nodeAt(x: node.x, y: node.y + 1),

            grid.nodeAt(x: node.x + 1, y: node.y - 1),
            grid.nodeAt(x: node.x + 1, y: node.y),
            grid.nodeAt(x: node.x + 1, y: node.y + 1)
        ]

        return nodes.compactMap(\.self)
    }
}
