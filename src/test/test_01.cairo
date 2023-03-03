use erc721_v1::erc721::ERC721;
use starknet::FeltTryIntoContractAddress;
use traits::TryInto;
use traits::Into;
use option::OptionTrait;
use integer::FeltIntoU256;

#[test]
#[available_gas(200000000)]
fn test_01_mint() {
    let user = FeltTryIntoContractAddress::try_into('user').unwrap();
    let token_id = FeltIntoU256::into(1);

    ERC721::mint(user, token_id);

    assert(ERC721::get_balance(user) == 1, 'Wrong balance.');
    assert(ERC721::get_owner(token_id) == user.into(), 'Owner is not correct.');
}
