import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

    const PZT_Address = "0xBa851Fc4EcD66aa37fF7EF72294245E373ea9BbC";
    const NGT_Address = "0xC6693a35ACD5a5c1A17c8ac6b2039612Dde7Ed83"; 

const PizzaIceStoreModule = buildModule("PizzaIceStoreModule", (m) => {

    const store = m.contract("PizzaToken", [PZT_Address, NGT_Address]);

    return { store };
});

export default PizzaIceStoreModule;

