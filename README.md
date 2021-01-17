[![Build Status](https://circleci.com/gh/c-layer/contracts.svg?style=shield)](https://circleci.com/gh/c-layer/contracts)
[![Common Coverage Status](https://codecov.io/gh/c-layer/contracts/graph/badge.svg)](https://codecov.io/gh/c-layer/contracts)


# Compliance Layer SmartContracts

Welcome to the C-Layer Ethereum monorepo.

## Purpose

Provide an administrable layer over the Ethereum blockchain protocol.

One of the foremost use case is the support of regulated asset classes and financial services.

## Content

This repository is a monorepos of the different component of the projects.

  - Common: contains the core and security architectures among other utilities
  - Oracle: contains an oracle
  - Token: contains the token core, all token delegates, a token factory with their own default configurations
  - Distribution: contains tokensale and vault contracts
  - Governance: contains voting and multisig contracts

Also all of the contracts functions  are  being audited using the [Consensys Scribble Framework](docs.scribbles.code) which allows to mention the conditions concerning the return values of the functions and other variables ( also called as assertion checking modes) which allows the contract to be converted to the 
 
  there are following steps are needed to be completed in order to get the required analysis 

  1. writing the statements corresponding to the expressions and the properties  that are to be evaluated in the function 



# Requirements 

Install the right version of node.js (between 10.0.0 to 12.0.0) / NPM .

