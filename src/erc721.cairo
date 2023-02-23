#[contract]

mod ERC721 {

    struct Storage { 
        name: felt,
        symbol: felt,
    }
    
    #[event]

    #[constructor]
    fn constructor(_name: felt, _symbol: felt) {
        name::write(_name);
        symbol::write(_symbol);
    }

    trait IERC721 {

    fn name() -> felt;

    fn symbol() -> felt;

    fn token_uri(tokenId: u256) -> felt;

    fn balance_of(owner: felt) -> u256;

    fn owner_of(tokenId: u256) -> felt;

    fn transfer_from(_from: felt, to: felt, tokenId: u256);

    fn approve(approved: felt, tokenId: u256);

    fn set_approval_for_all(operator: felt, approved: felt);

    fn get_approved(tokenId: u256) -> felt;

    fn is_approved_for_all(owner: felt, operator: felt) -> felt;
    }

    impl ERC721 of IERC721{

        #[view]
        fn name() -> felt {
            return name::read();
        }

        #[view]
        fn symbol() -> felt {
            return symbol::read();
        }

        #[view]
        fn token_uri(tokenId: u256) -> felt {
        }

        #[view]
        fn balance_of(owner: felt) -> u256 {
        }

        #[view]
        fn owner_of(tokenId: u256) -> felt {
        }

        #[external]
        fn transfer_from(_from: felt, to: felt, tokenId: u256) {
        }

        #[external]
        fn approve(approved: felt, tokenId: u256) {
        }

        #[external]
        fn set_approval_for_all(operator: felt, approved: felt) {
        }

        #[external]
        fn get_approved(tokenId: u256) -> felt {
        }

        #[external]
        fn is_approved_for_all(owner: felt, operator: felt) -> felt {
        }
  
    
    }
}