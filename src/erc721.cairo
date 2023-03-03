#[contract]
mod ERC721 {
    use zeroable::Zeroable;
    use starknet::get_caller_address;
    use starknet::ContractAddressZeroable;
    use starknet::ContractAddressIntoFelt;
    use starknet::contract_address_const;
    use starknet::FeltTryIntoContractAddress;
    use traits::TryInto;
    use traits::Into;
    use option::OptionTrait;


    struct Storage {
        name: felt,
        symbol: felt,
        balance: LegacyMap::<ContractAddress, felt>,
        owner: LegacyMap::<u256, felt>
    }

    #[event]
    fn Transfer(from: ContractAddress, to: ContractAddress, token_id: u256) {}

    #[event]
    fn Approval(owner: ContractAddress, spender: ContractAddress, token_id: u256) {}

    #[constructor]
    fn constructor(name_: felt, symbol_: felt) {
        name::write(name_);
        symbol::write(symbol_);
    }

    #[view]
    fn get_name() -> felt {
        name::read()
    }

    #[view]
    fn get_symbol() -> felt {
        symbol::read()
    }

    #[view]
    fn get_balance(address: ContractAddress) -> felt {
        balance::read(address)
    }

    #[view]
    fn get_owner(token_id: u256) -> felt {
        owner::read(token_id)
    }

    #[external]
    fn mint(to: ContractAddress, token_id: u256) {
        assert(owner::read(token_id).is_zero(), 'Token already minted.');

        balance::write(to, balance::read(to) + 1);
        owner::write(token_id, to.into());
        Transfer(contract_address_const::<0>(), to, token_id);
    }

    #[external]
    fn burn(token_id: u256) {
        // only owner can burn
        let owner_address = get_owner(token_id).try_into().unwrap();

        assert(!owner_address.is_zero(), 'NFT does not exists.');
        // assert(get_caller_address() == owner_address, 'Not the owner!');
        balance::write(owner_address, get_balance(owner_address) - 1);
        owner::write(token_id, 0);

        Transfer(owner_address, contract_address_const::<0>(), token_id);
    }
}
