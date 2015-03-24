
#include "./snowkit_openal.h"

#ifndef SNOWKIT_OPENAL_CPP
#define SNOWKIT_OPENAL_CPP

    #include <hxcpp.h>

    namespace snowkit_openal {

        //AL helpers

            int genSource() {
                ALuint source;
                alGenSources( (ALuint)1, &source);
                return (int)source;
            }

            void deleteSource(ALuint source) {
                alDeleteSources( (ALuint)1, &source);
            }

            int genBuffer() {
                ALuint buffer;
                alGenBuffers( (ALuint)1, &buffer );
                return (int)buffer;
            }

            void deleteBuffer(ALuint buffer) {
                alDeleteBuffers( (ALuint)1, &buffer );
            }

            void bufferData( ALuint buffer, ALuint format, ALuint frequency, Array< unsigned char > bytes, ALuint byteOffset, ALuint byteLength) {
                alBufferData( buffer, format, &bytes[0] + byteOffset, byteLength, frequency );
            }

        //ALC helpers

            ALCcontext* createContext(ALCdevice* device, Array<ALCint> attr_list ) {
                return alcCreateContext(device, (attr_list != null()) ? &attr_list[0] : 0 );
            }

    } //snowkit_openal namespace

#endif