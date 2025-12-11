import Foundation
import PuzzleCore
import PuzzleToolbox

struct Day8: Puzzle {

    let input: [Vec3]
    let amount: Int

    init(input: [Vec3], amount: Int = 1000) {
        self.input = input
        self.amount = amount
    }

    func part1() -> Int {

        let dists: Set<Dist> = makeDists()
        let sorted = dists.sorted { $0.distance < $1.distance }
        let circuits = connectCircuits(circuits: input.map { Circuit(boxes: [$0]) }, dists: sorted, amount: amount).0

        return circuits.sorted { $0.boxes.count > $1.boxes.count }.prefix(3).map { $0.boxes.count }.reduce(1, *)
    }

    func part2() -> Int {
        let dists: Set<Dist> = makeDists()
        let sorted = dists.sorted { $0.distance < $1.distance }
        let lastConnected = connectCircuits(circuits: input.map { Circuit(boxes: [$0]) }, dists: sorted).1
        return lastConnected.boxA.x * lastConnected.boxB.x
    }

    func makeDists() -> Set<Dist> {
        var dists: Set<Dist> = []

        for i in 0..<input.count {
            for j in i..<input.count {
                let boxA = input[i]
                let boxB = input[j]
                if boxA == boxB { continue }
                dists.insert(Dist(boxA: boxA, boxB: boxB, distance: boxA.dist(to: boxB)))
            }
        }

        return dists
    }

    func connectCircuits(circuits: [Circuit], dists: [Dist], amount: Int? = nil) -> ([Circuit], Dist) {
        var circuits = circuits
        var lastToConnect: Dist!

        var dists = dists
        if let amount { dists = Array(dists.prefix(amount)) }

        for dist in dists {
            let circuitA = circuits.first(where: { $0.contains(dist.boxA) })
            let circuitB = circuits.first(where: { $0.contains(dist.boxB) })

            switch(circuitA != nil, circuitB != nil) {
            case (false, false):
                circuits.append(Circuit(boxes: [dist.boxA, dist.boxB]))
            case (true, false):
                let circuit = circuits.first { $0.contains(dist.boxA) }
                circuit?.add(box: dist.boxB)
            case (false, true):
                let circuit = circuits.first { $0.contains(dist.boxB) }
                circuit?.add(box: dist.boxA)
            case (true, true):
                if circuitA == circuitB { continue }
                if let circuitA, let circuitB {
                    circuits.removeAll { $0 == circuitA }
                    circuits.removeAll { $0 == circuitB }
                    circuits.append(circuitA.combine(with: circuitB))
                }
            }

            lastToConnect = dist
            if circuits.count == 1 { break }
        }
        return (circuits, lastToConnect)
    }
}

struct Dist {
    let boxA: Vec3
    let boxB: Vec3
    let distance: Double
}

extension Dist: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(distance)
    }
}

class Circuit {
    var boxes: Set<Vec3>

    init(boxes: Set<Vec3>) {
        self.boxes = boxes
    }

    func add(box: Vec3) { boxes.insert(box) }
    func contains(_ box: Vec3) -> Bool { boxes.contains(box) }
    func combine(with other: Circuit) -> Circuit { Circuit(boxes: self.boxes.union(other.boxes)) }
}

extension Circuit: Equatable {
    static func == (lhs: Circuit, rhs: Circuit) -> Bool {
        lhs.boxes == rhs.boxes
    }
}

extension Circuit: CustomDebugStringConvertible {
    var debugDescription: String { boxes.debugDescription }
}
