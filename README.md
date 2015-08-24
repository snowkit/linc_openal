# linc/openal
Haxe/hxcpp @:native bindings for OpenAL audio playback.

This is a [linc](http://snowkit.github.io/linc/) library.

---

This library works with the Haxe cpp target only.

---

### Install

`haxelib git linc_openal https://github.com/snowkit/linc_openal.git`

### Supported platforms

- Mac
- Linux
- Windows
- Android
- iOS


### Example usage

See test/Test.hx

Be sure to read the OpenAL documentation:
http://www.openal.org/documentation/openal-1.1-specification.pdf


### Platform notes

In order to use this library the following must be understood about each platform:

`iOS`, `Mac` - The OS includes OpenAL and that version is used   
`Android` - The openal-android library code is linked into your .so that haxe/hxcpp generates   
`Windows` - prebuilt openal-soft library is used (and included), see below notes   
`Linux` - system libopenal-dev package or similar is used, see below notes

#### OpenAL-soft and Windows prebuilt libraries

It's important to take note that the **OpenAL libraries are generally required to be linked dynamically** (because of LGPL licensing).
There is a case where you can statically link, but this is only if your source is made public at the time of users obtaining the code.
In any case, on Windows and Linux OpenAL-soft latest release is used as a binary build for simplicity.

For more information, see the readme in lib/openal-soft for details.
Also note, on windows the 64 bit library is still called OpenAL32.dll - this is not a typo.

#### Linux dynamic library notes

**By default the system OpenAL is used**   
This means that the developer building their game needs `libopenal-dev` (build time) installed, and `openal-soft` (runtime).

**What about a binary-relative library?**   
On linux, in order for a dynamic library like OpenAL to be found alongside the binary file,   
which is sometimes preferable, the following options must be considered.

If your folder looked like this,   

- `game` (binary)
- `libopenal.so` (dynamic library)

Without one of the below options, it will fail to find the library.   
_(That is unless the system has the library installed somewhere already)_.

**LD_LIBRARY_PATH option**   
An environment variable has to be set called `LD_LIBRARY_PATH` when running,   
would usually be set to the folder containing the library.

You would usually have a `run.sh` or similar bootstrap script,   
All it would need to do is run `export LD_LIBRARY_PATH=./ && ./game`   

- `run.sh` (user runs this instead)
- `game`
- `libopenal.so`

**rpath**   
The alternative option is a compiler flag which embeds a path inside the binary.
This option also has a special value called `$ORIGIN` which would be where the binary is located,
and there would be no special script to run the binary needed.

To use this option with this library, you can define `LINC_OPENAL_RELATIVE_DYNAMIC_LIB`,
it will use the rpath option by default, but that can be toggled by   
defining `LINC_OPENAL_LINUX_NO_RPATH_ORIGIN`.


## Runtime/build preparation requirements

- `Mac` No runtime requirements
- `iOS` No runtime requirements
- `Windows` Copy the correct `OpenAL32.dll` alongside your binary from the lib/openal-soft folder
- `Linux` Make sure `openal-soft` is installed (sudo apt-get install openal-soft or similar)
    - unless using the relative options, in which case make sure the correct .so is alongside the binary
- `Android` If using this library manually, the lib/openal-android libary is compiled into your haxe app step (commonly an .so)

---

## Building and build requirements

- `Android` Make sure you `git clone --recursive`  OR run `git submodule update --init` once you have cloned.    
    - This populates `lib/openal-android` which you need
- `Linux` Make sure `libopenal-dev` and `openal-soft` are installed
    - using `apt-get libopenal-dev openal-soft` or equivalent
- `Windows` none - Prebuilt openal-soft is used
- `Mac` none - OS OpenAL is used
- `iOS` none - OS OpenAL is used

#### Important notes:   

This is a library, it is intended to be included in an existing application or framework.

That means that running this test/example for iOS/Android won't make sense - because of the way those platforms work.
The output from haxe build will be a c++ library which is included in the platform specific way, outside of the scope of this readme.

On Windows/Mac/Linux the output of the test is an executable, which you can run.

---

## History

- 0.1.0 - initial release, tested for Mac/Windows/Linux/Android/iOS
	- windows - uses openal-soft-1.16.0
    - linux - uses system installed libopenal-dev and openal-soft
	- android - uses openal-android from native-toolkit/openal-android as a submodule
    - mac/ios - uses OS OpenAL framework

## :todo:

- Test/fix functions with the array types like Array<Int> and Array<Bool> 
- Test all end points
