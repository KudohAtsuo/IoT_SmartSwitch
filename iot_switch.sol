pragma solidity ^0.4.21;

// smart switch to turn on/off signal emitted from IoT machine by contract
contract IoTSwitch{

  // owner
  address public owner;

  // user
  struct User {
    address user;
    uint deadlint;
    bool status;
  }

  // IoTSwitch
  address public iot;


  // modifire owner
  modifier onlyOwner() {
    owner = msg.sender;
    _;
  }

  // modifier IoT
  modifier onlyIot{
    iot = msg.sender;
    _;
  }

  // mapping number to struct
  mapping (uint => User) mapUser public;
  uint public numPay;

  // constructor
  function IoTSwitch(address _iot){
    owner = msg.sender;
    numPay = 0;
    iot = _iot;
  }

  // to use iot machine
  function useIot(address _user) public payable{
    require(msg.value == 1000000000000000000);

    mapUser[0].user = msg.sender;
    mapUser[0].deadline = now + 300;
    mapUser[0].status = true;

    numPay++;
  }

  // to stop IoT machine 


}
