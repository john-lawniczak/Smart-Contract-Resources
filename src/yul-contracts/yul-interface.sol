// SPDX-License-Identifier: MIT
interface ISimple {
    function whateverIwant() external view returns (uint256);
}
contract CallSimple {
    ISimple public target;

    error CallSimple__Failure();

    constructor(ISimple _target) {
        target = _target;
    }

    function callSimpleUnit() external view returns (uint256) {
        return target.whateverIwant();
    }

    function callString() external view returns (string memory) {
        (bool success, bytes memory result) = address(target).staticcall("");
       if (!success) {
            revert CallSimple__Failure();
       }
        return string(result);
    }
}