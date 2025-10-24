#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

if [ -z "$1" ]; then
    print_error "Version is required as first argument"
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.0-beta.27"
    exit 1
fi

VERSION="$1"
FORMULA_FILE="Formula/tacotruck.rb"
REPO_URL="https://github.com/testfiesta/tacotruck"

print_info "Updating TacoTruck formula to version $VERSION"

if [ ! -f "$FORMULA_FILE" ]; then
    print_error "Formula file not found: $FORMULA_FILE"
    exit 1
fi

get_sha256() {
    local url="$1"
    local temp_file=$(mktemp)
    
    print_info "Downloading $url"
    if curl -L -f -s -o "$temp_file" "$url"; then
        local sha256=$(shasum -a 256 "$temp_file" | cut -d' ' -f1)
        rm "$temp_file"
        echo "$sha256"
    else
        rm -f "$temp_file"
        print_error "Failed to download $url"
        return 1
    fi
}

DARWIN_X64_URL="$REPO_URL/releases/download/v$VERSION/tacotruck-$VERSION-darwin-x64"
DARWIN_ARM64_URL="$REPO_URL/releases/download/v$VERSION/tacotruck-$VERSION-darwin-arm64"
LINUX_X64_URL="$REPO_URL/releases/download/v$VERSION/tacotruck-$VERSION-linux-x64"
LINUX_ARM64_URL="$REPO_URL/releases/download/v$VERSION/tacotruck-$VERSION-linux-arm64"

print_info "Calculating checksums for all platforms..."

DARWIN_X64_SHA256=$(get_sha256 "$DARWIN_X64_URL")
DARWIN_ARM64_SHA256=$(get_sha256 "$DARWIN_ARM64_URL")
LINUX_X64_SHA256=$(get_sha256 "$LINUX_X64_URL")
LINUX_ARM64_SHA256=$(get_sha256 "$LINUX_ARM64_URL")

print_info "Checksums calculated successfully"
print_info "Darwin x64: $DARWIN_X64_SHA256"
print_info "Darwin ARM64: $DARWIN_ARM64_SHA256"
print_info "Linux x64: $LINUX_X64_SHA256"
print_info "Linux ARM64: $LINUX_ARM64_SHA256"

cp "$FORMULA_FILE" "$FORMULA_FILE.backup"

print_info "Updating formula file..."

sed -i.tmp "s/version \".*\"/version \"$VERSION\"/" "$FORMULA_FILE"

update_platform() {
    local platform="$1"
    local url="$2" 
    local sha256="$3"
    
    sed -i.tmp "s#url \"$REPO_URL/releases/download/v.*/tacotruck-.*-$platform\"#url \"$url\"#" "$FORMULA_FILE"
    
    awk -v url="$url" -v sha="$sha256" '
        /url.*/ && $0 ~ url { found=1; print; next }
        found && /sha256/ { gsub(/"[^"]*"/, "\"" sha "\""); found=0 }
        { print }
    ' "$FORMULA_FILE" > "$FORMULA_FILE.new" && mv "$FORMULA_FILE.new" "$FORMULA_FILE"
}

# Update all platforms
update_platform "darwin-x64" "$DARWIN_X64_URL" "$DARWIN_X64_SHA256"
update_platform "darwin-arm64" "$DARWIN_ARM64_URL" "$DARWIN_ARM64_SHA256"  
update_platform "linux-x64" "$LINUX_X64_URL" "$LINUX_X64_SHA256"
update_platform "linux-arm64" "$LINUX_ARM64_URL" "$LINUX_ARM64_SHA256"

rm -f "$FORMULA_FILE.tmp"

print_info "Formula updated successfully!"

print_info "Changes made:"
if command -v git &> /dev/null; then
    git diff "$FORMULA_FILE" || true
else
    diff "$FORMULA_FILE.backup" "$FORMULA_FILE" || true
fi

rm -f "$FORMULA_FILE.backup"

print_info "Update completed for version $VERSION"
