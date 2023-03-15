// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract EcoBono is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address private _platformOwner;

    struct EcoBonoData {
        uint256 tokenId;
        string projectName;
        uint256 emissionReduction;
        string monitoringDataURI;
    }

    mapping(uint256 => EcoBonoData) private _ecoBonoData;

    event EcoBonoCreated(uint256 indexed tokenId, string projectName, uint256 emissionReduction, string monitoringDataURI);

    constructor() ERC721("EcoBono", "ECB") {
        _platformOwner = msg.sender;
    }

    function createEcoBono(
        address to,
        string memory projectName,
        uint256 emissionReduction,
        string memory monitoringDataURI
    ) public returns (uint256) {
        require(msg.sender == _platformOwner, "Only platform owner can create new EcoBonos");
        _tokenIds.increment();
        uint256 newTokenId = _tokenIds.current();

        _mint(to, newTokenId);
        _setTokenURI(newTokenId, monitoringDataURI);

        EcoBonoData memory newEcoBonoData = EcoBonoData({
            tokenId: newTokenId,
            projectName: projectName,
            emissionReduction: emissionReduction,
            monitoringDataURI: monitoringDataURI
        });

        _ecoBonoData[newTokenId] = newEcoBonoData;

        emit EcoBonoCreated(newTokenId, projectName, emissionReduction, monitoringDataURI);

        return newTokenId;
    }

    function getEcoBonoData(uint256 tokenId) public view returns (EcoBonoData memory) {
        require(_exists(tokenId), "Token ID does not exist");
        return _ecoBonoData[tokenId];
    }

    function platformOwner() public view returns (address) {
        return _platformOwner;
    }

    function setPlatformOwner(address newPlatformOwner) public {
        require(msg.sender == _platformOwner, "Only platform owner can change ownership");
        _platformOwner = newPlatformOwner;
    }
}
