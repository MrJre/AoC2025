import Foundation

public final class Graph<T: Hashable> {

    private var map: Dictionary<T, Set<T>> = [:]

    public init() {}

    public func addEdge(from nodeA: T, to nodeB: T) {
        var adjacents = map[nodeA] ?? Set<T>()
        adjacents.insert(nodeB)
        map[nodeA] = adjacents
    }

    public func areConnected(nodeA: T, nodeB: T) -> Bool {
        guard let adjacents = map[nodeA] else { return false }
        return adjacents.contains(nodeB)
    }

    public func adjacentNodes(to node: T) -> Set<T> {
        return map[node] ?? Set<T>()
    }
}

extension Graph: CustomStringConvertible {
    public var description: String {
        map.keys.map { String("\($0) --> \(map[$0]!)") }.joined(separator: "\n")
    }
}
