// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "../../Vault.sol";
//this fuzz test to find the p/w that stored in the vaul.sol
contract VaultFuzzTest is Vault {
    constructor() Vault("123asd123") {}
    //this fn will send ton of p/w to the vault contract to tryna make "s_locked == false"
    function echidna_test_find_password() public view returns (bool) {
        return s_locked == true;
    }
}