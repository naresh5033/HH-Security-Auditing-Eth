// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
import "@openzeppelin/contracts/proxy/utils/Initializable.sol";

//here we've metamorphic proxy, the issue here is this is initiazilable 
//but we don't guarnateed that this is initialized 
contract MetamorphicContract is Initializable {
    address payable owner;

    function kill() external {
        require(msg.sender == owner);
        selfdestruct(owner);
    }
}
//actually this contract was never initialized, the massive issue here is if we deploy this
//somebody could actually initialize this and become a owner of this and can eventually kill(), destroy the contract