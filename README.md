# Box

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkkk669%2Fswift-box%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/kkk669/swift-box)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fkkk669%2Fswift-box%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/kkk669/swift-box)
[![License](https://img.shields.io/github/license/kkk669/swift-box.svg)](LICENSE)

This Swift package provides two types, `Box` and `BoxObject`.

[`Box`](./Sources/Box/Box.swift) is a value type that wraps another value type ~~for heap allocation~~ like [Rust's `Box`](https://doc.rust-lang.org/std/boxed/struct.Box.html). Also, it is implemented with copy-on-write behavior.

[`BoxObject`](./Sources/Box/BoxObject.swift) is almost the same as `Box`, but it's a reference type. If you copy the wrapped value, you can call its `copy()` method.

## Examples

```swift
import Box

struct Foo {
    @Box var a: Int
    var b: Box<Int>
    var c: BoxObject<Int>
}

var foo = Foo(a: 3, b: .init(4), c: .init(9))
print(foo)  // Foo(_a: 3, b: 4, c: 9)

var bar = foo
bar.a = 10
bar.b.value = 5
bar.c.value = 99
print(foo)  // Foo(_a: 3, b: 4, c: 99)
print(bar)  // Foo(_a: 10, b: 5, c: 99)
```
