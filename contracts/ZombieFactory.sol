pragma solidity ^0.4.18;

contract ZombieFactory {
    event NewZombie(uint id, string name, uint dna);

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    Zombie[] public zombies;

    struct Zombie {
        string name;
        uint dna;
    }

    function createRandomZombie(string _name) public {
        uint randDna = _generateRandomDna(_name);
        _createZombie(_name, randDna);
    }

    function _createZombie(string _name, uint _dna) private {
        uint id = zombies.push(Zombie(_name, _dna));
        NewZombie(id, _name, _dna);
    } 

    function _generateRandomDna(string _str) private view returns (uint) {
        return uint(keccak256(_str)) % dnaModulus;
    }
}