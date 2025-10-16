# JohnnyCoin Smart Contract

A fungible token smart contract built on Stacks blockchain using Clarity language.

## Overview

JohnnyCoin (JCN) is a fungible token implementation that provides standard token functionality including minting, burning, and transferring tokens. The contract follows Stacks fungible token standards and includes proper access controls.

## Token Details

- **Name**: JohnnyCoin
- **Symbol**: JCN  
- **Decimals**: 6
- **Initial Supply**: 1,000,000,000,000 tokens (1 trillion)

## Features

- ✅ Standard fungible token implementation
- ✅ Mint new tokens (owner only)
- ✅ Burn existing tokens  
- ✅ Transfer tokens between accounts
- ✅ Query balances and total supply
- ✅ Access control for administrative functions

## Contract Functions

### Read-Only Functions

#### `get-name`
Returns the token name.
```clarity
(get-name)
```

#### `get-symbol`  
Returns the token symbol.
```clarity
(get-symbol)
```

#### `get-decimals`
Returns the number of decimal places.
```clarity
(get-decimals)
```

#### `get-balance`
Returns the token balance for a given principal.
```clarity
(get-balance principal)
```

#### `get-total-supply`
Returns the total token supply.
```clarity
(get-total-supply)
```

### Public Functions

#### `transfer`
Transfer tokens from one account to another.
```clarity
(transfer amount from-principal to-principal memo)
```

#### `mint` (Owner Only)
Mint new tokens to a specified account.
```clarity
(mint amount to-principal)
```

#### `burn`
Burn tokens from a specified account.
```clarity
(burn amount from-principal)
```

## Error Codes

- `u100` - ERR-OWNER-ONLY: Only contract owner can perform this action
- `u101` - ERR-NOT-TOKEN-OWNER: Caller is not the token owner
- `u102` - ERR-INSUFFICIENT-BALANCE: Insufficient token balance
- `u103` - ERR-INVALID-AMOUNT: Amount must be greater than zero

## Development

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet) - Stacks smart contract development toolchain
- Node.js (for testing)

### Installation

```bash
# Clone the repository
git clone <repository-url>
cd johnnycoin

# Install dependencies
npm install
```

### Testing

Run the test suite:
```bash
npm test
```

Check contract syntax:
```bash
clarinet check
```

### Deployment

#### Local Development
```bash
# Start local devnet
clarinet devnet start

# Deploy contract
clarinet devnet deploy --manifest-path Clarinet.toml
```

#### Testnet Deployment
1. Update `settings/Testnet.toml` with your account details
2. Deploy using:
```bash
clarinet publish --testnet
```

#### Mainnet Deployment  
1. Update `settings/Mainnet.toml` with your account details
2. Deploy using:
```bash
clarinet publish --mainnet
```

## Usage Examples

### Transfer Tokens
```clarity
;; Transfer 1000 tokens from sender to recipient
(contract-call? .johnnycoin transfer u1000000 tx-sender 'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7 none)
```

### Check Balance
```clarity
;; Check balance of an account
(contract-call? .johnnycoin get-balance 'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7)
```

### Mint Tokens (Owner Only)
```clarity
;; Mint 5000 tokens to an account
(contract-call? .johnnycoin mint u5000000000 'SP2J6ZY48GV1EZ5V2V5RB9MP66SW86PYKKNRV9EJ7)
```

## Security Considerations

- Only the contract owner can mint new tokens
- Users can only transfer/burn tokens they own
- All amounts are validated to be greater than zero
- Proper access controls are enforced throughout

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality  
5. Ensure all tests pass
6. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For questions or support, please open an issue on the GitHub repository.