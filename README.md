
# 🐕 Longchop

Named after my dog Winter, who loves to stretch out just like this tool stretches and displays your project files! Perfect for keeping track of large projects, especially when working with biobank ontologies and complex file structures.

## 🌟 What is Longchop?

Longchop is a friendly CLI tool that helps you visualize and analyze your project files in a tree-like structure. Just like Winter stretches out to show her full length, Longchop stretches out your project structure to help you see everything clearly!

## 🚀 Installation

### Prerequisites

You'll need `tree` installed first:

For Mac users:
```bash
brew install tree
```

For Linux users:
```bash
# Ubuntu/Debian
sudo apt-get install tree

# CentOS/RHEL
sudo yum install tree
```

### Installing Longchop

It's as simple as these two commands:
```bash
# Add our tap
brew tap donphi/longchop

# Install longchop
brew install longchop
```

## 🎯 Usage

Basic usage is super simple:
```bash
longchop
```

### Options Available
```bash
longchop [options]
```

**Options:**
- `--codeline X`      Show first X lines of each file (default: 500)
- `--ignore .ext`     Skip files with specific extensions
- `--include .ext`    Include additional file types
- `--help, -h`        Show this friendly help message

## 📚 Examples

**Show only first 100 lines of each file:**
```bash
longchop --codeline 100
```

**Ignore specific file types:**
```bash
longchop --ignore .map
```

**Include additional file types:**
```bash
longchop --include .py
```

## 🎨 Real-World Example

Perfect for biobank projects! When I'm working with complex ontology structures, I use it like this:
```bash
longchop --codeline 200 --include .owl --include .ttl
```
This shows me all my ontology files (`.owl` and `.ttl`) with the first 200 lines of each file.

## 🆕 Version History

**Current Version: v1.0.1**
- Improved file type detection
- Added better support for various file extensions
- Enhanced directory structure display

## 🐾 Why "Longchop"?

Just like my dog Winter who inspired the name - she stretches out to her full length when she's happy, this tool stretches out your project structure to give you the full picture! And just as Winter helps me stay organized during my biobank work by keeping me company, Longchop helps keep your project files organized and visible.

## 🤝 Contributing

Found a bug? Have a feature request? Want to contribute? Please open an issue or submit a PR! Just like Winter welcomes everyone with a wagging tail, we welcome all contributors!

## 📜 License

MIT License - Feel free to use it, modify it, share it!

## 🙋‍♂️ Need Help?

Having trouble? Found a bug? Please open an issue on GitHub!

---

Made with ❤️ by donphi

Inspired by Winter 🐕
