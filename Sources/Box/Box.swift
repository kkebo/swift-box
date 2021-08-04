@propertyWrapper
public struct Box<Value> {
    private var object: BoxObject<Value>

    public var value: Value {
        get { self.object.value }
        set {
            if !isKnownUniquelyReferenced(&self.object) {
                self.object = self.object.copy()
            }
            self.object.value = newValue
        }
    }

    public var wrappedValue: Value {
        get { self.value }
        set { self.value = newValue }
    }

    public init(_ value: Value) {
        self.object = .init(value)
    }

    public init(wrappedValue: Value) {
        self.init(wrappedValue)
    }
}

extension Box: TextOutputStreamable {
    public func write<Target>(to target: inout Target) where Target: TextOutputStream {
        print(self.value, terminator: "", to: &target)
    }
}

extension Box: Equatable where Value: Equatable {
    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.value == rhs.value
    }
}

extension Box: Comparable where Value: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.value < rhs.value
    }
}

extension Box: Hashable where Value: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.value)
    }
}

extension Box: Error where Value: Error {}

extension Box: Encodable where Value: Encodable {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.value)
    }
}

extension Box: Decodable where Value: Decodable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.init(try container.decode(Value.self))
    }
}

extension Box: CustomStringConvertible where Value: CustomStringConvertible {
    public var description: String { self.value.description }
}

extension Box: CustomDebugStringConvertible where Value: CustomDebugStringConvertible {
    public var debugDescription: String { self.value.debugDescription }
}
