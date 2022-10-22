// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

library Array {
    function remove(uint256[] storage arr, uint256 index) public {
        require(arr.length > 0, "Cant remove from empty array");
        require(arr.length > index, "Invalid index");

        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract EncodeDecode {
    using Array for uint256[];

    uint256[] private arr = [0, 1, 2];

    function testArrayRemove(uint256 idx) public returns (uint256) {
        arr.remove(idx);
        return arr.length;
    }

    function basicEncoding(address _address, uint256 _uint)
        public
        pure
        returns (bytes memory)
    {
        return abi.encode(_address, _uint);
    }

    function basicDecode(bytes memory data)
        public
        pure
        returns (address _addr1, uint256 _number)
    {
        (_addr1, _number) = abi.decode(data, (address, uint256));
    }
}
