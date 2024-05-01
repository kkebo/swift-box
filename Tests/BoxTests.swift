private import Box
import Testing

@Test func basicUsage() {
    struct Foo: ~Copyable {
        @Box var a: Int
        var b: Box<Int>
    }

    var foo = Foo(a: 3, b: .init(4))

    #expect(foo.a == 3)
    #expect(foo.b.value == 4)

    foo.a = 10
    foo.b.value = 5

    #expect(foo.a == 10)
    #expect(foo.b.value == 5)
}
