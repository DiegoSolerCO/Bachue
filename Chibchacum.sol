// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Chibchacum is ERC721, ERC721URIStorage, Ownable {
    struct Bono {
        string name;
        uint256 value;
    }

    uint256 private _tokenIdCounter;
    mapping(uint256 => Bono) private _bonos;

    constructor() ERC721("Chibchacum", "CHB") {}

    function createBono(string memory name, uint256 value, string memory tokenURI) public onlyOwner {
        _tokenIdCounter = _tokenIdCounter + 1;
        uint256 newTokenId = _tokenIdCounter;
        _mint(owner(), newTokenId);
        _setTokenURI(newTokenId, tokenURI);
        _bonos[newTokenId] = Bono(name, value);
    }

    function getBono(uint256 tokenId) public view returns (Bono memory) {
        require(_exists(tokenId), "Chibchacum: Token no existe");
        return _bonos[tokenId];
    }

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
        return super.tokenURI(tokenId);
    }
}
