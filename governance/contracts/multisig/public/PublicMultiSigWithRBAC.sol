pragma solidity ^0.6.0;

import "./PublicMultiSig.sol";


/**
 * @title PublicMultiSigWithRBAC
 * @dev PublicMultiSigWithRBAC contract
 * @author Cyril Lapinte - <cyril@openfiz.com>
 
 * SPDX-License-Identifier: MIT
 *
 * Error messages
 * PMSWR01: msg.sender is not a suggester
 * PMSWR02: msg.sender is not an approver
 * PMSWR03: msg.sender is not an executer
 *
 * TODO  get these errors to be verified under the strict conditions using the scribble assertions 
 * VVIMP : Scribble only allows function calls to pure and view functions.
 * so thus only  to verify these functions in the starts .
 */
contract PublicMultiSigWithRBAC is PublicMultiSig {

 
 
 /** @title adding the tests using scribble framework .
 *@author Dhruv Malik - GrandGarcon (github)
  @dev check the functions in https://docs.scribbles.codes 
  */
  
  
  struct ParticipantRBAC {
    bool suggester;
    bool approver;
    bool executer;
  }
  mapping(address => ParticipantRBAC) internal participantRBACs;

  /**
   * @dev Modifier for suggester only
   */
  /// if_succeeds {:msg "Msg.sender is not suggestor"} participantRBACs[msg.sender].suggester == "PMSWR01"
  modifier onlySuggester() {
    require(participantRBACs[msg.sender].suggester, "PMSWR01");
    _;
  }

  /**
   * @dev Modifier for approver only
   */
  /// if_succeeds {:msg "Msg.sender is not suggestor"} participantRBACs[msg.sender].approver == "PMSWR02"

  modifier onlyApprover() {
    require(participantRBACs[msg.sender].approver, "PMSWR02");
    _;
  }

  /**
   * @dev Modifier for executer only
   */
  /// if_succeeds {:msg "Msg.sender is not suggestor"} participantRBACs[msg.sender].executor == "PMSWR03"

  modifier onlyExecuter() {
    require(participantRBACs[msg.sender].executer, "PMSWR03");
    _;
  }

  /**
   * @dev constructor
   **/
  constructor(
    uint256 _threshold,
    uint256 _duration,
    address[] memory _participants,
    uint256[] memory _weights,
    bool[] memory _suggesters,
    bool[] memory _approvers,
    bool[] memory _executers)
     /// Starting with basic Properties
     /// if_succeeds {:msg "update-roles-possible"} _threshold > 0;
     /// if_succeeds {:msg "update-roles-possible"} _ duration > 0;  
     /// if_succeeds {:msg "update-roles-possible"} _participants > 0;
    public PublicMultiSig(_threshold, _duration, _participants, _weights)
  {
    updateManyParticipantsRoles(
      _participants,
      _suggesters,
      _approvers,
      _executers
    );
  }

  /**
   * @dev is the participant a suggeester
   */

  function isSuggester(address _address)
    public view returns (bool)
  {
    return participantRBACs[_address].suggester;
  }

  /**
   * @dev is the participant an approver
   */
   /// if_succeeds {:msg "the entity has approval authority "} participantRBACs[_address].approver == True;
  function isApprover(address _address) public view returns (bool) {
    return participantRBACs[_address].approver;
  }

  /**
   * @dev is the participant an executer
   */
  
  /// if_succeeds {:msg "the entity has authority to execute"} participantRBACs[_address].executor == True;
  
  function isExecuter(address _address) public view returns (bool) {
    return participantRBACs[_address].executer;
  }

  /**
   * @dev execute the transaction.
   * now here we can check for diffrent possiblities ,
   * 1. 
   */
  // if_succeeds {:msg "Successfull execution "} requireparticipantRBACs[msg.sender]. == "PMSWR01"

  function execute(uint256 _transactionId) public override onlyExecuter returns (bool) {
    return super.execute(_transactionId);
  }

  /**
   * @dev suggest a new transaction
   */
  function suggest(
    address payable _destination,
    uint256 _value,
    bytes memory _data) public override onlySuggester returns (bool)
  {
    return super.suggest(_destination, _value, _data);
  }

  /**
   * @dev approve a transaction
   */
  function approve(
    uint256 _transactionId) public override onlyApprover returns (bool)
  {
    return super.approve(_transactionId);
  }

  /**
   * @dev revoke a transaction approval
   */
  function revokeApproval(
    uint256 _transactionId) public override onlyApprover returns (bool)
  {
    return super.revokeApproval(_transactionId);
  }

  /**
   * @dev add many participants with roles
   */
   /// if_succeeds {:msg "P0"} 
  function updateManyParticipantsRoles(
    address[] memory _participants,
    bool[] memory _suggesters,
    bool[] memory _approvers,
    bool[] memory _executers) public onlyOperator returns (bool)
  {  
    for (uint256 i = 0; i < _participants.length; i++) {
      ParticipantRBAC storage participantRBAC = participantRBACs[_participants[i]];
      participantRBAC.suggester = _suggesters[i];
      participantRBAC.approver = _approvers[i];
      participantRBAC.executer = _executers[i];
    
      emit ParticipantRolesUpdated(
        _participants[i],
        _suggesters[i],
        _approvers[i],
        _executers[i]
      );
    }

    return true;
  }

  event ParticipantRolesUpdated(
    address indexed participant,
    bool _suggester,
    bool _approver,
    bool _executer
  );
}
