use erc721_v1::fib;

#[test]
#[available_gas(200000000)]
fn fib_test() {
    assert(fib::fib(1, 1, 5) == 7, 'invalid');
}