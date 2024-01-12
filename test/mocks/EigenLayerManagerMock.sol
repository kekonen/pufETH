// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

import { IEigenLayer, QueuedWithdrawal } from "src/interface/EigenLayer/IEigenLayer.sol";
import { IERC20 } from "openzeppelin/token/ERC20/IERC20.sol";
import { IStrategy } from "src/interface/EigenLayer/IStrategy.sol";

contract EigenLayerManagerMock is IEigenLayer {
    function depositIntoStrategy(IStrategy strategy, IERC20 token, uint256 amount) external returns (uint256 shares) { }

    function queueWithdrawal(
        uint256[] calldata strategyIndexes,
        IStrategy[] calldata strategies,
        uint256[] calldata shares,
        address withdrawer,
        bool undelegateIfPossible
    ) external returns (bytes32) { }

    function completeQueuedWithdrawal(
        QueuedWithdrawal calldata queuedWithdrawal,
        IERC20[] calldata tokens,
        uint256 middlewareTimesIndex,
        bool receiveAsTokens
    ) external { }
}