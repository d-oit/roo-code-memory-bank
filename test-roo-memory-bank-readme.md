# Roo Memory Bank Test Suite

## Overview

This test suite validates the functionality of the `roo-memory-bank.sh` script, which downloads and sets up the Roo Code Memory Bank system. The tests use BATS (Bash Automated Testing System) to ensure reliable and consistent script behavior.

## Prerequisites

### Installing BATS

Choose your platform:

#### Ubuntu/Debian
```bash
sudo apt-get install bats
```

#### macOS (using Homebrew)
```bash
brew install bats-core
```

#### Manual Installation
```bash
git clone https://github.com/bats-core/bats-core.git
cd bats-core
./install.sh /usr/local
```

## Test Structure

### Files
- `roo-memory-bank.sh` - Main script being tested
- `test-roo-memory-bank.bats` - Test suite
- `test-roo-memory-bank-readme.md` - This documentation

### Test Cases

1. **Script Existence**
   - Verifies script exists
   - Checks executable permissions

2. **Directory Creation**
   - Validates memory-bank directory creation

3. **File Downloads**
   - Checks all required files:
     - `.clinerules-*` files
     - `system-prompt-*.md` files
     - Memory bank documentation
     - `projectBrief.md`

4. **Error Handling**
   - Tests curl failure scenarios
   - Validates error messages

5. **Output Messages**
   - Verifies startup message
   - Checks completion messages
   - Validates next steps instructions

6. **URL Validation**
   - Ensures correct base URL usage
   - Validates download paths

## Running Tests

1. **Setup**
   ```bash
   chmod +x test-roo-memory-bank.bats
   ```

2. **Execute Tests**
   ```bash
   ./test-roo-memory-bank.bats
   ```

3. **Expected Output**
   ```
   ✓ Script exists and is executable
   ✓ memory-bank directory is created
   ✓ All required files are downloaded
   ✓ Script handles curl failures
   ✓ Script displays correct completion message
   ✓ Downloaded files have correct base URL

   6 tests, 0 failures
   ```

## Test Implementation Details

### Setup and Teardown
- Creates temporary test directory
- Mocks curl command
- Cleans up after tests

```bash
setup() {
    TEST_DIR="$(mktemp -d)"
    cp roo-memory-bank.sh "$TEST_DIR/"
    cd "$TEST_DIR"
}

teardown() {
    cd -
    rm -rf "$TEST_DIR"
}
```

### Mocking
The test suite uses mocking to avoid actual network calls:

```bash
# Curl mock for successful downloads
function curl() {
    echo "Mocked content" > "$2"
    return 0
}

# Curl mock for failure testing
function curl() {
    return 1
}
```

## File Validation

### Required Files
The test suite verifies the presence of:

```
.clinerules-architect
.clinerules-code
.clinerules-ask
system-prompt-architect.md
system-prompt-code.md
system-prompt-ask.md
memory-bank-roo-code-README.md
memory-bank-roo-code-developer-primer.md
projectBrief.md
```

### Directory Structure
Expected structure after successful execution:

```
project-root/
├── .clinerules-*
├── system-prompt-*.md
├── memory-bank-*.md
├── projectBrief.md
└── memory-bank/
```

## Troubleshooting

### Common Issues

1. **Permission Denied**
   ```bash
   chmod +x test-roo-memory-bank.bats
   chmod +x roo-memory-bank.sh
   ```

2. **BATS Not Found**
   ```bash
   # Verify BATS installation
   which bats
   
   # Reinstall if necessary
   sudo apt-get install --reinstall bats  # Ubuntu/Debian
   brew reinstall bats-core               # macOS
   ```

3. **Test Directory Issues**
   ```bash
   # Ensure write permissions
   sudo chmod 777 /tmp
   ```

### Debug Mode
Run tests with trace output:
```bash
bats --trace test-roo-memory-bank.bats
```

## Contributing

1. Fork the repository
2. Create new test cases
3. Verify all existing tests pass
4. Submit pull request

## Best Practices

1. **Test Independence**
   - Each test should be self-contained
   - Use setup/teardown for common operations

2. **Mock External Services**
   - Avoid real network calls
   - Simulate both success and failure cases

3. **Validation**
   - Check file contents where relevant
   - Verify error messages and exit codes

4. **Documentation**
   - Comment complex test logic
   - Update README with new test cases

## License

Same as the main project (Apache 2.0)