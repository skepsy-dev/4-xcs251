// Please paste your contract's solidity code here
// Note that writing a contract here WILL NOT deploy it and allow you to access it from your client
// You should write and develop your contract in Remix and then, before submitting, copy and paste it here

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
pragma experimental ABIEncoderV2;


contract blockWise {

    mapping(address => mapping(address => uint)) private ious;

    function add_IOU(address _creditor, uint _iou, address[] memory cycle, bool cyclexist) external {
        
        ious[msg.sender][_creditor] += _iou;
        
       if (cyclexist != false) { 
            uint cycleAmount = 10000;
            uint lastIndex = cycle.length-1;

            for (uint i = 0; i < cycle.length; i++) {
                uint newAmount = ious[cycle[i]][cycle[i + 1]];
                if (i != lastIndex) {
                    if (newAmount < cycleAmount) {
                        cycleAmount = newAmount;
                    }
                } else if (ious[cycle[i]][cycle[0]] < cycleAmount) {
                    cycleAmount = ious[cycle[i]][cycle[0]];
                }
            }
            for (uint i = 0; i < cycle.length; i++) {
               
                if (i != lastIndex) {
                ious[cycle[i]][cycle[i + 1]] -= cycleAmount;
                } else {
                    ious[cycle[i]][cycle[0]] -= cycleAmount;
                }             
            }
        } 
    }


    function lookup(address _debtor, address _creditor) external view returns (uint) {
        return ious[_debtor][_creditor];
    }

}