public final class BoxObject<Value> {
    public var value: Value

    public init(_ value: Value) { self.value = value }

    public func copy() -> Self {
        .init(self.value)
    }
}

extension BoxObject: TextOutputStreamable {
    public func write<Target>(to target: inout Target) where Target: TextOutputStream {
        print(self.value, terminator: "", to: &target)
    }
}

extension BoxObject: Equatable where Value: Equatable {
    public static func == (lhs: BoxObject, rhs: BoxObject) -> Bool {
        lhs.value == rhs.value
    }
}

extension BoxObject: Comparable where Value: Comparable {
    public static func < (lhs: BoxObject, rhs: BoxObject) -> Bool {
        lhs.value < rhs.value
    }
}

extension BoxObject: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

extension BoxObject: Error where Value: Error {}

extension BoxObject: Encodable where Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
}

extension BoxObject: Decodable where Value: Decodable {
    public convenience init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(try container.decode(Value.self))
    }
}

extension BoxObject: CustomStringConvertible where Value: CustomStringConvertible {
    public var description: String { self.value.description }
}

extension BoxObject: CustomDebugStringConvertible where Value: CustomDebugStringConvertible {
    public var debugDescription: String { self.value.debugDescription }
}
