# Box

![coverage](coverage.svg)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkkk669%2Fswift-box%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/kkk669/swift-box)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkkk669%2Fswift-box%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/kkk669/swift-box)
[![License](https://img.shields.io/github/license/kkk669/swift-box.svg)](LICENSE)

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
