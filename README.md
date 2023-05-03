# Hello 8-bit LLVM-MOS project template

This repository serves as a template project for developing for 8-bit platforms supported by the [LLVM-MOS](https://llvm-mos.org/) project. It contains a CMake project ready to go, a `.editorconfig`, some CMakePresets to get you started with the IDE you are using. This project is able to be targetted towards any [supported platform](https://github.com/llvm-mos/llvm-mos-sdk#supported-platforms) by LLVM-MOS, such as, but not limited to: Nintendo NES, Commodore 64, Commander X16, Commodore VIC-20, and even a barebone 6502 simulator.

## Getting started

1. Click the "Use this template" button above in the repository homepage to "fork" it. You can optionally just download it as a `.zip`. Either way, get this repository on your PC somewhere.
2. Install [LLVM-MOS-SDK](https://github.com/llvm-mos/llvm-mos-sdk#getting-started) as given in the instructions. Note that if you had already installed the original LLVM toolchain, skip the "Add LLVM-MOS to PATH
" to not come across any name-conflict issues.
3. Note where you've downloaded/extracted the sdk, such as `/opt/llvm-mos`. You will need it for the next step.
4. In your repo, copy `CMakeUserPresets.json.template` as `CMakeUserPresets.json`:
```bash
cp CMakeUserPresets.json.template CMakeUserPresets.json
```
5. Edit the new file `CMakeUserPresets.json` (note the _User_ part in the file name) and replace the `"LLVM_MOS": "/opt/llvm-mos"` **lines** with the path of `llvm-mos`. Note that this is present for each preset, so you will need to change all occurrences.
6. (Optional) Edit the `CMakeUserPresets.json` as you wish by adding more target presets, environment variables, options, etc. as per your project. You can use the "inherits" and "hidden" properties to reduce repetition.

## Building the project

This project uses [CMake](https://cmake.org/download/) so you will need to install that first, if you don't have it already. You can either build the project using the IDE you're using (such as [VSCode](https://code.visualstudio.com/) or [code-server](https://github.com/coder/code-server)), in which case you will have to set it up to integrate CMake, and follow the instructions accordingly. Or you can do it via command line like so:

1. Configure project (creates build scripts, etc.)

```bash
# Create a build directory to store all the scripts and build artifacts.
mkdir build
cd build

# Configure the project from within the build folder. Using the llvm-mos-cx16-Debug preset for example.
cmake --preset llvm-mos-cx16-Debug ..
```

2. Build the project to produce both a `.elf` file and the program ROM PRG file (without extension)

```bash
# While still within the build directory
cmake --build .
```
