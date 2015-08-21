
import openal.AL;

    #if (!mac && !android && !ios && !linux && !windows)
        #error "You should define a target, please read build.hxml"
    #end


class Test {

    static var device : Device;
    static var context : Context;

    static var source : Int;
    static var buffer : Int;

    static function main() {

        if(init()) {
            create_sound();
            play_sound();
            destroy_sound();
            destroy();
        }

    }

    static function init() {

        device = ALC.openDevice();

        if(device == null) {
            trace('failed / couldn\'t create device!');
            return false;
        }

        trace('created device / ${device} / ${ ALCError.desc(ALC.getError(device)) }');

        context = ALC.createContext( device, null );

        if(context == null) {
            trace('failed / couldn\'t create context!');
            return false;
        }

        trace('created context / ${context} / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.makeContextCurrent( context );

        trace('set current context / ${ ALCError.desc(ALC.getError(device)) }');

        return true;

    } //init

    static function destroy() {

        ALC.makeContextCurrent( cast null );

        trace('cleared current context / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.destroyContext( context );
        context = null;

        trace('destroyed context / ${ ALCError.desc(ALC.getError(device)) }');

        ALC.closeDevice( device );
        device = null;

        trace('closed device / ${ ALCError.desc(ALC.getError(device)) }');

    } //destroy

    static function create_sound() {

        source = AL.genSource();

        trace('generated source for sound / ${ALError.desc(AL.getError())} ');

        AL.sourcef( source, AL.PITCH, 1.0 );
        AL.sourcef( source, AL.GAIN, 1.0 );
        AL.source3f( source, AL.POSITION, 0.0, 0.0, 0.0 );
        AL.source3f( source, AL.VELOCITY, 0.0, 0.0, 0.0 );
        AL.sourcei( source, AL.LOOPING, AL.FALSE );

        buffer = AL.genBuffer();

        trace('generated buffer for sound / ${ALError.desc(AL.getError())} ');

        var format = AL.FORMAT_MONO16;
        var sounddata = haxe.Resource.getBytes('sound.pcm');

            //give the data from the sound to the buffer
        AL.bufferData(buffer, format, 44100, sounddata.getData(), 0, sounddata.length );

            trace('buffered data / ${ALError.desc(AL.getError())} ');

            //give the buffer to the source
        AL.sourcei(source, AL.BUFFER, buffer);

            trace('assigned buffer to source / ${ALError.desc(AL.getError())} ');

    }

    static function destroy_sound() {

        AL.deleteSource(source);

        trace('destroyed source / ${ALError.desc(AL.getError())} ');

        AL.deleteBuffer(buffer);

        trace('destroyed buffer / ${ALError.desc(AL.getError())} ');

    } //destroy_sound

    static function play_sound() {

        AL.sourcePlay(source);

        trace('played sound / ${ALError.desc(AL.getError())} ');

        Sys.sleep(1);

    } //play_sound

}