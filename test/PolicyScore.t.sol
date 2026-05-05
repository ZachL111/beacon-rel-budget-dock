// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "../src/PolicyScore.sol";

contract PolicyScoreTest {
    function test_case_1() public pure {
        PolicyScore scorer = new PolicyScore();
        PolicyScore.Signal memory signal = PolicyScore.Signal(92, 80, 12, 17, 4);
        require(scorer.score(signal) == 163, "score mismatch");
        require(scorer.accepted(signal) == false, "decision mismatch");
    }
    function test_case_2() public pure {
        PolicyScore scorer = new PolicyScore();
        PolicyScore.Signal memory signal = PolicyScore.Signal(88, 77, 19, 19, 4);
        require(scorer.score(signal) == 128, "score mismatch");
        require(scorer.accepted(signal) == false, "decision mismatch");
    }
    function test_case_3() public pure {
        PolicyScore scorer = new PolicyScore();
        PolicyScore.Signal memory signal = PolicyScore.Signal(90, 90, 27, 11, 11);
        require(scorer.score(signal) == 183, "score mismatch");
        require(scorer.accepted(signal) == false, "decision mismatch");
    }
}
