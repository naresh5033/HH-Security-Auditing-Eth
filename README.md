# What is an Audit?

An audit is a security focused code review for looking for issues with your code.

# Help your auditors!

When writing good code, you 100% need to follow these before sending you code to an audit.

[Tweet from legendary security expert Tincho](https://twitter.com/tinchoabbate/status/1400170232904400897)

- Add comments
  - This will help your auditors understand what you're doing.
- Use [natspec](https://docs.soliditylang.org/en/v0.8.11/natspec-format.html)
  - Document your functions. DOCUMENT YOUR FUNCTIONS.
- Test
  - If you don't have tests, and test coverage of all your functions and lines of code, you shouldn't go to audit. If your tests don't pass, don't go to audit.
- Be ready to talk to your auditors
  - The more communication, the better.
- Be prepared to give them plenty of time.
  - They literally pour themselves over your code.

> "At this time, there are 0 good auditors that can get you an audit in under a week. If an auditor says they can do it in that time frame, they are either doing you a favor or they are shit. " - Patrick Collins, March 4th, 2022

# Process

An auditors process looks like this:

1. Run tests
2. Read specs/docs
3. Run fast tools (like slither, linters, static analysis, etc)
4. Manual Analysis
5. Run slow tools (like echidna, manticore, symbolic execution, MythX)
6. Discuss (and repeat steps as needed)
7. Write report ([Example report](https://github.com/transmissions11/solmate/tree/main/audits))

Typically, you organize reports in a chart that looks like this:

![impact image](images/impact.png)

# Resources

These are some of the best places to learn even MORE about security:

PRs welcome to improve the list.

## Tools

- [Slither](https://github.com/crytic/slither)
  - Static analysis from Trail of Bits.
- [Echidna](https://github.com/crytic/echidna)
  - Fuzzing from Trail of Bits.
- [Manticore](https://github.com/trailofbits/manticore)
  - Symbolic execution tool from Trail of Bits.
- [MythX](https://mythx.io/)
  - Paid service for smart contract security.
- [Mythrill](https://github.com/ConsenSys/mythril)
  - MythX free edition.
- [ETH Security Toolbox](https://github.com/trailofbits/eth-security-toolbox)
  - Script to create docker containers configured with Trail of Bits security tools.
- [ethersplay](https://github.com/crytic/ethersplay)
  - ETH Disassembler
- [Consensys Security Tools](https://consensys.net/diligence/tools/)
  - A list of Consensys tools.

## Games

- [Ethernaut](https://ethernaut.openzeppelin.com/) (This is a must play!)
- [Damn Vulnerable Defi](https://www.damnvulnerabledefi.xyz/) (This is a must play!)

## Blogs

- [rekt](https://rekt.news/)
  - A blog that keeps up with all the "best" hacks in the industry.
- [Trail of bits blog](https://blog.trailofbits.com/)
  - Learn from one of the best auditors in the space.
- [Openzeppelin Blog](https://blog.openzeppelin.com/)
  - Another blog of one of the best auditors in the space.

## Audit Examples:

- [Openzeppelin](https://blog.openzeppelin.com/fei-audit-2/)
- [Sigma Prime](https://tracer.finance/radar/sigma-prime-audit/)
- [Trail of Bits](https://alephzero.org/blog/trail-of-bits-audit-security/)

## Articles

- [Smart Contract Security Best Practices](https://consensys.github.io/smart-contract-best-practices/)
  - Consensys blog on security vulnerabilities. Also [check out their tools.](https://consensys.net/diligence/tools/)
- [Chainlink X Certik Blog on Security](https://www.certik.com/resources/blog/technology/top-10-defi-security-best-practices)
  - I helped write this. 😊
- [More attacks](https://consensys.github.io/smart-contract-best-practices/attacks/denial-of-service/)

# Getting Started

## Requirements

- [Git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [Nodejs](https://nodejs.org/en/)
  - You'll know you've installed nodejs right if you can run:
    - `node --version` and get an ouput like: `vx.x.x`
- [Yarn](https://classic.yarnpkg.com/lang/en/docs/install/) instead of `npm`
  - You'll know you've installed yarn right if you can run:
    - `yarn --version` and get an output like: `x.x.x`
    - You might need to install it with npm
- [Docker](https://docs.docker.com/get-docker/)
  - You'll know you've installed docker right if you can run:
  - `docker --version` and get an ouput like `Docker version xx.xx.xx, build xxxxx`

## Quickstart

```
git clone https://github.com/PatrickAlphaC/hardhat-security-fcc
cd hardhat-security-fcc
yarn
```

Then, go right into [usage](#usage)

## No Typescript Support

Sorry! Feel free to make a PR if you'd like to see typescript here.

### Optional Gitpod

If you can't or don't want to run and install locally, you can work with this repo in Gitpod. If you do this, you can skip the `clone this repo` part.

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#github.com/PatrickAlphaC/hardhat-security-fcc)

# Usage

## Slither

Open the docker shell:

```
yarn toolbox
```

Then, run:

```
slither /src/contracts/ --solc-remaps @openzeppelin=/src/node_modules/@openzeppelin --exclude naming-convention,external-function,low-level-calls
```

To exit:

```
exit
```
```pip3 install solc-select```
```solc-select use 0.8.7``` -> to use the solc version 0.8.7
```pip3 install slither-analyzer```
```slither --help```
to run slither on our contracts --> ```slither": "slither . --solc-remaps '@openzeppelin=node_modules/@openzeppelin @chainlink=node_modules/@chainlink' --exclude naming-convention,external-function,low-level-calls``` --> added in our scripts

```yarn slither``` --> once we run the slither points out no.of potential vulnerabilities in our contract, "RED🟥" - high impact error which we definitely should ve to address, the greens🟩 - less impact, and kinda warning.\

This static analysis tool straight away finds the two most vulnerable contracts 1.metamorphic and 2.Reentrancy, but yet this tool didn't catch the other 3 contract's prob this is why we don't wwana rely only on the static analysis tools.

## Echidna
The Echidna is slow testing (unlike slither), or also called sybolic execution tool, trail of bits tool for fuzz testing(automation testing).\
we wana be able to provide rand data and rand info to our tests and see if wierd happens that we weren't expecting.
Our Fuzz test is VaultFuzzTest.sol(/test/contracts)
in our Vault.sol --> we wrote it like nobody should ever know our p/w and no one should unlock this contract (as we know anyone can read anything from the storage var in BC). so know this might actually fails.\
But it might be hard to write a test for this, so we write a fuzz test to do this. --> VaultFuzzTest.sol -> this will send ton of rand data(P/w) to the vault.sol to  vault contract to tryna make s_locked == false
Open the docker shell:

```
yarn toolbox
```

Then, run this:

```
echidna-test /src/contracts/test/fuzzing/VaultFuzzTest.sol --contract VaultFuzzTest --config /src/contracts/test/fuzzing/config.yaml
```

To exit:

```
exit
```

## Eth Security ToolBox 

which has all the security tool box in one single container(Echnidna, manticore, etheno, manticore, slither, Rattle, Not So Smart Contract repo), To work with this we need to install docker --> ```docker run -it --rm -v $PWD:/src trailofbits/eth-security-toolbox``` or put that in the script and run 
```yarn toolbox``` -- Once we had this setup it will stick us to a new shell,to work with any of those tools out of the box.\

The VaultFuzzTest.sol comes with yaml file as well, which has info abt how many test we wana run, delay, and also has some remapping.\

To run the echidna test ```echidna-test /src/contracts/test/fuzzing/VaultFuzzTest.sol --contract VaultFuzzTest --config /src/contracts/test/fuzzing/config.yaml``` Once we run the test we can see it almost took a sec to find the p/w, to unlock our contract. this is why running a fuzz tester can be powerful.\


# Linting

To check linting / code formatting:

```
yarn lint
```

or, to fix:

```
yarn lint:fix
```

# Formatting

```
yarn format
```


