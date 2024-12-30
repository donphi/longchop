# 🐕 Longchop

Named after my dog Winter, who loves to stretch out just like this tool stretches and displays your project files! Perfect for keeping track of large projects and providing AI models with full context of your coding questions and file structure.

## 🌟 What is Longchop?

Longchop is a friendly CLI tool that helps you visualize and analyze your project files in a tree-like structure. Just like Winter stretches out to show her full length, Longchop stretches out your project structure to help you see everything clearly!

## 🌐 Installation

It's as simple as these two commands:

```bash
# Add our tap
brew tap donphi/longchop

# Install longchop
brew install longchop
```

## 🎮 Usage

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

## Default File Types

By default, Longchop displays the following file types:

```bash
- *.Dockerfile
- *.tsx
- *.ts
- *.jsx
- *.js
- *.json
- *.html
- *.css
- *.scss
- *.yaml
- *.yml
```

You can include other file types or ignore some using the `--include` or `--ignore` options if needed.

## 📙 Examples

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

When working on a coding project and needing to debug or provide AI tools (like ChatGPT or Claude) with the complete structure and content of your project, Longchop helps create a clear and concise view. Here’s how you can use it:

```bash
longchop --codeline 50 --include .py --include .html
```

### Example Output:

**Directory Structure:**

```
myproject
├── app
│   ├── main.py
│   ├── utils.py
│   └── templates
│       └── index.html
├── README.md
└── requirements.txt

3 directories, 4 files
```

**Files with Contents:**

```
.
├── app/main.py
       │ File: ./app/main.py
───────┼────────────────────────────────────────────────────────────────────────
   1   │ # Main application logic
   2   │ from utils import helper_function
   3   │ def main():
   4   │     print("Hello, World!")
───────┴────────────────────────────────────────────────────────────────────────

.
├── app/templates/index.html
       │ File: ./app/templates/index.html
───────┼────────────────────────────────────────────────────────────────────────
   1   │ <!DOCTYPE html>
   2   │ <html>
   3   │ <head><title>Test Page</title></head>
   4   │ <body><h1>Hello, World!</h1></body>
   5   │ </html>
───────┴────────────────────────────────────────────────────────────────────────
```

By copying this output into your AI conversation, you provide the full context of your project’s structure and the relevant code, making it easier for AI to assist you.

## 🔹 Version History

**Current Version: v1.0.1**

- Improved file type detection
- Added better support for various file extensions
- Enhanced directory structure display

## 🐾 Why "Longchop"?

Just like my dog Winter who inspired the name - she stretches out to her full length when she's happy, this tool stretches out your project structure to give you the full picture! And just as Winter helps me stay organized during coding sessions by keeping me company, Longchop helps keep your project files organized and visible.

## 🤝 Contributing

Found a bug? Have a feature request? Want to contribute? Please open an issue or submit a PR! Just like Winter welcomes everyone with a wagging tail, we welcome all contributors!

## 📜 License

MIT License - Feel free to use it, modify it, share it!

## 🙋‍♂️ Need Help?

Having trouble? Found a bug? Please open an issue on GitHub!

---

Made with ❤️ by donphi

Inspired by Winter 🐕
