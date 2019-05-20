pragma solidity >=0.5.0 <0.6.0;

import "./MultiSig.sol";


/**
 * @title CancellableSig
 * @dev CancellableSig contract
 * @author Cyril Lapinte - <cyril.lapinte@gmail.com>
 *
 * Error messages
 */
contract CancellableSig is MultiSig {

  /**
   * @dev constructor
   */
  constructor(address[] memory _addresses, uint8 _threshold)
    public MultiSig(_addresses, _threshold)
  {} // solhint-disable-line no-empty-blocks

  /**
   * @dev cancel a non executed signature
   */
  function cancel() public onlySigners returns (bool) {
    updateReplayProtection();
  }
}
