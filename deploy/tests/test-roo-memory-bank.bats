#!/usr/bin/env bats

setup() {
    # Create a temporary directory for testing
    TEST_DIR="$(mktemp -d)"
    cp roo-memory-bank.sh "$TEST_DIR/"
    cd "$TEST_DIR"
    
    # Mock curl command
    function curl() {
        echo "Mocked curl $@" > "$2"
        return 0
    }
    export -f curl
}

teardown() {
    # Clean up temporary directory
    cd -
    rm -rf "$TEST_DIR"
}

@test "Script exists and is executable" {
    [ -f "roo-memory-bank.sh" ]
    [ -x "roo-memory-bank.sh" ]
}

@test "memory-bank directory is created" {
    run ./roo-memory-bank.sh
    [ -d "memory-bank" ]
}

@test "All required files are downloaded" {
    run ./roo-memory-bank.sh
    
    # Check .clinerules files
    [ -f ".clinerules-architect" ]
    [ -f ".clinerules-code" ]
    [ -f ".clinerules-ask" ]
    
    # Check system prompt files
    [ -f "system-prompt-architect.md" ]
    [ -f "system-prompt-code.md" ]
    [ -f "system-prompt-ask.md" ]
    
    # Check memory bank files
    [ -f "memory-bank-roo-code-README.md" ]
    [ -f "memory-bank-roo-code-developer-primer.md" ]
    
    # Check projectBrief.md
    [ -f "projectBrief.md" ]
}

@test "Script handles curl failures" {
    # Override curl mock to simulate failure
    function curl() {
        return 1
    }
    export -f curl
    
    run ./roo-memory-bank.sh
    [ "$status" -eq 1 ]
    [[ "${lines[0]}" =~ "Starting download of Roo Code Memory Bank files" ]]
    [[ "${lines[2]}" =~ "Error downloading" ]]
}

@test "Script displays correct completion message" {
    run ./roo-memory-bank.sh
    
    [[ "${lines[0]}" =~ "Starting download of Roo Code Memory Bank files" ]]
    [[ "${output}" =~ "Download complete!" ]]
    [[ "${output}" =~ "Setup complete! Next steps:" ]]
    [[ "${output}" =~ "1. Review the downloaded files" ]]
    [[ "${output}" =~ "2. Place projectBrief.md in your project root" ]]
    [[ "${output}" =~ "3. Initialize the Memory Bank using Roo Code in Architect or Code mode" ]]
}

@test "Downloaded files have correct base URL" {
    # Create a temporary file to capture curl commands
    CURL_LOG="$TEST_DIR/curl.log"
    
    # Override curl mock to log calls
    function curl() {
        echo "curl $@" >> "$CURL_LOG"
        echo "Mocked content" > "$2"
        return 0
    }
    export -f curl
    
    run ./roo-memory-bank.sh
    
    # Check that all URLs start with the correct base URL
    while IFS= read -r line; do
        [[ "$line" =~ "https://raw.githubusercontent.com/d-oit/roo-code-memory-bank/main" ]]
    done < "$CURL_LOG"
}