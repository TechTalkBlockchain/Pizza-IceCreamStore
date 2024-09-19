// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract PizzaIceStore {
    IERC20 public pizzaToken;
    IERC20 public nairaToken; // Naira-backed token (or any other token)
    address public owner;

    uint256 public pizzaPrice = 1 * 10**18; // 1 PZT tokens
    uint256 public iceCreamPrice = 2 * 10**18; // 2 PZT tokens
    uint256 public nairaToPizzaRate = 2; //1 NGT = 2 PZTs

    event Purchase(address indexed buyer, string item, uint256 amount);
    event Swap(address indexed swapper, uint256 nairaAmount, uint256 pizzaTokenAmount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor(IERC20 _pizzaToken, IERC20 _nairaToken) {
        pizzaToken = _pizzaToken;
        nairaToken = _nairaToken;
        owner = msg.sender;
    }


    function buyPizza() public {
        require(pizzaToken.transferFrom(msg.sender, address(this), pizzaPrice), "Payment failed");
        emit Purchase(msg.sender, "Pizza", pizzaPrice);
    }

    function buyIceCream() public {
        require(pizzaToken.transferFrom(msg.sender, address(this), iceCreamPrice), "Payment failed");
        emit Purchase(msg.sender, "Ice Cream", iceCreamPrice);
    }

    // Swap Naira-backed token for PizzaToken
    function swapNairaForPizza(uint256 nairaAmount) public {
      
        uint256 pizzaTokenAmount = nairaAmount * nairaToPizzaRate;

        // Transfer NairaToken from the user to the contract
        require(nairaToken.transferFrom(msg.sender, address(this), nairaAmount), "NairaToken transfer failed");

        // Send equivalent PizzaTokens to the user
        require(pizzaToken.transfer(msg.sender, pizzaTokenAmount), "PizzaToken transfer failed");

        emit Swap(msg.sender, nairaAmount, pizzaTokenAmount);
    }

    function withdrawTokens(IERC20 token, uint256 amount) public onlyOwner {
        require(token.transfer(owner, amount), "Withdraw failed");
    }

    function updatePrices(uint256 _pizzaPrice, uint256 _iceCreamPrice) public onlyOwner {
        pizzaPrice = _pizzaPrice;
        iceCreamPrice = _iceCreamPrice;
    }

    function updateSwapRate(uint256 _nairaToPizzaRate) public onlyOwner {
        nairaToPizzaRate = _nairaToPizzaRate;
    }
}
