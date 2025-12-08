import Foundation
import PuzzleCore
import PuzzleToolbox

struct Day7: Puzzle {

    let input: Grid

    func part1() -> Int {
        var splits: Int = 0
        var grid = input

        var currentTachyons = input.nodes.filter { $0.char == "S" }
        for y in 1..<input.height {
            var newTachyons: [Node] = []

            for t in currentTachyons {
                var vNode = grid.nodeAt(x: t.x, y: y)!

                switch vNode.char {
                case "^":
                    guard let left = grid.nodeAt(x: t.x - 1, y: y),
                          let right = grid.nodeAt(x: t.x + 1, y: y) else { continue }

                    if left.char != "|" || right.char != "|" {
                        splits += 1
                    }

                    grid = replaceChar(at: left.point, with: "|", in: grid)
                    grid = replaceChar(at: right.point, with: "|", in: grid)

                    newTachyons.append(left)
                    newTachyons.append(right)

                case ".":
                    vNode = Node(x: vNode.x, y: vNode.y, char: "|")
                    grid = replaceChar(at: vNode.point, with: "|", in: grid)
                    newTachyons.append(vNode)
                default:
                    continue
                }
            }
            currentTachyons = newTachyons
            newTachyons = []
        }

        return splits
    }

    func part2() -> Int {
        let grid = input
        var currentTachyons = input.nodes.filter { $0.char == "S" }
        let start = currentTachyons.first!

        let graph = Graph<Node>()

        for y in 1..<input.height {
            var newTachyons: Set<Node> = []

            for t in currentTachyons {
                let vNode = grid.nodeAt(x: t.x, y: y)!

                switch vNode.char {
                case "^":
                    guard let left = grid.nodeAt(x: t.x - 1, y: y),
                          let right = grid.nodeAt(x: t.x + 1, y: y) else { continue }

                    newTachyons.insert(left)
                    newTachyons.insert(right)

                    graph.addEdge(from: t, to: left)
                    graph.addEdge(from: t, to: right)

                case ".":
                    newTachyons.insert(vNode)
                    graph.addEdge(from: t, to: vNode)
                default:
                    continue
                }
            }
            print(y)
            currentTachyons = Array(newTachyons)
            newTachyons = []
        }

        var mem = [Node: Int]()

        return findPaths(in: graph, visited: [start], current: start, mem: &mem)
    }

    private func replaceChar(at point: Vec, with char: String, in grid: Grid) -> Grid {
        var nodes = grid.nodes
        nodes[point.y * grid.width + point.x] = Node(x: point.x, y: point.y, char: char)
        return Grid(width: grid.width, height: grid.height, nodes: nodes)
    }

    private func findPaths(in graph: Graph<Node>, visited: Set<Node>, current: Node, mem: inout [Node: Int]) -> Int {
        guard !graph.adjacentNodes(to: current).isEmpty else {
            return 1
        }

        if let count = mem[current] { return count }
        var score = 0

        let adjacents = graph.adjacentNodes(to: current)
        for node in adjacents {
            if visited.contains(node) { continue }
            score += findPaths(in: graph, visited: visited.union([node]), current: node, mem: &mem)
        }

        mem[current] = score

        return score
    }
}
