import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";




const PizzaTokenModule = buildModule("PizzaTokenModule", (m) => {

    const token = m.contract("PizzaToken", [100]);

    return { token };
});

export default PizzaTokenModule;
