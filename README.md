# `mypip` - Enhancing Python Package Management

---

## About `mypip`

`mypip` is a lightweight Bash wrapper for Python's `pip` that introduces a much-needed feature for Python developers: the ability to directly save a newly installed package into the project's `requirements.txt` file, similar to npm's `--save` option. This tool aims to simplify Python project dependency management, making it easier to maintain and share clean, precise `requirements.txt` files without including unnecessary packages.

## Features

- **Direct Dependency Management**: Easily add only your explicitly installed packages to `requirements.txt`.
- **Cleaner `requirements.txt`**: Avoid the clutter of unnecessary dependencies, focusing on what your project really needs.
- **Simple Usage**: `mypip` works just like `pip`, with the added benefit of the `-S` flag for saving dependencies.

## Installation

1. **Clone the Repository**: First, clone this repository to your local machine.

```bash
git clone https://github.com/yourusername/mypip.git
cd myypip
```

2. **Make the Script Executable**: Grant execute permissions to the `mypip` script.

```bash
chmod +x mypip
```

3. **(Optional) Add to PATH**: For easy access, you can add the script to your PATH.

```bash
export PATH=$PATH:/path/to/mypip
```
Remember to replace `/path/to/mypip` with the actual path to the `mypip` script. You might also want to add this line to your `.bashrc` or `.bash_profile` to persist across sessions.

## Usage

To install a package and add it to your `requirements.txt`, simply use:

```bash
./mypip install package-name -S
```

`mypip` will install the package using `pip` and append the installed package along with its version to the `requirements.txt` file in the current directory.

### Example

```bash
./mypip install requests -S
```

This command installs the `requests` library and adds its current version to `requirements.txt`.

## How It Works

`mypip` intercepts the `-S` flag, executes a standard `pip install` for the specified package(s), and then appends the package(s) and their versions to `requirements.txt`. It cleverly uses `pip freeze` to capture the exact versions, ensuring your project dependencies remain consistent across environments.

## Limitations

- **Environment Specific**: `mypip` should be used within a virtual environment to avoid capturing global packages.
- **Bash Dependency**: Currently, `mypip` is a Bash script and thus is primarily intended for Unix-like operating systems. Windows users can utilize it within WSL (Windows Subsystem for Linux) or other Bash-compatible environments.

## Contributing

Contributions are welcome! Whether it's submitting bugs, proposing new features, or improving the documentation, all contributions help make `mypip` better for the Python community. Please feel free to fork the repository and submit a pull request.

## License

`mypip` is open-source software licensed under the MIT License. See the LICENSE file for more details.

---

`mypip` is not officially associated with Python or `pip`. It's a community-driven project aimed at improving Python developers' workflow.
