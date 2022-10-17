// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;


contract blockWise {

    mapping(address => mapping(address => uint)) private ious;

    function add_IOU(address _creditor, uint _iou, address[] memory cycle) public {
        if (cycle.length <= 0) {
            ious[msg.sender][_creditor] += _iou;
        } 
        if (cycle.length > 0) {
            ious[cycle[0]][cycle[1]] -= _iou;
            ious[cycle[1]][cycle[2]] -= _iou;
            ious[cycle[2]][cycle[0]] -= _iou;
        }
    }

    // function remove(address _creditor,uint _iou) {
        
    // }


    function lookup(address _debtor, address _creditor) public view returns (uint) {
        return ious[_debtor][_creditor];
    }

}