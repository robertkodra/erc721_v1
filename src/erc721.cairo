#[contract]
mod ERC721 {
    use starknet::get_caller_address;
    use starknet::contract_address_const;
    use starknet::ContractAddressZeroable;

    struct Storage {
        name: felt,
        symbol: felt,
        balance: LegacyMap::<ContractAddress, felt>,
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
    fn get_balance(address: ContractAddress) -> felt{
        balance::read(address)
    }
}