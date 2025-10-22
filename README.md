# Homebrew TacoTruck Tap

This is a Homebrew tap for [TacoTruck](https://github.com/testfiesta/tacotruck), a Test/QA data pipeline CLI tool by TestFiesta.

## What is TacoTruck?

TacoTruck is a command-line interface tool designed for test and QA data pipeline management. It provides developers and QA engineers with powerful capabilities to streamline their testing workflows and data management processes.

## Installation

### Prerequisites

- [Homebrew](https://brew.sh/) must be installed on your system

### Install TacoTruck CLI

You can install TacoTruck using this custom Homebrew tap:

```bash
# Add the tap
brew tap testfiesta/tacotruck

# Install TacoTruck
brew install tacotruck
```

### Verify Installation

After installation, verify that TacoTruck is working correctly:

```bash
tacotruck --version
```

This should display the current version of TacoTruck CLI.

## Usage

Once installed, you can use the `tacotruck` command from anywhere in your terminal. For detailed usage instructions and available commands, refer to the [official TacoTruck documentation](https://github.com/testfiesta/tacotruck).

## Supported Platforms

This tap supports the following platforms:

- **macOS**: Intel (x64) and Apple Silicon (ARM64)
- **Linux**: Intel (x64) and ARM64

## Updating

To update TacoTruck to the latest version:

```bash
brew update
brew upgrade tacotruck
```

## Uninstalling

To remove TacoTruck:

```bash
brew uninstall tacotruck
```

To remove the tap entirely:

```bash
brew untap testfiesta/tacotruck
```

## About This Tap

This Homebrew tap is maintained to provide easy installation of TacoTruck CLI across different platforms. The tap automatically handles platform detection and installs the appropriate binary for your system.

## Issues and Support

- For TacoTruck-specific issues: [TacoTruck GitHub Issues](https://github.com/testfiesta/tacotruck/issues)
- For tap-related issues: Please create an issue in this repository

## License

TacoTruck is licensed under the MIT License. See the [official repository](https://github.com/testfiesta/tacotruck) for more details.
