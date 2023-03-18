// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Chiminigagua is ERC1155, Ownable {
    struct Producto {
        string name;
        string description;
        uint256 carbonFootprint;
    }

    uint256 private _tokenIdCounter;
    mapping(uint256 => Producto) private _productos;

    constructor() ERC1155("https://token.com/api/token/{id}.json") {}

    function createProducto(string memory name, string memory description, uint256 carbonFootprint) public onlyOwner {
        _tokenIdCounter = _tokenIdCounter + 1;
        uint256 newTokenId = _tokenIdCounter;
        _mint(owner(), newTokenId, 1, "");
        _productos[newTokenId] = Producto(name, description, carbonFootprint);
    }

    function getProducto(uint256 tokenId) public view returns (Producto memory) {
        require(_productos[tokenId].carbonFootprint != 0, "Chiminigagua: Token no existe");
        return _productos[tokenId];
    }
}
