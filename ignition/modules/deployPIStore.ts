import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";




const PizzaIceStoreModule = buildModule("PizzaIceStoreModule", (m) => {
    const NGT_Address = "0x126F143DF1d8DE7f519357eB7D7F8440E31f3321";
    const PZT_Address = "0x604383A590e0E389557710d0Fce1Ff94441bd27d";

    const token = m.contract("PizzaIceStore", [PZT_Address, NGT_Address]);

    return { token };
});

export default PizzaIceStoreModule;
