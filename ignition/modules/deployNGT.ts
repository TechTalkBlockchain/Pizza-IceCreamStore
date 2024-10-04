import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";




const NairaTokenModule = buildModule("NairaTokenModule", (m) => {

    const token = m.contract("NairaToken", [100]);

    return { token };
});

export default NairaTokenModule;
