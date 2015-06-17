# openal

Haxe @:native bindings for OpenAL

### Supported platforms 

- Mac
- Linux
- Windows
- Android
- iOS

This is a hxcpp (cpp target) specific library and will ONLY work with the cpp target.

### Platform notes

In order to use this library the following must be understood about each platform:

`iOS`, `Mac` - The OS includes OpenAL and that version is used   
`Android` - The openal-android library code is linked into your .so that haxe/hxcpp generates   
`Linux`, `Windows` - prebuilt openal-soft library is used (and included), see below notes   

#### Windows and linux prebuilt libraries

It's important to take note that the **OpenAL libraries are generally required to be linked dynamically** (because of LGPL licensing).
There is a case where you can statically link, but this is only if your source is made public at the time of users obtaining the code.
In any case, on Windows and Linux OpenAL-soft latest release is used as a binary build for simplicity.

For more information, see the readme in lib/openal-soft for details.
Also note, on windows the 64 bit library is still called OpenAL32.dll - this is not a typo.

## Runtime requirements

- `Mac`,`iOS` No runtime requirements
- `Windows`, `Linux` Copy the correct `openal(32/64).(dll/so)` alongside your binary from the lib/ folder
- `Android` Chances are you're using this in an existing app code base - because the OpenAL code is linked in there is nothing further to do.

--- 

## Building and build requirements

Make sure you `git clone --recursive`  OR run `git submodule update --init` once you have cloned.    
You must have the `lib/openal-android` folders in the tree locally to build for android, which is what this does.

#### Important notes:   

This is a library, it is intended to be included in an existing application or framework.

That means that running this test/example for iOS/Android won't make sense - because of the way those platforms work.
The output from haxe build will be a c++ library which is included in the platform specific way, outside of the scope of this readme.

On Windows/Mac/Linux the output of the test is an executable, which you can run.

---

## History 

- 0.1.0 - initial release, tested for Mac/Windows/Linux/Android/iOS
	- uses openal-soft-1.16.0 on windows / linux
	- uses openal-android from native-toolkit/openal-android as a submodule

## Todo

- Use relative paths when possible can in hxcpp buildxml, for the libs/deps
- Implement wrappers for types like Array<Int> and Array<Bool>, I'm not sure they apply magically?
- Test all end points
