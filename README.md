# Box

![coverage](coverage.svg)
[![Swift](https://img.shields.io/badge/Swift-6.0-orange.svg)](https://www.swift.org)
[![License](https://img.shields.io/github/license/kkebo/swift-box.svg)](LICENSE)

This Swift package provides a type, `Box`.

[`Box`](./Sources/Box/Box.swift) is a value type that wraps another value type for heap allocation like [Rust's `Box`](https://doc.rust-lang.org/std/boxed/struct.Box.html). Also, it is implemented with copy-on-write behavior.

## Examples

```swift
import Box

struct Foo: ~Copyable {
    @Box var a: Int
    var b: Box<Int>
}

var foo = Foo(a: 3, b: .init(4))

XCTAssertEqual(foo.a, 3)
XCTAssertEqual(foo.b.value, 4)

foo.a = 10
foo.b.value = 5

XCTAssertEqual(foo.a, 10)
XCTAssertEqual(foo.b.value, 5)
```
