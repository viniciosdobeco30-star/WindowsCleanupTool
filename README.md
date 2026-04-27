# Windows Cleanup Tool

A comprehensive Windows maintenance and performance optimization tool with bilingual support (English/Portuguese).

## Features

- **Quick Cleanup**: Removes temporary files and empties recycle bin
- **Full Cleanup**: Deep clean including prefetch and error logs
- **System Restore Points**: Create safety points before making changes
- **Drive Optimization**: Defrag HDDs and TRIM SSDs
- **Performance Mode**: Optimize power settings and services
- **Malware Scanning**: Quick scan with Microsoft Defender
- **Hardware Monitoring**: Launch external hardware monitors
- **Network Tools**: Ping, IP config, DNS cache clearing
- **Speed Testing**: Test internet download speed
- **System Reports**: Generate detailed system information

## Installation

### Via Winget (Recommended)
```bash
winget install H11DRA.WindowsCleanupTool
```

### Manual Installation
1. Download the latest release from [GitHub Releases](https://github.com/H11DRA/WindowsCleanupTool/releases)
2. Extract the ZIP file
3. Run `install.ps1` as Administrator

### Requirements
- Windows 10 or later
- Administrator privileges (required for most functions)
- PowerShell 5.0 or later

## Usage

After installation, you can run the tool in several ways:

1. **From Command Prompt**: Simply type `cleanup`
2. **From Start Menu**: Search for "Windows Cleanup Tool"
3. **Direct Execution**: Run `cleanup.bat` from the installation directory

The tool will prompt you to choose between English and Portuguese on first run.

## Safety Features

- **Administrator Check**: Verifies admin privileges before running
- **Confirmation Prompts**: All potentially destructive actions require confirmation
- **Restore Points**: Creates system restore points before performance tweaks
- **Reset Function**: Can revert performance changes back to defaults

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- **Issues**: [GitHub Issues](https://github.com/H11DRA/WindowsCleanupTool/issues)
- **Documentation**: [README](https://github.com/H11DRA/WindowsCleanupTool/blob/main/README.md)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Version History

### v0.0.7
- Initial release with bilingual support
- Complete system cleanup functionality
- Performance optimization features
- Network and hardware diagnostic tools
- System reporting capabilities
