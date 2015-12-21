package openal;

#if !cpp
    #error "OpenAL is only available with haxe + hxcpp ( cpp target )."
#end

    /** An OpenAL device pointer */
typedef Device = cpp.Pointer<ALCdevice>;
    /** An OpenAL context pointer */
typedef Context = cpp.Pointer<ALCcontext>;

typedef ALuint = UInt;

@:keep
@:include('linc_openal.h')
#if !display
@:build(linc.Linc.touch())
@:build(linc.Linc.xml('openal'))
#end
    /** The main OpenAL API */
extern class AL {

    // scene configs

            @:native('alDopplerFactor')
        static function dopplerFactor(value:Float) : Void;
            @:native('alDopplerVelocity')
        static function dopplerVelocity(value:Float) : Void;
            @:native('alSpeedOfSound')
        static function speedOfSound(value:Float) : Void;
            @:native('alDistanceModel')
        static function distanceModel(distanceModel:Int) : Void;

    // scene management

            @:native('alEnable')
        static function enable(capability:Int) : Void;
            @:native('alDisable')
        static function disable(capability:Int) : Void;
            @:native('alIsEnabled')
        static function isEnabled(capability:Int) : Bool;

    // scene state

            @:native('alGetString')
        static function getString(param:Int) : String;
            @:native('alGetBooleanv')
        static function getBooleanv(param:Int, ?count:Int = 1 ) : Array<Bool>;
            @:native('alGetIntegerv')
        static function getIntegerv(param:Int, ?count:Int = 1 ) : Array<Int>;
            @:native('alGetFloatv')
        static function getFloatv(param:Int, ?count:Int = 1 ) : Array<Float>;
            @:native('alGetDoublev')
        static function getDoublev(param:Int, ?count:Int = 1 ) : Array<Float>;
            @:native('alGetBoolean')
        static function getBoolean(param:Int) : Bool;
            @:native('alGetInteger')
        static function getInteger(param:Int) : Int;
            @:native('alGetFloat')
        static function getFloat(param:Int) : Float;
            @:native('alGetDouble')
        static function getDouble(param:Int) : Float;
            @:native('alGetError')
        static function getError() : Int;


    // extensions

            @:native('alIsExtensionPresent')
        static function isExtensionPresent(extname:String) : Bool;
            @:native('alGetProcAddress')
        static function getProcAddress(fname:String) : Dynamic; // :warn: not sure yet
            @:native('alGetEnumValue')
        static function getEnumValue(ename:String) : Int;

    // listener state

            @:native('alListenerf')
        static function listenerf(param:Int, value:Float) : Void;
            @:native('alListener3f')
        static function listener3f(param:Int, value1:Float, value2:Float, value3:Float) : Void;
            @:native('alListenerfv')
        static function listenerfv(param:Int, values:Array<Float> ) : Void;
            @:native('alListeneri')
        static function listeneri(param:Int, value:Int) : Void;
            @:native('alListener3i')
        static function listener3i(param:Int, value1:Int, value2:Int, value3:Int) : Void;
            @:native('alListeneriv')
        static function listeneriv(param:Int, values:Array<Int> ) : Void;
            @:native('alGetListenerf')
        static function getListenerf(param:Int) : Float;
            @:native('alGetListener3f')
        static function getListener3f(param:Int) : Array<Float>;
            @:native('alGetListenerfv')
        static function getListenerfv(param:Int, ?count:Int = 1) : Array<Float>;
            @:native('alGetListeneri')
        static function getListeneri(param:Int) : Int;
            @:native('alGetListener3i')
        static function getListener3i(param:Int) : Array<Int>;
            @:native('alGetListeneriv')
        static function getListeneriv( param:Int, ?count:Int = 1) : Array<Int>;

    // source management

            @:native('alGenSources') //:todo:
        static function genSources(n:Int) : Array<Int>;
            @:native('alDeleteSources') //:todo:
        static function deleteSources(sources:Array<Int>) : Void;
            @:native('alIsSource')
        static function isSource(source:Int) : Bool;

    // source state

            @:native('alSourcef')
        static function sourcef(source:Int, param:Int, value:Float) : Void;
            @:native('alSource3f')
        static function source3f(source:Int, param:Int, value1:Float, value2:Float, value3:Float) : Void;
            @:native('alSourcefv')
        static function sourcefv(source:Int, param:Int, values:Array<Float> ) : Void;
            @:native('alSourcei')
        static function sourcei(source:Int, param:Int, value:Int) : Void;
            @:native('alSource3i')
        static function source3i(source:Int, param:Int, value1:Int, value2:Int, value3:Int) : Void;
            @:native('alSourceiv') //:todo:
        static function sourceiv(source:Int, param:Int, values:Array<Int> ) : Void;
            @:native('linc::openal::getSourcef')
        static function getSourcef(source:Int, param:Int) : Float;
            @:native('linc::openal::getSource3f')
        static function getSource3f(source:Int, param:Int, into:Array<Float>) : Array<Float>;
            @:native('alGetSourcefv') //:todo:
        static function getSourcefv(source:Int, param:Int) : Array<Float>;
            @:native('linc::openal::getSourcei')
        static function getSourcei(source:Int,  param:Int) : Int;
            @:native('linc::openal::getSource3i')
        static function getSource3i(source:Int, param:Int, into:Array<Int>) : Array<Int>;
            @:native('alGetSourceiv') //:todo:
        static function getSourceiv(source:Int,  param:Int, ?count:Int = 1) : Array<Int>;

    //source states

            @:native('alSourcePlayv')
        static function sourcePlayv(sources:Array<Int>) : Void;
            @:native('alSourceStopv')
        static function sourceStopv(sources:Array<Int>) : Void;
            @:native('alSourceRewindv')
        static function sourceRewindv(sources:Array<Int>) : Void;
            @:native('alSourcePausev')
        static function sourcePausev(sources:Array<Int>) : Void;
            @:native('alSourcePlay')
        static function sourcePlay(source:Int) : Void;
            @:native('alSourceStop')
        static function sourceStop(source:Int) : Void;
            @:native('alSourceRewind')
        static function sourceRewind(source:Int) : Void;
            @:native('alSourcePause')
        static function sourcePause(source:Int) : Void;
            @:native('alSourceQueueBuffers') //:todo:
        static function sourceQueueBuffers(source:Int, nb:Int, buffers:Array<ALuint>) : Void;
            @:native('alSourceUnqueueBuffers') //:todo:
        static function sourceUnqueueBuffers(source:Int, nb:Int) : Array<ALuint>;

    //buffer management

        static inline function genBuffers(n:Int, into:Array<ALuint>) : Array<ALuint> {
            var _i = 0;
            while(_i < n) {
                into[_i] = genBuffer();
                ++_i;
            }
            return into;
        }

        static function deleteBuffers(buffers:Array<ALuint>) : Void {
            var _i = 0;
            while(_i < n) {
                deleteBuffer(buffers[_i]);
                ++_i;
            }
        }

            @:native('alIsBuffer')
        static function isBuffer(buffer:ALuint) : Bool;

    //buffer data and state

            @:native('linc::openal::bufferData')
        static function bufferData(buffer:ALuint, format:Int, frequency:Int, bytes:haxe.io.BytesData, byteOffset:Int, byteLength:Int) : Void;
            @:native('alBufferf')
        static function bufferf(buffer:ALuint, param:Int, value:Float) : Void;
            @:native('alBuffer3f')//:todo:
        static function buffer3f(buffer:ALuint, param:Int, value1:Float, value2:Float, value3:Float) : Void;
            @:native('alBufferfv')//:todo:
        static function bufferfv(buffer:ALuint, param:Int, values:Array<Float> ) : Void;
            @:native('alBufferi')
        static function bufferi(buffer:ALuint, param:Int, value:Int) : Void;
            @:native('alBuffer3i')
        static function buffer3i(buffer:ALuint, param:Int, value1:Int, value2:Int, value3:Int) : Void;
            @:native('alBufferiv')//:todo:
        static function bufferiv(buffer:ALuint, param:Int, values:Array<Int> ) : Void;
            @:native('linc::openal::getBufferf')
        static function getBufferf(buffer:ALuint, param:Int) : Float;
            @:native('alGetBuffer3f')//:todo:
        static function getBuffer3f(buffer:ALuint, param:Int) : Array<Float>;
            @:native('alGetBufferfv')//:todo:
        static function getBufferfv(buffer:ALuint, param:Int, ?count:Int = 1) : Array<Float>;
            @:native('linc::openal::getBufferi')
        static function getBufferi(buffer:ALuint, param:Int) : Int;
            @:native('alGetBuffer3i')//:todo:
        static function getBuffer3i(buffer:ALuint, param:Int) : Array<Int>;
            @:native('alGetBufferiv')//:todo:
        static function getBufferiv(buffer:ALuint, param:Int, ?count:Int = 1) : Array<Int>;

    //unofficial API helpers

            @:native('linc::openal::genSource')
        static function genSource() : Int;
            @:native('linc::openal::deleteSource')
        static function deleteSource(source:Int) : Void;
            @:native('linc::openal::genBuffer')
        static function genBuffer() : ALuint;
            @:native('linc::openal::deleteBuffer')
        static function deleteBuffer(buffer:ALuint) : Void;

            @:native('linc::openal::sourceQueueBuffer')
        static function sourceQueueBuffer(source:Int, buffer:ALuint) : Void;
            @:native('linc::openal::sourceUnqueueBuffer')
        static function sourceUnqueueBuffer(source:Int) : ALuint;


    //defines

        static inline var NONE : Int                                = 0;
        static inline var FALSE : Int                               = 0;
        static inline var TRUE : Int                                = 1;

        static inline var SOURCE_RELATIVE : Int                     = 0x202;
        static inline var CONE_INNER_ANGLE : Int                    = 0x1001;
        static inline var CONE_OUTER_ANGLE : Int                    = 0x1002;
        static inline var PITCH : Int                               = 0x1003;
        static inline var POSITION : Int                            = 0x1004;
        static inline var DIRECTION : Int                           = 0x1005;
        static inline var VELOCITY : Int                            = 0x1006;
        static inline var LOOPING : Int                             = 0x1007;
        static inline var BUFFER : Int                              = 0x1009;
        static inline var GAIN : Int                                = 0x100A;
        static inline var MIN_GAIN : Int                            = 0x100D;
        static inline var MAX_GAIN : Int                            = 0x100E;
        static inline var ORIENTATION : Int                         = 0x100F;
        static inline var SOURCE_STATE : Int                        = 0x1010;
        static inline var INITIAL : Int                             = 0x1011;
        static inline var PLAYING : Int                             = 0x1012;
        static inline var PAUSED : Int                              = 0x1013;
        static inline var STOPPED : Int                             = 0x1014;
        static inline var BUFFERS_QUEUED : Int                      = 0x1015;
        static inline var BUFFERS_PROCESSED : Int                   = 0x1016;
        static inline var REFERENCE_DISTANCE : Int                  = 0x1020;
        static inline var ROLLOFF_FACTOR : Int                      = 0x1021;
        static inline var CONE_OUTER_GAIN : Int                     = 0x1022;
        static inline var MAX_DISTANCE : Int                        = 0x1023;
        static inline var SEC_OFFSET : Int                          = 0x1024;
        static inline var SAMPLE_OFFSET : Int                       = 0x1025;
        static inline var BYTE_OFFSET : Int                         = 0x1026;
        static inline var SOURCE_TYPE : Int                         = 0x1027;
        static inline var STATIC : Int                              = 0x1028;
        static inline var STREAMING : Int                           = 0x1029;
        static inline var UNDETERMINED : Int                        = 0x1030;
        static inline var FORMAT_MONO8 : Int                        = 0x1100;
        static inline var FORMAT_MONO16 : Int                       = 0x1101;
        static inline var FORMAT_STEREO8 : Int                      = 0x1102;
        static inline var FORMAT_STEREO16 : Int                     = 0x1103;
        static inline var FREQUENCY : Int                           = 0x2001;
        static inline var BITS : Int                                = 0x2002;
        static inline var CHANNELS : Int                            = 0x2003;
        static inline var SIZE : Int                                = 0x2004;
        static inline var NO_ERROR : Int                            = 0;
        static inline var INVALID_NAME : Int                        = 0xA001;
        static inline var INVALID_ENUM : Int                        = 0xA002;
        static inline var INVALID_VALUE : Int                       = 0xA003;
        static inline var INVALID_OPERATION : Int                   = 0xA004;
        static inline var OUT_OF_MEMORY : Int                       = 0xA005;
        static inline var VENDOR : Int                              = 0xB001;
        static inline var VERSION : Int                             = 0xB002;
        static inline var RENDERER : Int                            = 0xB003;
        static inline var EXTENSIONS : Int                          = 0xB004;


        static inline var DOPPLER_FACTOR:Int                        = 0xC000;
        static inline var SPEED_OF_SOUND:Int                        = 0xC003;
        static inline var DOPPLER_VELOCITY:Int                      = 0xC001;

        static inline var DISTANCE_MODEL:Int                        = 0xD000;
        static inline var INVERSE_DISTANCE:Int                      = 0xD001;
        static inline var INVERSE_DISTANCE_CLAMPED:Int              = 0xD002;
        static inline var LINEAR_DISTANCE:Int                       = 0xD003;
        static inline var LINEAR_DISTANCE_CLAMPED:Int               = 0xD004;
        static inline var EXPONENT_DISTANCE:Int                     = 0xD005;
        static inline var EXPONENT_DISTANCE_CLAMPED:Int             = 0xD006;

} //AL


@:include('linc_openal.h')
#if !display
@:build(linc.Linc.touch())
#end
extern class ALC {

// contexts

        @:native('linc::openal::createContext')
    public static function createContext(device:Device, ?attrlist:Array<Int>) : Context;
        @:native('alcMakeContextCurrent')
    public static function makeContextCurrent(context:Context) : Bool;
        @:native('alcProcessContext')
    public static function processContext(context:Context) : Void;
        @:native('alcSuspendContext')
    public static function suspendContext(context:Context) : Void;
        @:native('alcDestroyContext')
    public static function destroyContext(context:Context) : Void;
        @:native('alcGetCurrentContext')
    public static function getCurrentContext() : Context;
        @:native('alcGetContextsDevice')
    public static function getContextsDevice(context:Context) : Device;

// android
#if android

        @:native('linc::openal::androidSuspend')
    public static function androidSuspend() : Void;
        @:native('linc::openal::androidResume')
    public static function androidResume() : Void;

#end

// devices

        @:native('alcOpenDevice')
    public static function openDevice(?devicename:String) : Device;
        @:native('alcCloseDevice')
    public static function closeDevice(device:Device) : Bool;
        @:native('alcGetError')
    public static function getError(device:Device) : Int;
        @:native('alcGetString')
    public static function getString(device:Device, param:Int) : String;
        @:native('alcGetIntegerv')
    public static function getIntegerv(device:Device, param:Int, size:Int) : Array<Int>;

//defines

    public static inline var FALSE : Int                           = 0;
    public static inline var TRUE : Int                            = 1;
    public static inline var FREQUENCY : Int                       = 0x1007;
    public static inline var REFRESH : Int                         = 0x1008;
    public static inline var SYNC : Int                            = 0x1009;
    public static inline var MONO_SOURCES : Int                    = 0x1010;
    public static inline var STEREO_SOURCES : Int                  = 0x1011;
    public static inline var NO_ERROR : Int                        = 0;
    public static inline var INVALID_DEVICE : Int                  = 0xA001;
    public static inline var INVALID_CONTEXT : Int                 = 0xA002;
    public static inline var INVALID_ENUM : Int                    = 0xA003;
    public static inline var INVALID_VALUE : Int                   = 0xA004;
    public static inline var OUT_OF_MEMORY : Int                   = 0xA005;
    public static inline var ATTRIBUTES_SIZE : Int                 = 0x1002;
    public static inline var ALL_ATTRIBUTES : Int                  = 0x1003;
    public static inline var DEFAULT_DEVICE_SPECIFIER : Int        = 0x1004;
    public static inline var DEVICE_SPECIFIER : Int                = 0x1005;
    public static inline var EXTENSIONS : Int                      = 0x1006;

    public static inline var ENUMERATE_ALL_EXT : Int               = 1;
    public static inline var DEFAULT_ALL_DEVICES_SPECIFIER : Int   = 0x1012;
    public static inline var ALL_DEVICES_SPECIFIER : Int           = 0x1013;

} //ALC


//Convenience classes


    /** A convenience class for finding out the value of an AL error code. */
class ALError {

    public static var INVALID_NAME : String             = "AL.INVALID_NAME: Invalid parameter name";
    public static var INVALID_ENUM : String             = "AL.INVALID_ENUM: Invalid enum value";
    public static var INVALID_VALUE : String            = "AL.INVALID_VALUE: Invalid parameter value";
    public static var INVALID_OPERATION : String        = "AL.INVALID_OPERATION: Illegal operation or call";
    public static var OUT_OF_MEMORY : String            = "AL.OUT_OF_MEMORY: OpenAL has run out of memory";

    public static function desc( error:Int ) : String {

        if(error == AL.INVALID_NAME)       {  return INVALID_NAME;  }
        if(error == AL.INVALID_ENUM)       {  return INVALID_ENUM;  }
        if(error == AL.INVALID_VALUE)      {  return INVALID_VALUE;  }
        if(error == AL.INVALID_OPERATION)  {  return INVALID_OPERATION;  }
        if(error == AL.OUT_OF_MEMORY)      {  return OUT_OF_MEMORY;  }

        return "AL.NO_ERROR: No Error";

    } //desc

} //ALError


    /** A convenience class for finding out the value of an ALC error code. */
class ALCError {

    public static var NO_ERROR        = "ALC.NO_ERROR: No Error";
    public static var INVALID_DEVICE  = "ALC.INVALID_DEVICE: Invalid device (or no device?)";
    public static var INVALID_CONTEXT = "ALC.INVALID_CONTEXT: Invalid context (or no context?)";
    public static var INVALID_ENUM    = "ALC.INVALID_ENUM: Invalid enum value";
    public static var INVALID_VALUE   = "ALC.INVALID_VALUE: Invalid param value";
    public static var OUT_OF_MEMORY   = "ALC.OUT_OF_MEMORY: OpenAL has run out of memory";
    public static var UNKNOWN_ERROR   = "ALC.NO_ERROR: Unknown Error";

    public static function desc(error:Int) : String {

        return switch(error) {
            case ALC.INVALID_DEVICE:   INVALID_DEVICE;
            case ALC.INVALID_CONTEXT:  INVALID_CONTEXT;
            case ALC.INVALID_ENUM:     INVALID_ENUM;
            case ALC.INVALID_VALUE:    INVALID_VALUE;
            case ALC.OUT_OF_MEMORY:    OUT_OF_MEMORY;
            case ALC.NO_ERROR:         NO_ERROR;
            case _:                    '$UNKNOWN_ERROR ($error)';
        }

    } //desc

} //ALCError



//Internal

    @:native("ALCdevice")
    @:include('linc_openal.h')
    private extern class ALCdevice { }

    @:native("ALCcontext")
    @:include('linc_openal.h')
    private extern class ALCcontext {}
