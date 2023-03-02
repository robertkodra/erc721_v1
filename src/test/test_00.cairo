use erc721_v1::erc721::ERC721;
use starknet::FeltTryIntoContractAddress;
use traits::TryInto;
use traits::Into;
use option::OptionTrait;
use integer::FeltIntoU256;

#[test]
#[available_gas(200000000)]
fn test_00_init() {
    ERC721::constructor('Star Token', 'STAR');
    assert(ERC721::get_name() == 'Star Token', 'Wrong name.');
    assert(ERC721::get_symbol() == 'STAR', 'Wrong symbol.');

    let user = FeltTryIntoContractAddress::try_into('user').unwrap();
    assert(ERC721::get_balance(user) == 0, 'wrong balance');
}
