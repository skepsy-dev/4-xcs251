// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;


contract blockWise {

    mapping(address => mapping(address => uint)) private ious;

    function add_IOU(address _creditor, uint _iou) external {
        
        ious[msg.sender][_creditor] += _iou;
    }


    function lookup(address _debtor, address _creditor) external view returns (uint) {
        return ious[_debtor][_creditor];
    }

}