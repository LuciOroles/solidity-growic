// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Base1 {
    event ConstructorEvent1(string str);
    constructor() {
        emit ConstructorEvent1("Base 1, ctr");
    }

    function foo() public virtual returns (bytes32) {
        return "Base2Foo";
    }
}


contract Base2 {
    event ConstructorEvent2(string str);
    constructor() {
        emit ConstructorEvent2("Base 2, ctr");
    }

    function foo() public virtual returns (bytes32) {
        return "Base2Foo";
    }
}

contract Derived is Base2, Base1 {
    event ConstructorEventD(string str);
    // call order Base2>Base1>Derived
    constructor( ) Base2() Base1() {
        emit ConstructorEventD("Derived, ctr");
    }

    function foo() public override (Base1, Base2) returns (bytes32) {
       return super.foo();
    }
}

abstract contract Feline {
    function utterance() public virtual returns (bytes32);
}

contract Cat is Feline {
    function utterance() public pure override returns(bytes32) {
        return "Test";
    }
}