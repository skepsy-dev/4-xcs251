// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;


contract blockWise {

    mapping(address => mapping(address => uint)) public ious;

    function add_IOU(address _creditor, uint _iou, ??? cycleexist???) public {
        
        //  check if cycle exists if not add iou if yes remove ious from cycle
        ious[msg.sender][_creditor] += _iou;
    }

    function remove_IOU(address _debtor, address _creditor, uint _iou) public {
        ious[_debtor][_creditor] -= _iou;
    }

    function lookup(address _debtor, address _creditor) public view returns (uint) {
        return ious[_debtor][_creditor];
    }


}