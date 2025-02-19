#!/bin/bash

# Base URL for raw GitHub content
BASE_URL="https://raw.githubusercontent.com/d-oit/roo-code-memory-bank/main"

# Array of files to download
FILES=(
    ".clinerules-architect"
    ".clinerules-code"
    ".clinerules-ask"
    "system-prompt-architect.md"
    "system-prompt-code.md"
    "system-prompt-ask.md"
    "memory-bank-roo-code-README.md"
    "memory-bank-roo-code-developer-primer.md"
    "projectBrief.md"
)

echo "Starting download of Roo Code Memory Bank files..."

# Create memory-bank directory if it doesn't exist
mkdir -p memory-bank

# Download each file
for file in "${FILES[@]}"; do
    echo "Downloading $file..."
    if [[ $file == "projectBrief.md" ]]; then
        # Download projectBrief.md to project root
        curl -L -o "$file" "$BASE_URL/$file" || {
            echo "Error downloading $file"
            exit 1
        }
    else
        curl -L -o "$file" "$BASE_URL/$file" || {
            echo "Error downloading $file"
            exit 1
        }
    fi
done

# Make the script executable
chmod +x roo-memory-bank.sh

echo "Download complete!"
echo "Files downloaded:"
ls -la .clinerules* system-prompt* memory-bank-* projectBrief.md

echo -e "\nSetup complete! Next steps:"
echo "1. Review the downloaded files"
echo "2. Place projectBrief.md in your project root"
echo "3. Initialize the Memory Bank using Roo Code in Architect or Code mode"