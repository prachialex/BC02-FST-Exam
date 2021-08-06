pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/Counters.sol";

contract JPCToken is ERC721 {
     using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    address receiver;
    address symbiosis;
    string course_name;
    string issuing_date;
    string receiver_name;
   
    enum Certificate_type {degree, Bootcamp, diploma}
    Certificate_type ctype;

    constructor (
        string memory _course_name,
        string memory _issuing_date,
        string memory _receiver_name) ERC721("J.P. Morgan Certificates","JPC") 
    {
        course_name=_course_name;
        issuing_date=_issuing_date;
        receiver_name=_receiver_name;
        ctype=Certificate_type.Bootcamp;
        symbiosis = msg.sender;
    }
    function issueToken(address _receiver) public payable returns (uint256)
    {
        require(msg.sender == symbiosis);
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();
        _safeMint(_receiver, newTokenId);
        return newTokenId;
    }
}
