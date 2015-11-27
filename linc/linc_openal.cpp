//This file is included, so this is required!
#ifndef _LINC_OPENAL_CPP_
#define _LINC_OPENAL_CPP_

#include "./linc_openal.h"
#include <hxcpp.h>

    namespace linc {

        namespace openal {

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

            Array<int> genBuffers(int count, Array<int> into) {
                
                #if HX_DEBUG
                if(into == null() || into->length < count) {
                    HX_STACK_DO_THROW(::String("linc::openal::genBuffers passed null or an array that is too small in length for the requested size"));
                    return into;
                }
                #endif

                alGenBuffers( (ALuint)1, reinterpret_cast<ALuint*>(&into[0]) );

                return into;

            }

            void deleteBuffers(Array<int> buffers) {
                
                alDeleteBuffers((ALuint)buffers->length, reinterpret_cast<ALuint*>(&buffers[0]));

            } //deleteBuffers


            void bufferData( ALuint buffer, ALuint format, ALuint frequency, Array< unsigned char > bytes, ALuint byteOffset, ALuint byteLength) {
                alBufferData( buffer, format, &bytes[0] + byteOffset, byteLength, frequency );
            }

            int getSourcei(ALuint source, int param) {
                
                int res;

                    alGetSourcei(source, param, &res);

                return res;

            } //getSourcei

            float getSourcef(ALuint source, int param) {
                
                float res;

                    alGetSourcef(source, param, &res);

                return res;
            
            } //getSourcef

            Array<int> getSource3i(ALuint source, int param, Array<int> into) {

                #if HX_DEBUG
                if(into == null() || into->length < 3) {
                    HX_STACK_DO_THROW(::String("linc::openal::getSource3i passed null or an array with < 3 length"));
                    return into;
                }
                #endif

                int res1, res2, res3;

                    alGetSource3i(source, param, &res1, &res2, &res2);

                    into[0] = res1;
                    into[1] = res2;
                    into[2] = res3;

                return into;

            }

            Array<Float> getSource3f(ALuint source, int param, Array<float> into) {

                #if HX_DEBUG
                if(into == null() || into->length < 3) {
                    HX_STACK_DO_THROW(::String("linc::openal::getSource3f passed null or an array with < 3 length"));
                    return into;
                }
                #endif

                float res1, res2, res3;

                    alGetSource3f(source, param, &res1, &res2, &res2);

                    into[0] = res1;
                    into[1] = res2;
                    into[2] = res3;

                return into;

            }

        //ALC helpers

            ALCcontext* createContext(ALCdevice* device, Array<ALCint> attr_list ) {
                return alcCreateContext(device, (attr_list != null()) ? &attr_list[0] : 0 );
            }

        } //openal namespace

    } //linc namespace

#endif //_LINC_OPENAL_CPP_