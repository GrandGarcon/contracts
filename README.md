[![Build Status](https://circleci.com/gh/c-layer/contracts.svg?style=shield)](https://circleci.com/gh/c-layer/contracts)
[![Common Coverage Status](https://codecov.io/gh/c-layer/contracts/graph/badge.svg)](https://codecov.io/gh/c-layer/contracts)


# Assertion testing on  Compliance Layer SmartContracts using [scribble](https://docs.scribble.codes/) 

this repo is forked from the C-layer for creating an example for generating  annotated files for C-layer smart contracts and then using scribble to generate the instrumented code , this then can be input to the automated fuzzing analyzers ( oyente , 


## Purpose
to cover the specification / property based testing in the 
## Content

This repository is a monorepos of the different component of the projects.

  - Common: contains the core and security architectures among other utilities
  - Oracle: contains an oracle
  - Token: contains the token core, all token delegates, a token factory with their own default configurations
  - Distribution: contains tokensale and vault contracts
  - Governance: contains voting and multisig contracts

Also all of the contracts functions  are  being audited using the [Consensys Scribble Framework](docs.scribbles.code) which allows to mention the conditions concerning the return values of the functions and other variables ( also called as assertion checking modes) which allows the contract to be converted to the 
 
  there are following steps are needed to be completed in order to get the required analysis 

  1. writing the statements corresponding to the expressions and the properties  that are to be evaluated in the function ( while fullfilling the conditions of the function not being pure view only , as mentioned in the documentation  ) . 



# Requirements 

Install the right version of node.js (between 10.0.0 to 12.0.0) / NPM .

Install the eth-scribble as mentioned in the (placwe)[https://docs.scribble.codes/tool/installation]



## Todo 
  - integration of CI config to create docker job to run the instrumented code on the automated fuzzying tools 

