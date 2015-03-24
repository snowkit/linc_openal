# openal
Haxe @:native bindings for OpenAL

### Supported platforms out of the box

Mac, Linux, Windows, Android, iOS

### Platform differences

In order to use this library the following must be understood about each platform:

`iOS`, `Mac` - The OS includes OpenAL and this library uses that version
`Android` - The code is linked into your dynamic library that haxe/hxcpp generates
`Linux`, `Windows` - prebuilt library included, see below for notes

#### Using the prebuilt libraries

It's important to take note that the **OpenAL libraries are generally required to be linked dynamically** (because of LGPL licensing).
There is a case where you can statically link, but this is only if your source is made public at the time of users obtaining the code.

## Build requirements

Make sure you `git clone --recursive` or run `git submodule update --init` once you have cloned it. You must have the `lib/openal` and `lib/openal-android` folders in the tree locally to build using it.

#### When doing plain haxe:   

`iOS`, `Android`   
For using this with raw android/iOS projects you have to take the output that haxe gives you and use it in an existing android/ios project as a library.

`Windows`, `Linux`, `Mac`   
Aside from below runtime considerations of where to put the library, you just run the application generated.

## Runtime requirements

- `Mac`,`iOS` No runtime requirements
- `Windows`, `Linux` Copy the correct `openal(32/64).(dll/so)` alongside your binary from the lib/ folder
- `Android` Chances are you're using this in an existing app code base - because the OpenAL code is linked in there is nothing further to do.

## :todo:

- finalize naming etc
- Implement wrappers for types like Array<Int> and Array<Bool>, I'm not sure they apply magically?
- Use relative paths when we can in hxcpp for the libs/deps
- Test all possible end points
- Test on device for iOS/Android