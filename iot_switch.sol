pragma solidity ^0.4.21;

// smart switch to turn on/off signal emitted from IoT machine by contract
contract IoTSwitch{

  // owner
  address public owner;

  // user
  struct User {
    address user;
    uint deadline;
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
  mapping (uint => User) private mapUser;
  uint public numPay;

  // constructor
  function IoTSwitch(address _iot) public{
    owner = msg.sender;
    numPay = 0;
    iot = _iot;
  }

  // to use iot machine
  function useIot() public payable{
    require(msg.value == 1000000000000000000);

    mapUser[0].user = msg.sender;
    mapUser[0].deadline = now + 300;
    mapUser[0].status = true;

    numPay++;
  }

  // to stop IoT machine
  function stopIot() public onlyIot{
    if(now > mapUser[numPay].deadline){
      mapUser[numPay].status = false;
    }
  }

  // withdraw balance by onlyOwner
  function withdraw() public onlyOwner(){
    owner.transfer(address(this).balance);
  }


}
