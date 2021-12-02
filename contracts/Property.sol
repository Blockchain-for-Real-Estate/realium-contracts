//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Property {

    event TokenListed(uint tokenId, uint32 listPrice);
    event TokenUnlisted(uint tokenId);
    event MakeOffer(uint offerId, uint32 offerPrice);
    event RetractOffer(uint offerId, uint32 offerPrice);
    event TokenTransfer(address from, address to, uint32 salePrice);

    struct Token {
        address currentOwner;
        uint32 originalTokenPrice;
        uint32 lastPurchasePrice;
        bool listed;
        uint32 listPrice;
    }

    struct Offer {
        address buyer;
        uint32 offerPrice;
        bool active;
    }

    string public propertyId;
    address private propertyOwner;
    uint public totalSupply;
    uint public circulatingSupply;
    Token[] private tokens;
    Offer[] private offers;
    mapping(address => uint) public addressToTokenCount;
    mapping(uint => address) public tokenToOwner;

    constructor(string memory _propertyId, address _propertyOwner, uint _totalSupply, uint _initialSupply, uint32 _pricePerShare ) {
        propertyId = _propertyId;
        totalSupply = _totalSupply;
        circulatingSupply = _initialSupply;
        propertyOwner = _propertyOwner;
        
        for(uint i = 1; i < _totalSupply; i++) {
            address _assignee;
            if (i < _initialSupply) {
                _assignee = _propertyOwner;
            } else {
                _assignee = msg.sender;
            }
            tokens.push(Token({
                currentOwner: _assignee,
                originalTokenPrice: _pricePerShare,
                lastPurchasePrice: _pricePerShare,
                listed: false,
                listPrice: 0
            }));
            tokenToOwner[i] = _assignee;
        }
    }

    modifier onlyAdmin() {
        _;
    }

    modifier onlyTokenOwner() {
        _;
    }

    modifier OnlyOfferBuyer() {
        _;
    }

    function getListings() external view returns(Token[] memory) {
        // TODO get the listings that are active and return them
    }

    function getOffers() external view returns(Offer[] memory) {
        // TODO get the offers that are active and return them
    }

    function getAddressTokens() external view returns(Token[] memory) {
        // TODO get any tokens that are the senders
    }

    function getAddressOffers() external view returns(Token[] memory) {
        // TODO get any offer that are the senders and are active
    }

    function getBalance() public view returns (uint) {
        return addressToTokenCount[msg.sender];
    }

    function getToken(uint _tokenId) public view returns (Token memory) {
        return tokens[_tokenId];
    }

    function listToken(uint _tokenId, uint32 _listPrice) public {
        // TODO list the token
    }

    function updateToken(uint _tokenId, uint32 _listPrice) public {
        // TODO list the token
    }

    function unlistToken(uint _tokenId, uint32 _listPrice) public {
        // TODO list the token
    }

    function makeOffer(uint32 _offerAmount) public {
        // TODO create the offer and move funds to smart contract
    }

    function updateOffer(uint _offerId, uint32 _offerAmount) public {
        // TODO update the offer and move funds accordingly
    }

    function retractOffer(uint _offerId) public {
        // TODO mark the offer as invalid and return funds
    }

    function buyListing(uint _listingId) public {
        // TODO buy the listing, change ownership, and payment
    }

    function acceptOffer(uint _listingId) public {
        // TODO accept the offer, change ownership, and payment
    }

    function releaseToken(uint _amount) public onlyAdmin {
        // TODO release the tokens to the propertyOwner
    }
}
