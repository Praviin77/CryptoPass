const hre = require("hardhat");

async function main() {
  const Subscription = await hre.ethers.getContractFactory("Subscription");

  const contract = await Subscription.deploy();

  await contract.waitForDeployment();

  console.log("Subscription deployed to:", await contract.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});