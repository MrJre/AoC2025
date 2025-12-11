import Foundation

public struct Vec3: Hashable {
    public let x: Int
    public let y: Int
    public let z: Int

    public init(x: Int, y: Int, z: Int) {
        self.x = x
        self.y = y
        self.z = z
    }

    public func dist(to other: Vec3) -> Double {
        let x = powl(Double(other.x - x), 2)
        let y = powl(Double(other.y - y), 2)
        let z = powl(Double(other.z - z), 2)
        return sqrt(x + y + z)
    }

    public static func -(lhs: Self, rhs: Self) -> Self {
        Self(x: lhs.x - rhs.x, y: lhs.y - rhs.y, z: lhs.z - rhs.z)
    }

    public static func +(lhs: Self, rhs: Self) -> Self {
        Self(x: lhs.x + rhs.x, y: lhs.y + rhs.y, z: lhs.z + rhs.z)
    }
}

extension Vec3: CustomDebugStringConvertible {
    public var debugDescription: String { "[\(x),\(y),\(z)]"}
}
